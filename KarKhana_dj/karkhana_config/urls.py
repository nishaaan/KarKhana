

from django.conf import settings
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from karkhana_app.views import SendEmailNotification

urlpatterns = [
    path('admin/', admin.site.urls),
    path('accounts/', include('karkhana_app.urls')),
    path('all/', include('allauth.urls')),
    # path('api-auth/', include('rest_framework.urls')),
    # path('account/',include('allauth.urls'))
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
