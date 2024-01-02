BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "accounts_usertype" (
	"id"	integer NOT NULL,
	"user_type"	varchar(10) NOT NULL,
	"slug"	varchar(10),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "accounts_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"first_name"	varchar(150) NOT NULL,
	"last_name"	varchar(150) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"email"	varchar(100) NOT NULL UNIQUE,
	"phone_number"	varchar(20) NOT NULL,
	"address"	varchar(50) NOT NULL,
	"slug"	varchar(20),
	"uuid"	char(32) NOT NULL UNIQUE,
	"user_type_id"	bigint,
	FOREIGN KEY("user_type_id") REFERENCES "accounts_usertype"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "accounts_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	bigint NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "accounts_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	bigint NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	bigint NOT NULL,
	"action_time"	datetime NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "feedback_and_complaints" (
	"FeedbackID"	integer NOT NULL,
	"FeedbackDate"	date NOT NULL,
	"FeedbackMessage"	text NOT NULL,
	PRIMARY KEY("FeedbackID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "parking_spaces" (
	"id"	integer NOT NULL,
	"space_number"	varchar(10) NOT NULL UNIQUE,
	"location"	varchar(100) NOT NULL,
	"available"	bool NOT NULL,
	"vehicle_type"	varchar(100) NOT NULL,
	"hourly_rate"	decimal NOT NULL,
	"daily_rate"	decimal NOT NULL,
	"monthly_rate"	decimal NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "promotions_and_discounts" (
	"PromotionID"	integer NOT NULL,
	"PromotionName"	varchar(255) NOT NULL,
	"Description"	text NOT NULL,
	"ValidityPeriod"	varchar(50) NOT NULL,
	"DiscountAmount"	decimal NOT NULL,
	"ApplicableConditions"	text NOT NULL,
	PRIMARY KEY("PromotionID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "weather_conditions" (
	"WeatherID"	integer NOT NULL,
	"DateTime"	datetime NOT NULL,
	"Temperature"	decimal NOT NULL,
	"Precipitation"	decimal NOT NULL,
	"WindSpeed"	decimal NOT NULL,
	"WeatherDescription"	varchar(255) NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("WeatherID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "vehicle_registrations" (
	"RegistrationID"	integer NOT NULL,
	"VehicleType"	varchar(50) NOT NULL,
	"LicensePlateNumber"	varchar(20) NOT NULL,
	"RegistrationDate"	date NOT NULL,
	"ExpiryDate"	date NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("RegistrationID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "user_notifications" (
	"NotificationID"	integer NOT NULL,
	"NotificationDate"	datetime NOT NULL,
	"NotificationType"	varchar(50) NOT NULL,
	"Message"	text NOT NULL,
	"Status"	varchar(50) NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("NotificationID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "transactions" (
	"TransactionID"	integer NOT NULL,
	"TransactionDate"	datetime NOT NULL,
	"PaymentAmount"	decimal NOT NULL,
	"PaymentMethod"	varchar(50) NOT NULL,
	"PaymentStatus"	varchar(50) NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("TransactionID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "reservations" (
	"ReservationID"	integer NOT NULL,
	"ReservationDate"	date NOT NULL,
	"CheckInTime"	time NOT NULL,
	"CheckOutTime"	time NOT NULL,
	"TotalCost"	decimal NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("ReservationID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "payment_methods" (
	"PaymentMethodID"	integer NOT NULL,
	"PaymentMethodType"	varchar(50) NOT NULL,
	"PaymentCardNumber"	varchar(20) NOT NULL,
	"ExpiryDate"	date NOT NULL,
	"BillingAddress"	varchar(255) NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("PaymentMethodID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "parking_lot_fees" (
	"FeeID"	integer NOT NULL,
	"FeeDate"	date NOT NULL,
	"FeeAmount"	decimal NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("FeeID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "maintenance_requests" (
	"RequestID"	integer NOT NULL,
	"RequestDate"	date NOT NULL,
	"Description"	text NOT NULL,
	"Status"	varchar(50) NOT NULL,
	"RequestedBy_id"	bigint NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("RequestedBy_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("RequestID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "maintenance_logs" (
	"LogID"	integer NOT NULL,
	"MaintenanceDate"	date NOT NULL,
	"MaintenanceDescription"	text NOT NULL,
	"MaintenanceType"	varchar(50) NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("LogID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "feedback_replies" (
	"ReplyID"	integer NOT NULL,
	"ReplyDate"	datetime NOT NULL,
	"ReplyMessage"	text NOT NULL,
	"FeedbackID_id"	integer NOT NULL,
	"RepliedBy_id"	bigint NOT NULL,
	FOREIGN KEY("FeedbackID_id") REFERENCES "feedback_and_complaints"("FeedbackID") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("RepliedBy_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("ReplyID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "feedback_ratings" (
	"RatingID"	integer NOT NULL,
	"RatingValue"	integer NOT NULL,
	"FeedbackID_id"	integer NOT NULL,
	"RatedBy_id"	bigint NOT NULL,
	FOREIGN KEY("FeedbackID_id") REFERENCES "feedback_and_complaints"("FeedbackID") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("RatedBy_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("RatingID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "event_calendars" (
	"EventID"	integer NOT NULL,
	"EventName"	varchar(255) NOT NULL,
	"EventDate"	date NOT NULL,
	"Location"	varchar(255) NOT NULL,
	"Description"	text NOT NULL,
	"Organizer_id"	bigint NOT NULL,
	FOREIGN KEY("Organizer_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("EventID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "emergency_contacts" (
	"ContactID"	integer NOT NULL,
	"ContactName"	varchar(255) NOT NULL,
	"Relationship"	varchar(50) NOT NULL,
	"PhoneNumber"	varchar(20) NOT NULL,
	"Email"	varchar(254) NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("ContactID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "booking_requests" (
	"RequestID"	integer NOT NULL,
	"RequestDate"	datetime NOT NULL,
	"CheckInDate"	date NOT NULL,
	"CheckOutDate"	date NOT NULL,
	"Status"	varchar(50) NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("RequestID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "access_permissions" (
	"AccessPermissionID"	integer NOT NULL,
	"PermissionType"	varchar(50) NOT NULL,
	"SpaceID_id"	bigint NOT NULL,
	"UserID_id"	bigint NOT NULL,
	FOREIGN KEY("SpaceID_id") REFERENCES "parking_spaces"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("UserID_id") REFERENCES "accounts_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("AccessPermissionID" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_site" (
	"id"	integer NOT NULL,
	"name"	varchar(50) NOT NULL,
	"domain"	varchar(100) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2023-09-22 09:37:35.298203'),
 (2,'contenttypes','0002_remove_content_type_name','2023-09-22 09:37:35.417282'),
 (3,'auth','0001_initial','2023-09-22 09:37:35.668865'),
 (4,'auth','0002_alter_permission_name_max_length','2023-09-22 09:37:35.781918'),
 (5,'auth','0003_alter_user_email_max_length','2023-09-22 09:37:35.903669'),
 (6,'auth','0004_alter_user_username_opts','2023-09-22 09:37:36.008379'),
 (7,'auth','0005_alter_user_last_login_null','2023-09-22 09:37:36.113671'),
 (8,'auth','0006_require_contenttypes_0002','2023-09-22 09:37:36.253657'),
 (9,'auth','0007_alter_validators_add_error_messages','2023-09-22 09:37:36.395820'),
 (10,'auth','0008_alter_user_username_max_length','2023-09-22 09:37:36.495964'),
 (11,'auth','0009_alter_user_last_name_max_length','2023-09-22 09:37:36.589344'),
 (12,'auth','0010_alter_group_name_max_length','2023-09-22 09:37:36.730344'),
 (13,'auth','0011_update_proxy_permissions','2023-09-22 09:37:36.869234'),
 (14,'auth','0012_alter_user_first_name_max_length','2023-09-22 09:37:37.016296'),
 (15,'accounts','0001_initial','2023-09-22 09:37:37.774333'),
 (16,'admin','0001_initial','2023-09-22 09:37:38.429760'),
 (17,'admin','0002_logentry_remove_auto_add','2023-09-22 09:37:38.712758'),
 (18,'admin','0003_logentry_add_action_flag_choices','2023-09-22 09:37:38.987761'),
 (19,'sessions','0001_initial','2023-09-22 09:37:39.543310'),
 (20,'core','0001_initial','2023-09-28 19:06:23.934391'),
 (21,'accounts','0002_accesspermissions','2023-09-28 19:06:24.234526'),
 (22,'sites','0001_initial','2023-09-29 12:55:53.789072'),
 (23,'sites','0002_alter_domain_unique','2023-09-29 12:55:53.997388');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'contenttypes','contenttype'),
 (5,'sessions','session'),
 (6,'accounts','usertype'),
 (7,'accounts','user'),
 (8,'accounts','accesspermissions'),
 (9,'core','promotionsanddiscounts'),
 (10,'core','bookingrequests'),
 (11,'core','feedbackandcomplaints'),
 (12,'core','usernotifications'),
 (13,'core','weatherconditions'),
 (14,'core','paymentmethods'),
 (15,'core','feedbackreplies'),
 (16,'core','transactions'),
 (17,'core','vehicleregistration'),
 (18,'core','emergencycontacts'),
 (19,'core','parkinglotfees'),
 (20,'core','feedbackratings'),
 (21,'core','eventcalendar'),
 (22,'core','maintenancelog'),
 (23,'core','reservations'),
 (24,'core','maintenancerequests'),
 (25,'core','parkingspaces'),
 (26,'sites','site');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_contenttype','Can add content type'),
 (14,4,'change_contenttype','Can change content type'),
 (15,4,'delete_contenttype','Can delete content type'),
 (16,4,'view_contenttype','Can view content type'),
 (17,5,'add_session','Can add session'),
 (18,5,'change_session','Can change session'),
 (19,5,'delete_session','Can delete session'),
 (20,5,'view_session','Can view session'),
 (21,6,'add_usertype','Can add user type'),
 (22,6,'change_usertype','Can change user type'),
 (23,6,'delete_usertype','Can delete user type'),
 (24,6,'view_usertype','Can view user type'),
 (25,7,'add_user','Can add User'),
 (26,7,'change_user','Can change User'),
 (27,7,'delete_user','Can delete User'),
 (28,7,'view_user','Can view User'),
 (29,8,'add_accesspermissions','Can add access permissions'),
 (30,8,'change_accesspermissions','Can change access permissions'),
 (31,8,'delete_accesspermissions','Can delete access permissions'),
 (32,8,'view_accesspermissions','Can view access permissions'),
 (33,9,'add_promotionsanddiscounts','Can add promotions and discounts'),
 (34,9,'change_promotionsanddiscounts','Can change promotions and discounts'),
 (35,9,'delete_promotionsanddiscounts','Can delete promotions and discounts'),
 (36,9,'view_promotionsanddiscounts','Can view promotions and discounts'),
 (37,10,'add_bookingrequests','Can add booking requests'),
 (38,10,'change_bookingrequests','Can change booking requests'),
 (39,10,'delete_bookingrequests','Can delete booking requests'),
 (40,10,'view_bookingrequests','Can view booking requests'),
 (41,11,'add_feedbackandcomplaints','Can add feedback and complaints'),
 (42,11,'change_feedbackandcomplaints','Can change feedback and complaints'),
 (43,11,'delete_feedbackandcomplaints','Can delete feedback and complaints'),
 (44,11,'view_feedbackandcomplaints','Can view feedback and complaints'),
 (45,12,'add_usernotifications','Can add user notifications'),
 (46,12,'change_usernotifications','Can change user notifications'),
 (47,12,'delete_usernotifications','Can delete user notifications'),
 (48,12,'view_usernotifications','Can view user notifications'),
 (49,13,'add_weatherconditions','Can add weather conditions'),
 (50,13,'change_weatherconditions','Can change weather conditions'),
 (51,13,'delete_weatherconditions','Can delete weather conditions'),
 (52,13,'view_weatherconditions','Can view weather conditions'),
 (53,14,'add_paymentmethods','Can add payment methods'),
 (54,14,'change_paymentmethods','Can change payment methods'),
 (55,14,'delete_paymentmethods','Can delete payment methods'),
 (56,14,'view_paymentmethods','Can view payment methods'),
 (57,15,'add_feedbackreplies','Can add feedback replies'),
 (58,15,'change_feedbackreplies','Can change feedback replies'),
 (59,15,'delete_feedbackreplies','Can delete feedback replies'),
 (60,15,'view_feedbackreplies','Can view feedback replies'),
 (61,16,'add_transactions','Can add transactions'),
 (62,16,'change_transactions','Can change transactions'),
 (63,16,'delete_transactions','Can delete transactions'),
 (64,16,'view_transactions','Can view transactions'),
 (65,17,'add_vehicleregistration','Can add vehicle registration'),
 (66,17,'change_vehicleregistration','Can change vehicle registration'),
 (67,17,'delete_vehicleregistration','Can delete vehicle registration'),
 (68,17,'view_vehicleregistration','Can view vehicle registration'),
 (69,18,'add_emergencycontacts','Can add emergency contacts'),
 (70,18,'change_emergencycontacts','Can change emergency contacts'),
 (71,18,'delete_emergencycontacts','Can delete emergency contacts'),
 (72,18,'view_emergencycontacts','Can view emergency contacts'),
 (73,19,'add_parkinglotfees','Can add parking lot fees'),
 (74,19,'change_parkinglotfees','Can change parking lot fees'),
 (75,19,'delete_parkinglotfees','Can delete parking lot fees'),
 (76,19,'view_parkinglotfees','Can view parking lot fees'),
 (77,20,'add_feedbackratings','Can add feedback ratings'),
 (78,20,'change_feedbackratings','Can change feedback ratings'),
 (79,20,'delete_feedbackratings','Can delete feedback ratings'),
 (80,20,'view_feedbackratings','Can view feedback ratings'),
 (81,21,'add_eventcalendar','Can add event calendar'),
 (82,21,'change_eventcalendar','Can change event calendar'),
 (83,21,'delete_eventcalendar','Can delete event calendar'),
 (84,21,'view_eventcalendar','Can view event calendar'),
 (85,22,'add_maintenancelog','Can add maintenance log'),
 (86,22,'change_maintenancelog','Can change maintenance log'),
 (87,22,'delete_maintenancelog','Can delete maintenance log'),
 (88,22,'view_maintenancelog','Can view maintenance log'),
 (89,23,'add_reservations','Can add reservations'),
 (90,23,'change_reservations','Can change reservations'),
 (91,23,'delete_reservations','Can delete reservations'),
 (92,23,'view_reservations','Can view reservations'),
 (93,24,'add_maintenancerequests','Can add maintenance requests'),
 (94,24,'change_maintenancerequests','Can change maintenance requests'),
 (95,24,'delete_maintenancerequests','Can delete maintenance requests'),
 (96,24,'view_maintenancerequests','Can view maintenance requests'),
 (97,25,'add_parkingspaces','Can add parking spaces'),
 (98,25,'change_parkingspaces','Can change parking spaces'),
 (99,25,'delete_parkingspaces','Can delete parking spaces'),
 (100,25,'view_parkingspaces','Can view parking spaces'),
 (101,26,'add_site','Can add site'),
 (102,26,'change_site','Can change site'),
 (103,26,'delete_site','Can delete site'),
 (104,26,'view_site','Can view site');
INSERT INTO "accounts_user" ("id","password","last_login","is_superuser","username","first_name","last_name","is_staff","is_active","date_joined","email","phone_number","address","slug","uuid","user_type_id") VALUES (1,'pbkdf2_sha256$390000$IAr91S3qpOY8xhT3amZ8U0$8+JBOIMWs+C3OEhn+jFfSTmbrfYQ5ZJ1RVVpLexo6l4=','2023-09-28 18:04:48.667731',1,'admin','Gift','Mwaiseghe',1,1,'2023-09-22 09:40:29.676950','admin@gmail.com','0712860997','NY','admin','a6f52a33f84d47c99de7f77184d97c5b',NULL);
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('caaltgiykrekfpo7fd0qlzdzjsxsjywd','.eJxVjDsOwjAQBe_iGlnO-hOHkp4zWBvvLgkgW4qTCnF3iJQC2jcz76USbuuUtsZLmkmdVadOv9uI-cFlB3THcqs617Iu86h3RR-06Wslfl4O9-9gwjZ962CyhUBjj-x56ExgBxzBibECRhDdIMSd-AjUR-mjRWATIDjPzklW7w_iFzfX:1qjceX:IS_mqHj8YZZiTZ3zoYNM8duo-Wka0g-bdCqIfF47H-o','2023-10-06 09:40:49.321879'),
 ('appvo0xn4bflbylztadujwku6m45cagx','.eJxVjMEOwiAQBf-FsyHAQgGP3vsNZGGpVA0kpT0Z_9026UGvb2bemwXc1hK2npcwE7syyS6_W8T0zPUA9MB6bzy1ui5z5IfCT9r52Ci_bqf7d1Cwl70WBr0aAJRGjSorJ5GMTRaFFYYmJZ3M3gCS9YOxESCCRtobUnYywrHPF72JNwU:1qlvNY:R8KK66gsH4RqX0wEDZ_aVF2o9S7L1iNzOgSpJaPpUHc','2023-10-12 18:04:48.852320');
INSERT INTO "django_site" ("id","name","domain") VALUES (1,'example.com','example.com');
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "accounts_usertype_slug_1dc381f1" ON "accounts_usertype" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "accounts_user_slug_b5afb108" ON "accounts_user" (
	"slug"
);
CREATE INDEX IF NOT EXISTS "accounts_user_user_type_id_7573edb0" ON "accounts_user" (
	"user_type_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "accounts_user_groups_user_id_group_id_59c0b32f_uniq" ON "accounts_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "accounts_user_groups_user_id_52b62117" ON "accounts_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "accounts_user_groups_group_id_bd11a704" ON "accounts_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "accounts_user_user_permissions_user_id_permission_id_2ab516c2_uniq" ON "accounts_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "accounts_user_user_permissions_user_id_e4f0a161" ON "accounts_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "accounts_user_user_permissions_permission_id_113bb443" ON "accounts_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "weather_conditions_SpaceID_id_73d4bfa4" ON "weather_conditions" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "vehicle_registrations_UserID_id_73f576bc" ON "vehicle_registrations" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "user_notifications_UserID_id_956d86f3" ON "user_notifications" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "transactions_SpaceID_id_a1a1dfd3" ON "transactions" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "transactions_UserID_id_be63e0b6" ON "transactions" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "reservations_SpaceID_id_973c5be8" ON "reservations" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "reservations_UserID_id_ebce232c" ON "reservations" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "payment_methods_UserID_id_8223f317" ON "payment_methods" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "parking_lot_fees_SpaceID_id_14103456" ON "parking_lot_fees" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "maintenance_requests_RequestedBy_id_bf80d291" ON "maintenance_requests" (
	"RequestedBy_id"
);
CREATE INDEX IF NOT EXISTS "maintenance_requests_SpaceID_id_b7aaf335" ON "maintenance_requests" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "maintenance_logs_SpaceID_id_f9cf0f11" ON "maintenance_logs" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "feedback_replies_FeedbackID_id_31b357e3" ON "feedback_replies" (
	"FeedbackID_id"
);
CREATE INDEX IF NOT EXISTS "feedback_replies_RepliedBy_id_6f3d3587" ON "feedback_replies" (
	"RepliedBy_id"
);
CREATE INDEX IF NOT EXISTS "feedback_ratings_FeedbackID_id_2c184b1c" ON "feedback_ratings" (
	"FeedbackID_id"
);
CREATE INDEX IF NOT EXISTS "feedback_ratings_RatedBy_id_f5616dc8" ON "feedback_ratings" (
	"RatedBy_id"
);
CREATE INDEX IF NOT EXISTS "event_calendars_Organizer_id_4cf6a72a" ON "event_calendars" (
	"Organizer_id"
);
CREATE INDEX IF NOT EXISTS "emergency_contacts_UserID_id_9515106e" ON "emergency_contacts" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "booking_requests_SpaceID_id_06f44cd4" ON "booking_requests" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "booking_requests_UserID_id_f9c16238" ON "booking_requests" (
	"UserID_id"
);
CREATE INDEX IF NOT EXISTS "access_permissions_SpaceID_id_94b98e4c" ON "access_permissions" (
	"SpaceID_id"
);
CREATE INDEX IF NOT EXISTS "access_permissions_UserID_id_cfcb2abc" ON "access_permissions" (
	"UserID_id"
);
COMMIT;
