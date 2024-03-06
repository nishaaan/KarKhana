from dj_rest_auth.registration.views import VerifyEmailView
from django.contrib import admin
from django.urls import path,include
from . import views
from karkhana_app.views import CartDelete, CartGetCreate, CartListByUser, ChargesView, ChargesViewAll, CouponItemsViews, CouponListByUser, CouponListByVendor, CouponUpdate, CustomerRegistrationView, DealsGCUView, DealsView, ReviewRatingViews, ReviewsRatingsByBusiness, TodoGetCreate, TodoUpdateDelete, VendorRegistrationView, vendorForm, SendEmailNotification, FeedbackView  #GoogleLogin



urlpatterns = [
    path('auth/',include('dj_rest_auth.urls')),
    path('auth/registration/',include('dj_rest_auth.registration.urls')),
    path('auth/confirm-email/', VerifyEmailView.as_view(), name='account_email_verification_sent'),
    # path('auth/user/', UserDetailView.as_view(), name='user_detail'),

    # path('accounts/auth/login/', views.login_view, name='login'),
    # path('accounts/auth/user/', views.user_details_view, name='user-details'),
    
    
    # for registeration of vendor and customer
    path('registration/customer/', CustomerRegistrationView.as_view(), name = 'Customer Register' ),
    path('registration/vendor/', VendorRegistrationView.as_view(), name = 'Vendor Register' ),
    
    
    
    # to post vendor details for registration process
    path('unverifiedVendor/',vendorForm.as_view(), name='Unverified Vendors'),
    
    
    # to send notification to specific user
    path('send-email-notification/',SendEmailNotification.as_view()),
    
    # For vendor details
    path('VendorBusinessDetails/', TodoGetCreate.as_view()),
    path('VendorBusinessDetails/<int:pk>/', TodoUpdateDelete.as_view()),
    
    
    # for deals details
    path('deals/', DealsView.as_view()),
    path('deals/<str:vendor>/', DealsGCUView.as_view()),
    
    # for add to cart
    path('Cart/', CartGetCreate.as_view()),
    path('CartDelete/<int:pk>/', CartDelete.as_view()),
    path('Cart/<str:cart>/', CartListByUser.as_view(), name='deals-list-by-vendor'),
    
    # for coupon charge calculation
    path('Charges/', ChargesViewAll.as_view()),
    path('Charges/<int:pk>/', ChargesView.as_view()),
    # path('auth/google/', GoogleLogin.as_view(), name='google_login')
    
    
    # coupon
    path('Coupon/', CouponItemsViews.as_view()),
    path('Coupon/<int:pk>', CouponUpdate.as_view()),
    path('UserCoupon/<str:user>', CouponListByUser.as_view()),
    path('VendorCoupon/<str:vendor>', CouponListByVendor.as_view()),
    path('Feedback/', FeedbackView.as_view()),
    
    
    
    # Reviews & Ratings
    path('ReviewRating/', ReviewRatingViews.as_view()),
    path('ReviewRating/<str:business>', ReviewsRatingsByBusiness.as_view())
]
