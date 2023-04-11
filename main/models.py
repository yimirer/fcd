from django.db import models
from django.utils.datetime_safe import datetime


import uuid
from uuid import uuid4

from django.db import models
from django.utils import timezone


class Author(models.Model):
    """用户类型：博客作者"""
    objects = None
    GENDER = {
        ('0', '女'),
        ('1', '男'),
    }
    STATUS = {
        ('0', '正常'),
        ('1', '锁定'),
        ('2', '删除'),
    }
    # objects = None
    """作者编号"""
    # id = models.AutoField(primary_key=True, verbose_name='作者编号')
    """这里使用UUIDField唯一标识符"""
    id = models.UUIDField(primary_key=True, auto_created=True, default=uuid.uuid4)
    """登录账号"""
    username = models.CharField(max_length=50, verbose_name='登录账号',
                                unique=True, db_index=True)
    """登录密码"""
    password = models.CharField(max_length=50, verbose_name='登录密码')
    """用户昵称"""
    nickname = models.CharField(max_length=20, verbose_name='作者昵称',
                                unique=True, null=True, blank=True, db_index=True)
    """年龄"""
    age = models.IntegerField(default=0, verbose_name='作者年龄', blank=True)
    """性别"""
    gender = models.CharField(max_length=1, choices=GENDER,
                              verbose_name='性别', null=True, blank=True)
    """邮箱"""
    email = models.EmailField(verbose_name='联系邮箱', null=True, blank=False, db_index=True)
    """用户状态"""
    status = models.CharField(max_length=5, choices=STATUS,
                              verbose_name='用户状态', help_text='必须选择其中一个状态')
    """账号注册时间"""
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='注册时间')
    """最后修改时间"""
    update_time = models.DateTimeField(auto_now=True, verbose_name='修改时间')
    """个人主页"""
    personal_page = models.URLField(verbose_name='个人主页', null=True, blank=True)
    """个人介绍"""
    intro = models.TextField(verbose_name='个人介绍', null=True, blank=True)
    """备注信息"""
    remark = models.TextField(verbose_name='备注信息', null=True, blank=True)
    """自关联：关注作者"""

    # author_liked = models.ManyToManyField('self', related_name='author')

    class Meta:
        # 后台管理系统中的名称
        verbose_name_plural = '作者'

    def __str__(self):
        return "账号：{}；昵称：{}；".format(self.username, self.nickname)


class AuthorProfile(models.Model):
    """用户扩展资料"""
    """资料编号"""
    id = models.UUIDField(verbose_name='扩展资料编号', primary_key=True, auto_created=True, default=uuid4)
    fans_count = models.IntegerField(verbose_name='粉丝数量', default=0)
    visited_count = models.IntegerField(verbose_name='访问次数', default=0)
    words_count = models.IntegerField(verbose_name='文章字数', default=0)
    article_count = models.IntegerField(verbose_name='文章篇数', default=0)
    collected_count = models.IntegerField(verbose_name='收藏总数', default=0)
    admired_count = models.IntegerField(verbose_name='点赞总数', default=0)
    author = models.OneToOneField(Author, on_delete=models.CASCADE)
    """点赞的文章，多对多关系"""
    # article_admired = models.ManyToManyField('article.Article',
    #                                       related_name='articleadmired')
    # article_collected = models.ManyToManyField('article.Article',
    #                                          related_name='articlecollected')




# Create your models here.

# class WpUsers(models.Model):
#     id = models.BigAutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
#     user_login = models.CharField(max_length=60)
#     user_pass = models.CharField(max_length=255)
#     user_nicename = models.CharField(max_length=50)
#     user_email = models.CharField(max_length=100)
#     user_url = models.CharField(max_length=100)
#     user_registered = models.DateTimeField()
#     user_activation_key = models.CharField(max_length=255)
#     user_status = models.IntegerField()
#     display_name = models.CharField(max_length=250)
#
#     class Meta:
#         managed = True
#         db_table = 'Users'




# class UserFeedbackImages(models.Model):
# image = models.ImageField(upload_to='#',verbose_name=u'反馈图片', null=True, blank=True)




class User(models.Model):
    name = models.CharField(max_length=20)
    #后面什么邮箱，什么账号，用户名要添加再添加

    class Meta:
        db_table = 'User'

class User_Tags(models.Model):
    #用户标签
    tag = models.CharField(max_length=10)
    user = models.ManyToManyField("User", related_name='tag')
    text = models.ManyToManyField("Article", related_name='user_tag')
    class Meta:
        db_table = 'User_Tags'

# class UserFeedback(models.Model):
#     user = models.ForeignKey(WpUsers, verbose_name="用户", on_delete=models.CASCADE)
#     title = models.TextField(default="标题", null=False)
#     desc = models.TextField(default="文章", verbose_name=u'文章', null=False)
#     tag = models.TextField(verbose_name=u'标签', null=False)
#     # logfile = models.FileField(upload_to='#', verbose_name=u'log文件', null=True, blank=True)
#     submit_time = models.DateTimeField(default=datetime.now, verbose_name="提交时间")
#
#     class Meta:
#         db_table = 'Articles'
    # images = models.ManyToManyField("UserFeedbackImages", verbose_name=u'图片')


class Article(models.Model):
    #文章最大字数可修改
    title = models.TextField(default="标题", null=False)
    text = models.TextField(default="文章",verbose_name=u'文章',null=False)
    submit_time = models.DateTimeField(default=datetime.now, verbose_name="提交时间")
    user = models.ForeignKey("User", on_delete=models.CASCADE,related_name = 'text')
    class Meta:
        db_table = 'Article'


class Tags(models.Model): #次数不受文章删除影响，因为是拿来训练IDF用的，用户删除文章没必要删除标签出现次数
    #标签总库
    tag = models.CharField(max_length=10) #可进行优化：同类型同义标签归并一起
    number = models.IntegerField(default=0) #初始为 0
    class Meta:
        db_table = 'Tags'