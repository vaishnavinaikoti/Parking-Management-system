# from wagtail.snippets.models import register_snippet
# from wagtail.snippets.views.snippets import SnippetViewSet
# from .models import (ParkingSpaces, Reservations, Transactions, FeedbackAndComplaints, MaintenanceRequests, EmergencyContacts, VehicleRegistration, EventCalendar, WeatherConditions, FeedbackRatings, PromotionsAndDiscounts, MaintenanceLog, UserNotifications, FeedbackReplies, PaymentMethods, ParkingLotFees, BookingRequests)

# class ParkingSpacesAdmin(SnippetViewSet):
#     model = ParkingSpaces
#     menu_label = 'Parking Spaces'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['space_number', 'location', 'available', 'vehicle_type', 'hourly_rate', 'daily_rate', 'monthly_rate']
#     list_filter = ['available', 'vehicle_type']
#     search_fields = ['space_number', 'location', 'vehicle_type']

# class ReservationsAdmin(SnippetViewSet):
#     model = Reservations
#     menu_label = 'Reservations'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['ReservationID', 'UserID', 'SpaceID', 'ReservationDate', 'CheckInTime', 'CheckOutTime', 'TotalCost']
#     list_filter = ['ReservationDate', 'CheckInTime', 'CheckOutTime']
#     search_fields = ['ReservationID', 'UserID', 'SpaceID']

# class TransactionsAdmin(SnippetViewSet):
#     model = Transactions
#     menu_label = 'Transactions'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['TransactionID', 'UserID', 'ReservationID', 'PaymentMethodID', 'TransactionDate', 'AmountPaid', 'PaymentStatus']
#     list_filter = ['TransactionDate', 'AmountPaid', 'PaymentStatus']
#     search_fields = ['TransactionID', 'UserID', 'ReservationID']

# class FeedbackAndComplaintsAdmin(SnippetViewSet):
#     model = FeedbackAndComplaints
#     menu_label = 'Feedback and Complaints'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['FeedbackID', 'UserID', 'FeedbackDate', 'FeedbackType', 'FeedbackDescription']
#     list_filter = ['FeedbackDate', 'FeedbackType']
#     search_fields = ['FeedbackID', 'UserID']

# class MaintenanceRequestsAdmin(SnippetViewSet):
#     model = MaintenanceRequests
#     menu_label = 'Maintenance Requests'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['RequestID', 'UserID', 'RequestDate', 'RequestDescription']
#     list_filter = ['RequestDate']
#     search_fields = ['RequestID', 'UserID']

# class EmergencyContactsAdmin(SnippetViewSet):
#     model = EmergencyContacts
#     menu_label = 'Emergency Contacts'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['ContactID', 'ContactName', 'ContactNumber']
#     list_filter = ['ContactName']
#     search_fields = ['ContactID', 'ContactName']

# class VehicleRegistrationAdmin(SnippetViewSet):
#     model = VehicleRegistration
#     menu_label = 'Vehicle Registration'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['VehicleID', 'UserID', 'VehicleType', 'PlateNumber']
#     list_filter = ['VehicleType']
#     search_fields = ['VehicleID', 'UserID']

# class EventCalendarAdmin(SnippetViewSet):
#     model = EventCalendar
#     menu_label = 'Event Calendar'
#     menu_icon = 'date'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['EventID', 'EventName', 'EventDate', 'EventDescription']
#     list_filter = ['EventDate']
#     search_fields = ['EventID', 'EventName']

# class WeatherConditionsAdmin(SnippetViewSet):
#     model = WeatherConditions
#     menu_label = 'Weather Conditions'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     list_display = ['WeatherID', 'WeatherDate', 'WeatherCondition', 'Temperature']
#     list_filter = ['WeatherDate', 'WeatherCondition']
#     search_fields = ['WeatherID', 'WeatherCondition']

# class FeedbackRatingsAdmin(SnippetViewSet):
#     model = FeedbackRatings
#     menu_label = 'Feedback Ratings'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     #list_display = ['FeedbackID', 'UserID', 'Rating']
#     #list_filter = ['Rating']
#     #search_fields = ['FeedbackID', 'UserID']

# class PromotionsAndDiscountsAdmin(SnippetViewSet):
#     model = PromotionsAndDiscounts
#     menu_label = 'Promotions and Discounts'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     #list_display = ['PromoID', 'PromoName', 'PromoDescription', 'PromoDiscount', 'PromoStartDate', 'PromoEndDate']
#     #list_filter = ['PromoStartDate', 'PromoEndDate']
#     #search_fields = ['PromoID', 'PromoName']

# class MaintenanceLogAdmin(SnippetViewSet):
#     model = MaintenanceLog
#     menu_label = 'Maintenance Log'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     #list_display = ['LogID', 'LogDate', 'LogDescription']
#     #list_filter = ['LogDate']
#     #search_fields = ['LogID']

# class UserNotificationsAdmin(SnippetViewSet):
#     model = UserNotifications
#     menu_label = 'User Notifications'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False
#     #list_display = ['NotificationID', 'UserID', 'NotificationDate', 'NotificationDescription']
#     #list_filter = ['NotificationDate']
#     #search_fields = ['NotificationID', 'UserID']

# class FeedbackRepliesAdmin(SnippetViewSet):
#     model = FeedbackReplies
#     menu_label = 'Feedback Replies'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False

# class PaymentMethodsAdmin(SnippetViewSet):
#     model = PaymentMethods
#     menu_label = 'Payment Methods'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False

# class ParkingLotFeesAdmin(SnippetViewSet):
#     model = ParkingLotFees
#     menu_label = 'Parking Lot Fees'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False

# class BookingRequestsAdmin(SnippetViewSet):
#     model = BookingRequests
#     menu_label = 'Booking Requests'
#     menu_icon = 'placeholder'
#     menu_order = 100
#     add_to_settings_menu = False
#     exclude_from_explorer = False

# register_snippet(ParkingSpacesAdmin)
# register_snippet(ReservationsAdmin)
# register_snippet(TransactionsAdmin)
# register_snippet(FeedbackAndComplaintsAdmin)
# register_snippet(MaintenanceRequestsAdmin)
# register_snippet(EmergencyContactsAdmin)
# register_snippet(VehicleRegistrationAdmin)
# register_snippet(EventCalendarAdmin)
# register_snippet(WeatherConditionsAdmin)
# register_snippet(FeedbackRatingsAdmin)
# register_snippet(PromotionsAndDiscountsAdmin)
# register_snippet(MaintenanceLogAdmin)
# register_snippet(UserNotificationsAdmin)
# register_snippet(FeedbackRepliesAdmin)
# register_snippet(PaymentMethodsAdmin)
# register_snippet(ParkingLotFeesAdmin)
# register_snippet(BookingRequestsAdmin)

