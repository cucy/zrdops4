# zrdops4



## 权限
```python
In [1]: from django.contrib.auth.models import User # 导入用户
In [4]: from django.contrib.auth.models import  Permission # 导入权限
In [2]: user = User.objects.get(username='admin')
# 查看所有权限
In [3]: user.user_permissions.all()
Out[3]: []
# 删除权限
In [5]: user.user_permissions.remove(Permission.objects.get(pk=23))

# 添加权限
In [7]: user.user_permissions.add(Permission.objects.get(pk=28))

In [8]: user.user_permissions.all()
Out[8]: [<Permission: dashboard | server | 访问服务服务器信息>]
```