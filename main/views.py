import os

from django.http import HttpResponse
from django.shortcuts import render

from main.tool.textrank import textrank
from main import models

from main.models import Article, Tags


from urllib import request

from django.contrib import messages
from django.contrib.auth import login, authenticate
from django.contrib.auth.hashers import make_password
from django.http import HttpResponseRedirect, HttpResponseBadRequest
from django.shortcuts import render, redirect
from django.urls import reverse
from django.views import View

from main.forms import AuthorRegisterForm, AuthorLoginForm
from main.models import Author, AuthorProfile

from django.views.decorators.http import require_http_methods
from django.http import HttpResponse
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.models import User


def clear(request):
    request.session.flush()
    return redirect("/")



def author_register_login(request):
    # request.session.flush()   #清除当前浏览器及数据库session
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        if 'username' in request.POST and 'password' in request.POST and 'confirm_password' in request.POST:
            if password != confirm_password:
                messages.error(request, '两次密码输入不一致')
                return HttpResponse('信息输入有误，请返回重试')
            else:
                try:
                    user = User.objects.create_user(username=username, password=password)
                    user.save()
                    request.session['username'] = username
                    return redirect('/registersuccess')
                except:
                    return redirect('/registerfail')

        elif 'username' in request.POST and 'password' in request.POST:
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                request.session['username'] = username
                return redirect("/main/information")
            else:
                messages.error(request, '用户名或密码不正确')
                return HttpResponse('信息输入有误，请返回重新输入')
        else:
            return HttpResponse('致命错误')

    elif request.method == "GET":
        if 'username' in request.session:
            return redirect("/main/information")
        else:
            return render(request, 'login.html')

def register_success(request):
    return render(request, "registersuccess.html")

def register_fail(request):
    return render(request, "registerfail.html")




# Create your views here.
def index(request):
    user_id = request.session["username"]  # 这里从session提取的是用户名而不是数据库里的id,这里的user_id要换成动态从session中提取（从登录起就要一直有）
    if not models.User.objects.filter(name=user_id):
        return HttpResponse("暂无文章，请发表后再来！")
    user_fb = models.User.objects.filter(name=user_id).first().text.last()
    article = user_fb.text
    article_list = article.split()
    cut = article_list[:100:1]
    article_short = "".join(cut)
    user = models.User.objects.filter(name=user_id).first()
    tags = models.User_Tags.objects.filter(user=user)
    tags_sh = list()
    num = 1
    for i in tags:
        if num > 3:
            break
        tags_sh.append(i.tag)
        num = num+1
    testtag = models.Tags.objects.first().tag
    if not (tags_sh[0]):
        tags.append(testtag)
    if not (tags_sh[1]):
        tags_sh.append(tags_sh[0])
    if not (tags_sh[2]):
        tags_sh.append(tags_sh[1])
    data = {
        "title": user_fb.title,
        "article_sh": article_short,
        "tags_sh1": tags_sh[0],
        "tags_sh2": tags_sh[1],
        "tags_sh3": tags_sh[2],
    }
    return render(request, 'index.html', context=data)


