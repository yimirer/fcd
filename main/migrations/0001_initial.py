# Generated by Django 4.1.7 on 2023-04-11 15:25

from django.db import migrations, models
import django.db.models.deletion
import django.utils.datetime_safe
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name="Article",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("title", models.TextField(default="标题")),
                ("text", models.TextField(default="文章", verbose_name="文章")),
                (
                    "submit_time",
                    models.DateTimeField(
                        default=django.utils.datetime_safe.datetime.now,
                        verbose_name="提交时间",
                    ),
                ),
            ],
            options={
                "db_table": "Article",
            },
        ),
        migrations.CreateModel(
            name="Author",
            fields=[
                (
                    "id",
                    models.UUIDField(
                        auto_created=True,
                        default=uuid.uuid4,
                        primary_key=True,
                        serialize=False,
                    ),
                ),
                (
                    "username",
                    models.CharField(
                        db_index=True, max_length=50, unique=True, verbose_name="登录账号"
                    ),
                ),
                ("password", models.CharField(max_length=50, verbose_name="登录密码")),
                (
                    "nickname",
                    models.CharField(
                        blank=True,
                        db_index=True,
                        max_length=20,
                        null=True,
                        unique=True,
                        verbose_name="作者昵称",
                    ),
                ),
                (
                    "age",
                    models.IntegerField(blank=True, default=0, verbose_name="作者年龄"),
                ),
                (
                    "gender",
                    models.CharField(
                        blank=True,
                        choices=[("0", "女"), ("1", "男")],
                        max_length=1,
                        null=True,
                        verbose_name="性别",
                    ),
                ),
                (
                    "email",
                    models.EmailField(
                        db_index=True, max_length=254, null=True, verbose_name="联系邮箱"
                    ),
                ),
                (
                    "status",
                    models.CharField(
                        choices=[("0", "正常"), ("2", "删除"), ("1", "锁定")],
                        help_text="必须选择其中一个状态",
                        max_length=5,
                        verbose_name="用户状态",
                    ),
                ),
                (
                    "create_time",
                    models.DateTimeField(auto_now_add=True, verbose_name="注册时间"),
                ),
                (
                    "update_time",
                    models.DateTimeField(auto_now=True, verbose_name="修改时间"),
                ),
                (
                    "personal_page",
                    models.URLField(blank=True, null=True, verbose_name="个人主页"),
                ),
                ("intro", models.TextField(blank=True, null=True, verbose_name="个人介绍")),
                (
                    "remark",
                    models.TextField(blank=True, null=True, verbose_name="备注信息"),
                ),
            ],
            options={
                "verbose_name_plural": "作者",
            },
        ),
        migrations.CreateModel(
            name="Tags",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("tag", models.CharField(max_length=10)),
                ("number", models.IntegerField(default=0)),
            ],
            options={
                "db_table": "Tags",
            },
        ),
        migrations.CreateModel(
            name="User",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=20)),
            ],
            options={
                "db_table": "User",
            },
        ),
        migrations.CreateModel(
            name="User_Tags",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("tag", models.CharField(max_length=10)),
                (
                    "text",
                    models.ManyToManyField(related_name="user_tag", to="main.article"),
                ),
                ("user", models.ManyToManyField(related_name="tag", to="main.user")),
            ],
            options={
                "db_table": "User_Tags",
            },
        ),
        migrations.CreateModel(
            name="AuthorProfile",
            fields=[
                (
                    "id",
                    models.UUIDField(
                        auto_created=True,
                        default=uuid.uuid4,
                        primary_key=True,
                        serialize=False,
                        verbose_name="扩展资料编号",
                    ),
                ),
                ("fans_count", models.IntegerField(default=0, verbose_name="粉丝数量")),
                ("visited_count", models.IntegerField(default=0, verbose_name="访问次数")),
                ("words_count", models.IntegerField(default=0, verbose_name="文章字数")),
                ("article_count", models.IntegerField(default=0, verbose_name="文章篇数")),
                (
                    "collected_count",
                    models.IntegerField(default=0, verbose_name="收藏总数"),
                ),
                ("admired_count", models.IntegerField(default=0, verbose_name="点赞总数")),
                (
                    "author",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE, to="main.author"
                    ),
                ),
            ],
        ),
        migrations.AddField(
            model_name="article",
            name="user",
            field=models.ForeignKey(
                on_delete=django.db.models.deletion.CASCADE,
                related_name="text",
                to="main.user",
            ),
        ),
    ]
