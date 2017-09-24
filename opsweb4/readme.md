## 项目结构

```bash
$ tree -L 1 opsweb4
    opsweb4
    ├── common          # 通用视图 404 error sucess等页面
    ├── manage.py
    ├── monitor         # 监控视图
    ├── opsweb4         # 项目配置相关
    ├── opsweb4.sql
    ├── product         # 业务线
    ├── requirements.txt
    ├── server          # 服务器
    ├── static
    ├── templates
    └── user_group      # 用户组相关
```

## 
**运行环境**
- `python 3.5.3` 
- `django-1.11`
- `dj-pagination` 分页
- `mysqlclient` # mysql链接驱动