from django.db import models
from accounts.models import User

# Create your models here.

class ParkingSpaces(models.Model):
    space_number = models.CharField(max_length=10, unique=True)
    location = models.CharField(max_length=100)
    available = models.BooleanField(default=True)
    vehicle_type = models.CharField(max_length=100)
    hourly_rate = models.DecimalField(max_digits=10, decimal_places=2)
    daily_rate = models.DecimalField(max_digits=10, decimal_places=2)
    monthly_rate = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        verbose_name_plural = 'Parking Spaces'
        db_table = 'parking_spaces'

    def __str__(self):
        return str(self.space_number)
    

class Reservations(models.Model):
    ReservationID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    ReservationDate = models.DateField()
    CheckInTime = models.TimeField()
    CheckOutTime = models.TimeField()
    TotalCost = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        verbose_name_plural = 'Reservations'
        db_table = 'reservations'

    def __str__(self):
        return str(self.SpaceID.location )

class Transactions(models.Model):
    TransactionID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    TransactionDate = models.DateTimeField()
    PaymentAmount = models.DecimalField(max_digits=10, decimal_places=2)
    PaymentMethod = models.CharField(max_length=50)
    PaymentStatus = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = 'Transactions'
        db_table = 'transactions'

    def __str__(self):
        return str(self.TransactionID)

class FeedbackAndComplaints(models.Model):
    FeedbackID = models.AutoField(primary_key=True)
    FeedbackDate = models.DateField()
    FeedbackMessage = models.TextField()

    class Meta:
        verbose_name_plural = 'Feedback And Complaints'
        db_table = 'feedback_and_complaints'

    def __str__(self):
        return str(self.FeedbackID)
 
class MaintenanceRequests(models.Model):
    RequestID = models.AutoField(primary_key=True)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    RequestedBy = models.ForeignKey(User, on_delete=models.CASCADE)
    RequestDate = models.DateField()
    Description = models.TextField()
    Status = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = 'Maintenance Requests'
        db_table = 'maintenance_requests'

    def __str__(self):
        return str(self.SpaceID)

class EmergencyContacts(models.Model):
    ContactID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    ContactName = models.CharField(max_length=255)
    Relationship = models.CharField(max_length=50)
    PhoneNumber = models.CharField(max_length=20)
    Email = models.EmailField()

    class Meta:
        verbose_name_plural = 'Emergency Contacts'
        db_table = 'emergency_contacts'

    def __str__(self):
        return str(self.UserID)

class VehicleRegistration(models.Model):
    RegistrationID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    VehicleType = models.CharField(max_length=50)
    LicensePlateNumber = models.CharField(max_length=20)
    RegistrationDate = models.DateField()
    ExpiryDate = models.DateField()

    class Meta:
        verbose_name_plural = 'Vehicle Registrations'
        db_table = 'vehicle_registrations'

    def __str__(self):
        return str(self.UserID)

class EventCalendar(models.Model):
    EventID = models.AutoField(primary_key=True)
    EventName = models.CharField(max_length=255)
    EventDate = models.DateField()
    Location = models.CharField(max_length=255)
    Description = models.TextField()
    Organizer = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = 'Event Calendars'
        db_table = 'event_calendars'

    def __str__(self):
        return str(self.EventName)

class WeatherConditions(models.Model):
    WeatherID = models.AutoField(primary_key=True)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    DateTime = models.DateTimeField()
    Temperature = models.DecimalField(max_digits=5, decimal_places=2)
    Precipitation = models.DecimalField(max_digits=5, decimal_places=2)
    WindSpeed = models.DecimalField(max_digits=5, decimal_places=2)
    WeatherDescription = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Weather Conditions'
        db_table = 'weather_conditions'

    def __str__(self):
        return str(self.SpaceID)

class FeedbackRatings(models.Model):
    RatingID = models.AutoField(primary_key=True)
    FeedbackID = models.ForeignKey(FeedbackAndComplaints, on_delete=models.CASCADE)
    RatingValue = models.IntegerField()
    RatedBy = models.ForeignKey(User, on_delete=models.CASCADE)

    class Meta:
        verbose_name_plural = 'Feedback Ratings'
        db_table = 'feedback_ratings'

    def __str__(self):
        return str(self.FeedbackID)

class PromotionsAndDiscounts(models.Model):
    PromotionID = models.AutoField(primary_key=True)
    PromotionName = models.CharField(max_length=255)
    Description = models.TextField()
    ValidityPeriod = models.CharField(max_length=50)
    DiscountAmount = models.DecimalField(max_digits=5, decimal_places=2)
    ApplicableConditions = models.TextField()

    class Meta:
        verbose_name_plural = 'Promotions And Discounts'
        db_table = 'promotions_and_discounts'

    def __str__(self):
        return str(self.PromotionName)

class MaintenanceLog(models.Model):
    LogID = models.AutoField(primary_key=True)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    MaintenanceDate = models.DateField()
    MaintenanceDescription = models.TextField()
    MaintenanceType = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = 'Maintenance Logs'
        db_table = 'maintenance_logs'

    def __str__(self):
        return str(self.SpaceID)

class UserNotifications(models.Model):
    NotificationID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    NotificationDate = models.DateTimeField()
    NotificationType = models.CharField(max_length=50)
    Message = models.TextField()
    Status = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = 'User Notifications'
        db_table = 'user_notifications'

    def __str__(self):
        return str(self.UserID)

class FeedbackReplies(models.Model):
    ReplyID = models.AutoField(primary_key=True)
    FeedbackID = models.ForeignKey(FeedbackAndComplaints, on_delete=models.CASCADE)
    RepliedBy = models.ForeignKey(User, on_delete=models.CASCADE)
    ReplyDate = models.DateTimeField()
    ReplyMessage = models.TextField()

    class Meta:
        verbose_name_plural = 'Feedback Replies'
        db_table = 'feedback_replies'

    def __str__(self):
        return str(self.FeedbackID)

class PaymentMethods(models.Model):
    PaymentMethodID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    PaymentMethodType = models.CharField(max_length=50)
    PaymentCardNumber = models.CharField(max_length=20)
    ExpiryDate = models.DateField()
    BillingAddress = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Payment Methods'
        db_table = 'payment_methods'

    def __str__(self):
        return str(self.UserID)

class ParkingLotFees(models.Model):
    FeeID = models.AutoField(primary_key=True)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    FeeDate = models.DateField()
    FeeAmount = models.DecimalField(max_digits=10, decimal_places=2)

    class Meta:
        verbose_name_plural = 'Parking Lot Fees'
        db_table = 'parking_lot_fees'

    def __str__(self):
        return str(self.SpaceID)

class BookingRequests(models.Model):
    RequestID = models.AutoField(primary_key=True)
    UserID = models.ForeignKey(User, on_delete=models.CASCADE)
    SpaceID = models.ForeignKey(ParkingSpaces, on_delete=models.CASCADE)
    RequestDate = models.DateTimeField()
    CheckInDate = models.DateField()
    CheckOutDate = models.DateField()
    Status = models.CharField(max_length=50)

    class Meta:
        verbose_name_plural = 'Booking Requests'
        db_table = 'booking_requests'

    def __str__(self):
        return str(self.RequestID)


