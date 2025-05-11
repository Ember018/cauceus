from django.urls import path
from .views import UserListView, UserDetailView, UserRegistrationView, LoginView, LogoutView

urlpatterns = [
    path('api/user_list/', UserListView.as_view(), name="user_list_api"),
    path('api/user/<int:pk>', UserDetailView.as_view(), name="user_detail_api"),
    path('api/register/', UserRegistrationView.as_view(), name="user_register_api"),
    path('api/login/', LoginView.as_view(), name="user_login_api"),
    path('api/logout/', LogoutView.as_view(), name="user_logout_api")
]
