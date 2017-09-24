from django.forms import ModelForm
from .models import Server


class ModifyStatusForm(ModelForm):
    class Meta:
        model = Server
        fields = [ "status"]

