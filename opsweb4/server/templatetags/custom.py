from django.template.defaulttags import register

from server.models import Product


@register.filter
def get_item(dictionary, key):
    if key is None:
        return ""
    # return dictionary.get(int(key), '')

    return Product.objects.get(pk=int(key))