def passages_sub(request):
    name = request.session["username"] # 这里的user_id要换成动态从session中提取（从登录起就要一直有）
    if request.method == "GET":
        return render(request, 'passages_sub.html', context=None)
    if request.method == "POST":
        """后期可以用form组件优化下这个部分,图片到时候可以加上"""
        passage = request.POST.get('desc')
        title = request.POST.get('title')
        # 暂时不要以下的，后期优化再添加
        # tag = request.POST.get('tag')
        # pic = request.POST.get('images')

        # 引用数据,并标签化
        tags = textrank(passage)
        # 存入标签总库（后期有查重后，将查重放入最上方，作为第一条件判断，不符合后面代码都不运行，同样也不会污染标签库了）a
        for i in tags:
            Judge = models.Tags.objects.filter(tag=i)
            if not Judge:  # 判断库中是否有重复标签，如果没有则加入标签总库
                models.Tags.objects.create(tag=i)
            else:
                Judge.first().number += 1  # 自增次数   （优化建议：顺便把jieba的词频加权也导入，而非加1，因为加1并不准确，而是一个小于1的加权值，或者直接编写一个新的更新语料库的接口放在这）

        # 用户与文章进行一对多绑定(需判断用户是否存在)
        if not models.User.objects.filter(name=name):
            temp = models.User.objects.create(name=name)
        else:
            temp = models.User.objects.get(name=name)
        temp3 = models.Article.objects.create(title = title,text= passage, user=temp)
        # 文章没有判定抄袭的机制，同一用户或者不同用户可以发表同一篇文章，这里可以添加查重模块（尽可能加入查重，不然会污染标签库）

        # 测试文章与用户关联是否成功
        a = models.User.objects.filter(name='yimi').first().text.first().text  # 先找到对应name的user对象，然后反查外键值text，得到的是个字典集合，用.first（）引用第一个字典，然后输出字典中的text(这里的text是Article类里存文章的字符串text)
        b = models.Article.objects.filter(id=1).first().user.name
        print(a, b)

        # 用户与用户标签进行多对多绑定
        temp1 = temp  # 上面用户重复性已经判断，直接赋值temp就行
        for i in tags:  # 一篇文章有多个标签，用for逐一判断每个标签
            if not models.User_Tags.objects.filter(tag=i):
                temp2 = models.User_Tags.objects.create(tag=i)
            else:
                temp2 = models.User_Tags.objects.get(tag=i)
            temp2.user.add(temp1)  # temp2便是标签，temp1就是用户，temp2的外键赋值temp1，建立关联（用add，别用create）

        # # 测试用户的标签和标签对应用户是否成功
        # a = temp1.tag.all()
        # for i in a:
        #     print(i.tag)
        # b = models.User_Tags.objects.get(tag="政权")
        # print('标签：' + b.tag, '同标签的人：', b.user.all())

        # 文章与标签进行多对多绑定
        temp1 = temp3  # temp3已经在上面导入数据库时便赋值
        for i in tags:  # 一篇文章有多个标签，用for逐一判断每个标签
            temp2 = models.User_Tags.objects.get(tag=i)  # 上面用户和标签匹配已经循环判断过是否重复，没必要再filter一遍，直接get就行
            temp2.text.add(temp1)  # temp2便是标签，temp1就是文章，temp2的外键赋值temp1，建立关联（用add，别用create）

        # # 测试文章的标签和标签对应文章是否成功
        # a = temp1.user_tag.all()  # 和上面的temp1.tag.all()区分开来 （因为外键related_name定义不一样）
        # for i in a:
        #     print(i.tag)
        # b = models.User_Tags.objects.get(tag="政权")
        # print('标签：' + b.tag, '同标签的文章：', b.user.all())
        return HttpResponse("提交成功！")



def details(request):
    """得改下这部分，改下迂回部分，改成显示全部文章"""
    user_id = request.session["username"]  # 这里的user_id要换成动态从session中提取（从登录起就要一直有）
    if not models.User.objects.filter(name=user_id):
        return HttpResponse("暂无文章，请发表后再来！")
    user_fb = models.User.objects.filter(name=user_id).first().text.last()
    article = user_fb.text
    tag = user_fb.user_tag.all()
    data = {
        "article": article,
        # "tag": tag,
        "title": user_fb.title,
    }
    return render(request, "details.html", context=data)


def information(request):
    return render(request, "rules.html", context=None)


def tags(request):
    data = models.Tags.objects.all()
    return render(request, "tag.html", {"data": data})
def tag_match(request):
    #传回来的是tag
    point = request.GET.get("nid")
    data = models.User_Tags.objects.get(tag=point).text.all()
    return render(request, "tagmatch.html", {"data": data})
def art_match(request):
    #传回来的是id，不能是title，因为同名文章可能有多个，不是唯一搜索
    point = request.GET.get("nid")
    user_fb = models.Article.objects.get(id = point)
    article = user_fb.text
    tag = user_fb.user_tag.all()
    data = {
        "article": article,
        # "tag": tag,
        "title": user_fb.title,
    }
    return render(request, "details.html", context = data)



def community(request):
    return render(request, "community.html", context=None)


def self_information(request):
    user_id = request.session["username"]  # 这里的user_id要换成动态从session中提取（从登录起就要一直有）
    if not models.User.objects.filter(name=user_id):
        return HttpResponse("暂无文章，请发表后再来！")
    user = models.User.objects.filter(name=user_id).last()
    user_name = user.name
    u_id = user.id
    fb = user.tag.all()
    fb2 = user.text.all()
    article_num = "0"
    #用于处理标签为5个标签列表，防止标签过多爆掉
    num = 0
    tag_few = list()
    for i in fb:
        if num == 20:
            break
        tag_few.append(i.tag)
        num = num+1

    # if UserFeedback.objects.filter(user_id=user_id):
    #     i = 0
    #     for fb in UserFeedback.objects.filter(user_id=user_id):
    #         if i < 100:
    #             i = i + 1
    #         else:
    #             i = -1
    #             break
    #     if i == -1:
    #         article_num = "100+"
    #     else:
    #         article_num = str(i)
    num = 0
    for i in fb2:
        num = num+1
    if num > 100:
        article_num = "100+"
    else: article_num = str(num)
    data = {
        "name": user_name,
        "tag_few": tag_few,
        "article_num": article_num,
        "id": u_id
    }
    return render(request, "self-information.html", context=data)
