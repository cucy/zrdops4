from django.template.defaulttags import register


@register.filter
def sssss(x,y):
    return int(x) * 3 * int(y)