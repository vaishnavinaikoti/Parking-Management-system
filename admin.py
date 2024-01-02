from django.contrib import admin
from .models import ParkingSpaces, Reservations, Transactions, FeedbackAndComplaints, MaintenanceRequests, EmergencyContacts, VehicleRegistration, EventCalendar, WeatherConditions, FeedbackRatings, PromotionsAndDiscounts, MaintenanceLog, UserNotifications, FeedbackReplies, PaymentMethods, ParkingLotFees, BookingRequests

@admin.register(ParkingSpaces)
class ParkingSpacesAdmin(admin.ModelAdmin):
    list_display = ['space_number', 'location', 'available', 'vehicle_type', 'hourly_rate', 'daily_rate', 'monthly_rate']
    list_filter = ['available', 'vehicle_type']
    search_fields = ['space_number', 'location', 'vehicle_type']

@admin.register(Reservations)
class ReservationsAdmin(admin.ModelAdmin):
    list_display = ['ReservationID', 'UserID', 'SpaceID', 'ReservationDate', 'CheckInTime', 'CheckOutTime', 'TotalCost']
    list_filter = ['ReservationDate', 'CheckInTime', 'CheckOutTime']
    search_fields = ['ReservationID', 'UserID', 'SpaceID']

@admin.register(Transactions)
class TransactionsAdmin(admin.ModelAdmin):
    list_display = ['TransactionID', 'UserID', 'SpaceID', 'TransactionDate', 'PaymentAmount', 'PaymentMethod', 'PaymentStatus']
    list_filter = ['TransactionDate', 'PaymentMethod', 'PaymentStatus']
    search_fields = ['TransactionID', 'UserID', 'SpaceID']

@admin.register(FeedbackAndComplaints)
class FeedbackAndComplaintsAdmin(admin.ModelAdmin):
    list_display = ['FeedbackID', 'FeedbackDate', 'FeedbackMessage']
    list_filter = ['FeedbackDate']
    search_fields = ['FeedbackID']

@admin.register(MaintenanceRequests)
class MaintenanceRequestsAdmin(admin.ModelAdmin):
    list_display = ['RequestID', 'SpaceID', 'RequestedBy', 'RequestDate', 'Description', 'Status']
    list_filter = ['RequestDate', 'Status']
    search_fields = ['RequestID', 'SpaceID', 'RequestedBy']

@admin.register(EmergencyContacts)
class EmergencyContactsAdmin(admin.ModelAdmin):
    list_display = ['ContactID', 'UserID', 'ContactName', 'Relationship', 'PhoneNumber', 'Email']
    list_filter = ['Relationship']
    search_fields = ['ContactID', 'UserID', 'ContactName']

@admin.register(VehicleRegistration)
class VehicleRegistrationAdmin(admin.ModelAdmin):
    list_display = ['RegistrationID', 'UserID', 'VehicleType', 'LicensePlateNumber', 'RegistrationDate', 'ExpiryDate']
    list_filter = ['RegistrationDate', 'ExpiryDate']
    search_fields = ['RegistrationID', 'UserID', 'LicensePlateNumber']

@admin.register(EventCalendar)
class EventCalendarAdmin(admin.ModelAdmin):
    list_display = ['EventID', 'EventName', 'EventDate', 'Location', 'Description', 'Organizer']
    list_filter = ['EventDate']
    search_fields = ['EventID', 'EventName', 'Location']

@admin.register(WeatherConditions)
class WeatherConditionsAdmin(admin.ModelAdmin):
    list_display = ['WeatherID', 'SpaceID', 'DateTime', 'Temperature', 'Precipitation', 'WindSpeed', 'WeatherDescription']
    list_filter = ['DateTime', 'Temperature', 'Precipitation', 'WindSpeed']
    search_fields = ['WeatherID', 'SpaceID']

@admin.register(FeedbackRatings)
class FeedbackRatingsAdmin(admin.ModelAdmin):
    list_display = ['RatingID', 'FeedbackID', 'RatingValue', 'RatedBy']
    list_filter = ['RatingValue']
    search_fields = ['RatingID', 'FeedbackID', 'RatedBy']

@admin.register(PromotionsAndDiscounts)
class PromotionsAndDiscountsAdmin(admin.ModelAdmin):
    list_display = ['PromotionID', 'PromotionName', 'Description', 'ValidityPeriod', 'DiscountAmount', 'ApplicableConditions']
    list_filter = ['ValidityPeriod', 'DiscountAmount']
    search_fields = ['PromotionID', 'PromotionName']

@admin.register(MaintenanceLog)
class MaintenanceLogAdmin(admin.ModelAdmin):
    list_display = ['LogID', 'SpaceID', 'MaintenanceDate', 'MaintenanceDescription', 'MaintenanceType']
    list_filter = ['MaintenanceDate', 'MaintenanceType']
    search_fields = ['LogID', 'SpaceID']

@admin.register(UserNotifications)
class UserNotificationsAdmin(admin.ModelAdmin):
    list_display = ['NotificationID', 'UserID', 'NotificationDate', 'NotificationType', 'Message', 'Status']
    list_filter = ['NotificationDate', 'NotificationType', 'Status']
    search_fields = ['NotificationID', 'UserID']

@admin.register(FeedbackReplies)
class FeedbackRepliesAdmin(admin.ModelAdmin):
    list_display = ['ReplyID', 'FeedbackID', 'RepliedBy', 'ReplyDate', 'ReplyMessage']
    list_filter = ['ReplyDate']
    search_fields = ['ReplyID', 'FeedbackID', 'RepliedBy']

@admin.register(PaymentMethods)
class PaymentMethodsAdmin(admin.ModelAdmin):
    list_display = ['PaymentMethodID', 'UserID', 'PaymentMethodType', 'PaymentCardNumber', 'ExpiryDate', 'BillingAddress']
    list_filter = ['PaymentMethodType', 'ExpiryDate']
    search_fields = ['PaymentMethodID', 'UserID', 'PaymentCardNumber']

@admin.register(ParkingLotFees)
class ParkingLotFeesAdmin(admin.ModelAdmin):
    list_display = ['FeeID', 'SpaceID', 'FeeDate', 'FeeAmount']
    list_filter = ['FeeDate', 'FeeAmount']
    search_fields = ['FeeID', 'SpaceID']

@admin.register(BookingRequests)
class BookingRequestsAdmin(admin.ModelAdmin):
    list_display = ['RequestID', 'UserID', 'SpaceID', 'RequestDate', 'CheckInDate', 'CheckOutDate', 'Status']
    list_filter = ['RequestDate', 'CheckInDate', 'CheckOutDate', 'Status']
    search_fields = ['RequestID', 'UserID', 'SpaceID']

    