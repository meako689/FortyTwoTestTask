from django.urls import path

from apps.hello.api.views import PingView

app_name = "api_hello"

urlpatterns = [
    path("ping/", PingView.as_view(), name="ping"),
]
