from django.conf.urls import url
from .views import AddProductView, ProductsGetView, ProductManageView, ProductManageGetView

urlpatterns = [

    url(r'^product/add/$', AddProductView.as_view(), name="product_add"),
    url(r'^product/get/$', ProductsGetView.as_view()),
    url(r'^product/manage/$', ProductManageView.as_view(), name="product_manage"),
    url(r'^product/manage/get/$', ProductManageGetView.as_view()),

]
