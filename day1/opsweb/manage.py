#!/usr/bin/env python
# source /home/zhourudong/.pyenv/versions/2.7.13/envs/reboot2.7.13env/bin/activate
import os
import sys

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "opsweb.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
