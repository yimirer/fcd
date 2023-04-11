from django.http import HttpResponse
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages


def author_register_login(request):
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
                    return redirect('/registersuccess')
                except:
                    return redirect('/registerfail')

        elif 'username' in request.POST and 'password' in request.POST:
            user = authenticate(request, username=username, password=password)
            if user is not None:
                login(request, user)
                return render(request, "index.html")
            else:
                messages.error(request, '用户名或密码不正确')
                return HttpResponse('信息输入有误，请返回重新输入')
        else:
            return HttpResponse('致命错误')

    elif request.method == "GET":
        return render(request, 'login.html')


def register_success(request):
    return render(request, "registersuccess.html")


def register_fail(request):
    return render(request, "registerfail.html")
