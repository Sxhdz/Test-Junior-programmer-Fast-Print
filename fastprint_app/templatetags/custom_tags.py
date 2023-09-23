from django import template
import locale

register = template.Library()

@register.filter(name='currency')
def currency(value):
    try:
        locale.setlocale(locale.LC_ALL, 'id_ID')  # Set lokalisasi ke Indonesia
        return locale.currency(value, grouping=True)
    except:
        return value
