#!/Library/Frameworks/Python.framework/Versions/3.9/bin/python3

import os
os.environ["FAV_COLOR"] = input('What is your favorite color? ')
os.environ["NAME"] = input('What is your name? ')
os.environ["UVA_GRAD"] = input('Are you graduating this May? ')

FAV_COLOR_ENV = os.getenv("FAV_COLOR")
NAME_ENV = os.getenv("NAME")
UVA_GRAD_ENV = os.getenv("UVA_GRAD")

print(FAV_COLOR_ENV)
print(NAME_ENV)
print(UVA_GRAD_ENV)
