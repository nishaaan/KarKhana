from django.contrib import admin
from . import models

# username = admin, pw = admin
#registering models
admin.site.register(models.User)
admin.site.register(models.VendorRequest)
admin.site.register(models.Cart)
admin.site.register(models.Charges)
admin.site.register(models.VendorBusinessDetails)
admin.site.register(models.Feedback)
admin.site.register(models.ReviewsRatings)
@admin.register(models.Deals)
class DealsAdmin(admin.ModelAdmin):
    list_display=['deal_title', 'deal_category']


admin.site.register(models.CouponActive)
admin.site.register(models.EmailNotificationModel)