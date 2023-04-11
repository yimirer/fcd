from django import forms

from django.utils.translation import gettext_lazy as _


from main.models import Author


def get_data_tooltip(info):
    """表单元素数据提示，主要是添加Bootstrap前端框架中提供的提示功能属性"""
    return {
        'data-toggle': 'tooltip',
        'data-trigger': 'hover',
        'data-delay': {'show': 500, 'hide': 100},
        'data-placement': 'top',
        'data-original-title': _(info),
        'class': 'form-control'
    }


class AuthorRegisterForm(forms.ModelForm):
    """用户注册表单"""
    # 确认密码
    confirm_password = forms.CharField(label='确认密码', min_length=6, max_length=18,
                                       widget=forms.PasswordInput)

    def clean_confirm_password(self):
        """确认密码验证"""
        password = self.cleaned_data['password']
        confirm_password = self.cleaned_data['confirm_password']
        if password != confirm_password:
            raise forms.ValidationError('两次密码输入不一致，请重新注册')
        return confirm_password

    class Meta:
        # 表单关联数据模型
        model = Author
        # 表单展示字段
        fields = ['username', 'password', 'confirm_password']

        # 指定表单视图组件
        widgets = {
            'username': forms.TextInput(
                attrs=get_data_tooltip('请输入6~18位字母、数字、下划线组成的账号')
            ),
            'password': forms.PasswordInput(
                attrs=get_data_tooltip('请输入6~18位密码')
            ),
            'confirm_password': forms.PasswordInput(
                attrs=get_data_tooltip('再次确认密码')
            ),

        }
        # 表单提示信息

        # 错误提示信息
        error_messages = {
            'username': {
                'unique': '该账号已经存在，请使用其他账号注册'
            }
        }


class AuthorLoginForm(forms.ModelForm):
    class Meta:
        model = Author
        fields = ['username', 'password']
        widgets = {
            'username': forms.TextInput(attrs=get_data_tooltip('请输入您的账号')),
            'password': forms.PasswordInput(attrs=get_data_tooltip('请输入密码'))
        }

    def clean(self):
        username = self.cleaned_data['username']
        password = self.cleaned_data['password']
        try:
            author = Author.objects.get(username=username, password=password)
            return author.__dict__
        except:
            raise forms.ValidationError("账号或者密码有误，请重新登录")
