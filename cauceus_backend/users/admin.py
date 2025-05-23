from django.contrib import admin
from .models import User
from django.contrib.auth.admin import UserAdmin

class CustomUserAdmin(UserAdmin):
    fieldsets = [
        (None, {
            'fields': ('username', 'password')
        }),
        ('Personal info', {
            'fields': ('first_name', 'last_name', 'email', 'country', 'city', 'postal_code', 'phone_number', 'preferred_contact_method')
        }),
        ('Permissions', {
            'fields': ('is_active', 'is_staff', 'is_superuser', 'groups', 'user_permissions')
        }),
        ('Important dates', {
            'fields': ('last_login', 'date_joined')
        }),
    ]

    list_display = ('__str__', 'username', 'city', 'country')

    add_fieldsets = (
            (None, {
                'classes': ('wide',),
                'fields': ('username', 'email', 'first_name', 'last_name', 'password', 'password2', 'country', 'city', 'postal_code', 'preferred_contact_method' )}
            ),
        )
admin.site.register(User, CustomUserAdmin)
