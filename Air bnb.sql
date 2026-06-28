
CREATE DATABASE airbnb_database;
USE airbnb_database;


CREATE TABLE `User` (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(150),
    Phone VARCHAR(20),
    Role VARCHAR(20),
    VerificationStatus VARCHAR(20)
);


CREATE TABLE Guest (
    GuestID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Preferences TEXT,
    LoyaltyPoints INT,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID)
);


CREATE TABLE Host (
    HostID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    HostRating DECIMAL(3,2),
    TotalListings INT,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID)
);


CREATE TABLE Admin (
    AdminID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    AdminLevel VARCHAR(50),
    AccessRights TEXT,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID)
);


CREATE TABLE Property (
    PropertyID INT PRIMARY KEY AUTO_INCREMENT,
    HostID INT,
    Address VARCHAR(255),
    Type VARCHAR(50),
    Price DECIMAL(10,2),
    FOREIGN KEY (HostID) REFERENCES Host(HostID)
);


CREATE TABLE ListingImages (
    ImageID INT PRIMARY KEY AUTO_INCREMENT,
    PropertyID INT,
    ImageURL VARCHAR(255),
    Description TEXT,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


CREATE TABLE Booking (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    GuestID INT,
    PropertyID INT,
    CheckInDate DATE,
    CheckOutDate DATE,
    Status VARCHAR(50),
    TotalCost DECIMAL(10,2),
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Amount DECIMAL(10,2),
    Method VARCHAR(50),
    Status VARCHAR(50),
    PaymentDate TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);


CREATE TABLE Review (
    ReviewID INT PRIMARY KEY AUTO_INCREMENT,
    GuestID INT,
    HostID INT,
    PropertyID INT,
    Rating INT,
    Comment TEXT,
    Date TIMESTAMP,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (HostID) REFERENCES Host(HostID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


CREATE TABLE Message (
    MessageID INT PRIMARY KEY AUTO_INCREMENT,
    SenderID INT,
    ReceiverID INT,
    Content TEXT,
    Timestamp TIMESTAMP,
    FOREIGN KEY (SenderID) REFERENCES `User`(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES `User`(UserID)
);


CREATE TABLE Availability (
    AvailabilityID INT PRIMARY KEY AUTO_INCREMENT,
    PropertyID INT,
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


CREATE TABLE Notification (
    NotificationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    Message TEXT,
    Status VARCHAR(20),
    FOREIGN KEY (UserID) REFERENCES `User`(UserID)
);


CREATE TABLE Discount (
    DiscountID INT PRIMARY KEY AUTO_INCREMENT,
    PropertyID INT,
    DiscountType VARCHAR(50),
    DiscountValue DECIMAL(10,2),
    ExpiryDate DATE,
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


CREATE TABLE Cancellation (
    CancellationID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    Reason TEXT,
    RefundStatus VARCHAR(50),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID)
);


CREATE TABLE Amenity (
    AmenityID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Description TEXT
);


CREATE TABLE Property_Amenity (
    PropertyID INT,
    AmenityID INT,
    PRIMARY KEY (PropertyID, AmenityID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (AmenityID) REFERENCES Amenity(AmenityID)
);


CREATE TABLE SavedProperty (
    SavedID INT PRIMARY KEY AUTO_INCREMENT,
    GuestID INT,
    PropertyID INT,
    SavedDate TIMESTAMP,
    FOREIGN KEY (GuestID) REFERENCES Guest(GuestID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID)
);


CREATE TABLE Complaint (
    ComplaintID INT PRIMARY KEY AUTO_INCREMENT,
    BookingID INT,
    UserID INT,
    ComplaintText TEXT,
    Status VARCHAR(50),
    ResolutionDate DATE,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID),
    FOREIGN KEY (UserID) REFERENCES `User`(UserID)
);


CREATE TABLE ServiceProvider (
    ProviderID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(150),
    ServiceType VARCHAR(100),
    ContactInfo VARCHAR(255)
);


CREATE TABLE Property_ServiceProvider (
    PropertyID INT,
    ProviderID INT,
    ServiceDate DATE,
    PRIMARY KEY (PropertyID, ProviderID),
    FOREIGN KEY (PropertyID) REFERENCES Property(PropertyID),
    FOREIGN KEY (ProviderID) REFERENCES ServiceProvider(ProviderID)
);


CREATE TABLE HostPaymentRecord (
    RecordID INT PRIMARY KEY AUTO_INCREMENT,
    HostID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentType VARCHAR(50),
    FOREIGN KEY (HostID) REFERENCES Host(HostID)
);

INSERT INTO `User` (Name, Email, Phone, Role, VerificationStatus)
VALUES
('Luca Moretti','luca1@mail.com','9000000001','Guest','Verified'),
('Amara Okafor','amara@mail.com','9000000002','Guest','Verified'),
('Elena Petrova','elena@mail.com','9000000003','Guest','Verified'),
('Yara Haddad','yara@mail.com','9000000004','Guest','Verified'),
('Omar AlFarsi','omar@mail.com','9000000005','Guest','Verified'),
('Ivan Novak','ivan@mail.com','9000000006','Guest','Verified'),
('Aisha Bello','aisha@mail.com','9000000007','Guest','Verified'),
('Freya Jensen','freya@mail.com','9000000008','Guest','Verified'),
('Isabella Rossi','isa@mail.com','9000000009','Guest','Verified'),
('Mei Lin','mei@mail.com','9000000010','Guest','Verified'),
('Alejandro Ruiz','ale@mail.com','9000000011','Guest','Verified'),
('Fatima Zahra','fatima@mail.com','9000000012','Guest','Verified'),
('Jonas Schmidt','jonas@mail.com','9000000013','Guest','Verified'),
('Lina Park','lina@mail.com','9000000014','Guest','Verified'),
('Ahmed Benali','ahmed@mail.com','9000000015','Guest','Verified'),
('Natalia Ivanova','natalia@mail.com','9000000016','Guest','Verified'),
('Carlos Mendez','carlos@mail.com','9000000017','Guest','Verified'),
('Sakura Yamamoto','sakura@mail.com','9000000018','Guest','Verified'),
('Lucas Ferreira','lucas@mail.com','9000000019','Guest','Verified'),
('Amina ElSayed','amina@mail.com','9000000020','Guest','Verified'),
('Sofia Andersson','sofia@mail.com','9000000021','Host','Verified'),
('Mateo Fernandez','mateo@mail.com','9000000022','Host','Verified'),
('Noah Muller','noah@mail.com','9000000023','Host','Verified'),
('Thiago Costa','thiago@mail.com','9000000024','Host','Verified'),
('Hugo Silva','hugo@mail.com','9000000025','Host','Verified'),
('Chloe Dubois','chloe@mail.com','9000000026','Host','Verified'),
('Dmitry Volkov','dmitry@mail.com','9000000027','Host','Verified'),
('Liam OConnor','liam@mail.com','9000000028','Host','Verified'),
('Zain AlAbadi','zain@mail.com','9000000029','Host','Verified'),
('Marco Bianchi','marco@mail.com','9000000030','Host','Verified'),
('Erik Johansen','erik@mail.com','9000000031','Host','Verified'),
('Omar Hassan','omarh@mail.com','9000000032','Host','Verified'),
('Jean Dupont','jean@mail.com','9000000033','Host','Verified'),
('Carlos Rivera','rivera@mail.com','9000000034','Host','Verified'),
('Yuki Nakamura','yuki@mail.com','9000000035','Host','Verified'),
('Ali Reza','ali@mail.com','9000000036','Host','Verified'),
('Victor Hugo','victor@mail.com','9000000037','Host','Verified'),
('Peter Novak','peter@mail.com','9000000038','Host','Verified'),
('Samuel Kim','samuel@mail.com','9000000039','Host','Verified'),
('David Schmidt','david@mail.com','9000000040','Host','Verified'),
('Kenji Tanaka','kenji@mail.com','9000000041','Admin','Verified'),
('Zara Khan','zara@mail.com','9000000042','Admin','Verified'),
('Amina Noor','amina@mail.com','9000000043','Admin','Verified'),
('Lucas Meyer','lucas@mail.com','9000000044','Admin','Verified'),
('Fatih Demir','fatih@mail.com','9000000045','Admin','Verified'),
('Ivan Petrov','ivanp@mail.com','9000000046','Admin','Verified'),
('Sara Ali','sara@mail.com','9000000047','Admin','Verified'),
('Nina Berg','nina@mail.com','9000000048','Admin','Verified'),
('Mohammed Saleh','mohammed@mail.com','9000000049','Admin','Verified'),
('Anna Kowalski','anna@mail.com','9000000050','Admin','Verified'),
('Leo Martins','leo@mail.com','9000000051','Admin','Verified'),
('Hassan Raza','hassan@mail.com','9000000052','Admin','Verified'),
('Maria Garcia','maria@mail.com','9000000053','Admin','Verified'),
('Elif Kaya','elif@mail.com','9000000054','Admin','Verified'),
('John Carter','john@mail.com','9000000055','Admin','Verified'),
('Ravi Sharma','ravi@mail.com','9000000056','Admin','Verified'),
('Chen Wei','chen@mail.com','9000000057','Admin','Verified'),
('Olga Ivanova','olga@mail.com','9000000058','Admin','Verified'),
('James Brown','james@mail.com','9000000059','Admin','Verified'),
('Noor Ahmed','noor@mail.com','9000000060','Admin','Verified');

INSERT INTO Guest (UserID, Preferences, LoyaltyPoints)
VALUES
(1,'City',100),(2,'Budget',80),(3,'Luxury',200),(4,'Metro',60),
(5,'Pet',90),(6,'Business',110),(7,'Family',70),(8,'Modern',95),
(9,'Long stay',130),(10,'Affordable',50),(11,'Beach',140),(12,'Culture',85),
(13,'Mountain',100),(14,'Nightlife',75),(15,'Village',65),(16,'Villa',180),
(17,'Backpack',55),(18,'Traditional',90),(19,'Resort',150),(20,'Eco',110);

INSERT INTO Host (UserID, HostRating, TotalListings)
VALUES
(21,4.8,5),(22,4.5,3),(23,4.7,4),(24,4.6,6),(25,4.9,7),
(26,4.3,2),(27,4.4,3),(28,4.6,5),(29,4.2,4),(30,4.7,6),
(31,4.8,8),(32,4.5,2),(33,4.6,3),(34,4.4,4),(35,4.9,5),
(36,4.3,3),(37,4.7,6),(38,4.5,4),(39,4.8,7),(40,4.6,5);

INSERT INTO Admin (UserID, AdminLevel, AccessRights)
VALUES
(41,'Super','All'),(42,'Moderator','Users'),(43,'Support','Complaints'),
(44,'Manager','Listings'),(45,'Auditor','Finance'),
(46,'Support','Complaints'),(47,'Moderator','Users'),(48,'Manager','Listings'),
(49,'Super','All'),(50,'Auditor','Finance'),
(51,'Support','Complaints'),(52,'Moderator','Users'),(53,'Manager','Listings'),
(54,'Super','All'),(55,'Auditor','Finance'),
(56,'Support','Complaints'),(57,'Moderator','Users'),(58,'Manager','Listings'),
(59,'Super','All'),(60,'Auditor','Finance');

INSERT INTO Property (HostID, Address, Type, Price)
VALUES
(1,'New York, USA','Apartment',2500), (2,'Paris, France','Studio',2200),
(3,'Tokyo, Japan','Apartment',3000), (4,'Berlin, Germany','Loft',1800),
(5,'Dubai, UAE','Villa',5000), (6,'Rome, Italy','Apartment',2100),
(7,'London, UK','Flat',3500), (8,'Barcelona, Spain','Studio',2000),
(9,'Toronto, Canada','Apartment',2700), (10,'Sydney, Australia','Villa',4500),
(11,'Amsterdam, Netherlands','Apartment',2600), (12,'Seoul, Korea','Studio',1900),
(13,'Bangkok, Thailand','Apartment',1500), (14,'Cape Town, South Africa','Villa',3200),
(15,'Istanbul, Turkey','Apartment',1700), (16,'Mexico City, Mexico','Studio',1400),
(17,'Vienna, Austria','Apartment',2800), (18,'Zurich, Switzerland','Apartment',4000),
(19,'Lisbon, Portugal','Studio',1600), (20,'Athens, Greece','Apartment',1800);

INSERT INTO ListingImages (PropertyID, ImageURL, Description)
VALUES
(1,'img1.jpg','City apartment'),(2,'img2.jpg','Cozy studio'),
(3,'img3.jpg','Modern home'),(4,'img4.jpg','Loft design'),
(5,'img5.jpg','Luxury villa'),(6,'img6.jpg','Classic stay'),
(7,'img7.jpg','City flat'),(8,'img8.jpg','Beach studio'),
(9,'img9.jpg','Downtown stay'),(10,'img10.jpg','Luxury villa'),
(11,'img11.jpg','Modern apartment'),(12,'img12.jpg','Compact studio'),
(13,'img13.jpg','Budget apartment'),(14,'img14.jpg','Sea villa'),
(15,'img15.jpg','Cultural stay'),(16,'img16.jpg','Urban studio'),
(17,'img17.jpg','Elegant apartment'),(18,'img18.jpg','Premium stay'),
(19,'img19.jpg','Historic studio'),(20,'img20.jpg','Island apartment');

INSERT INTO Booking (GuestID, PropertyID, CheckInDate, CheckOutDate, Status, TotalCost)
VALUES
(1,1,'2025-01-01','2025-01-05','Confirmed',10000),(2,2,'2025-01-02','2025-01-06','Completed',9000),
(3,3,'2025-01-03','2025-01-07','Confirmed',12000),(4,4,'2025-01-04','2025-01-08','Cancelled',7000),
(5,5,'2025-01-05','2025-01-10','Completed',20000),(6,6,'2025-01-06','2025-01-09','Confirmed',8000),
(7,7,'2025-01-07','2025-01-11','Completed',14000),(8,8,'2025-01-08','2025-01-12','Confirmed',7500),
(9,9,'2025-01-09','2025-01-13','Completed',11000),(10,10,'2025-01-10','2025-01-15','Confirmed',22000),
(11,11,'2025-01-11','2025-01-14','Completed',9000),(12,12,'2025-01-12','2025-01-16','Confirmed',7000),
(13,13,'2025-01-13','2025-01-17','Completed',6000),(14,14,'2025-01-14','2025-01-18','Confirmed',13000),
(15,15,'2025-01-15','2025-01-19','Completed',6500),(16,16,'2025-01-16','2025-01-20','Confirmed',5500),
(17,17,'2025-01-17','2025-01-21','Completed',11500),(18,18,'2025-01-18','2025-01-22','Confirmed',16000),
(19,19,'2025-01-19','2025-01-23','Completed',7000),(20,20,'2025-01-20','2025-01-24','Confirmed',8000);

INSERT INTO Payment (BookingID, Amount, Method, Status, PaymentDate)
VALUES
(1,10000,'UPI','Paid',NOW()),(2,9000,'Card','Paid',NOW()),
(3,12000,'UPI','Paid',NOW()),(4,7000,'Card','Refunded',NOW()),
(5,20000,'NetBanking','Paid',NOW()),(6,8000,'UPI','Paid',NOW()),
(7,14000,'Card','Paid',NOW()),(8,7500,'UPI','Paid',NOW()),
(9,11000,'Card','Paid',NOW()),(10,22000,'UPI','Paid',NOW()),
(11,9000,'Card','Paid',NOW()),(12,7000,'UPI','Paid',NOW()),
(13,6000,'Card','Paid',NOW()),(14,13000,'UPI','Paid',NOW()),
(15,6500,'Card','Paid',NOW()),(16,5500,'UPI','Paid',NOW()),
(17,11500,'Card','Paid',NOW()),(18,16000,'UPI','Paid',NOW()),
(19,7000,'Card','Paid',NOW()),(20,8000,'UPI','Paid',NOW());

INSERT INTO Review (GuestID, HostID, PropertyID, Rating, Comment, Date)
VALUES
(1,1,1,5,'Excellent stay',NOW()),(2,2,2,4,'Very good',NOW()),
(3,3,3,5,'Amazing experience',NOW()),(4,4,4,3,'Average',NOW()),
(5,5,5,5,'Luxury stay',NOW()),(6,6,6,4,'Comfortable',NOW()),
(7,7,7,5,'Perfect',NOW()),(8,8,8,4,'Nice location',NOW()),
(9,9,9,5,'Highly recommended',NOW()),(10,10,10,5,'Best stay ever',NOW()),
(11,11,11,4,'Good stay',NOW()),(12,12,12,3,'Okay',NOW()),
(13,13,13,4,'Nice',NOW()),(14,14,14,5,'Fantastic',NOW()),
(15,15,15,4,'Pleasant',NOW()),(16,16,16,3,'Decent',NOW()),
(17,17,17,5,'Excellent',NOW()),(18,18,18,5,'Premium experience',NOW()),
(19,19,19,4,'Good value',NOW()),(20,20,20,5,'Loved it',NOW());

INSERT INTO Message (SenderID, ReceiverID, Content, Timestamp)
VALUES
(1,21,'Is the property available?',NOW()),(2,22,'Can I check in early?',NOW()),
(3,23,'Thanks for the update',NOW()),(4,24,'Booking confirmed?',NOW()),
(5,25,'Need more details',NOW()),(6,26,'Check availability please',NOW()),
(7,27,'Payment done',NOW()),(8,28,'Any discount?',NOW()),
(9,29,'Location details?',NOW()),(10,30,'Thanks!',NOW()),
(11,31,'Check-in time?',NOW()),(12,32,'Need invoice',NOW()),
(13,33,'Booking issue',NOW()),(14,34,'Cancel request',NOW()),
(15,35,'Host response?',NOW()),(16,36,'Thanks host',NOW()),
(17,37,'Good stay',NOW()),(18,38,'Will visit again',NOW()),
(19,39,'Review posted',NOW()),(20,40,'Great service',NOW());

INSERT INTO Availability (PropertyID, Date, Status)
VALUES
(1,'2025-01-01','Available'),(2,'2025-01-02','Booked'),
(3,'2025-01-03','Available'),(4,'2025-01-04','Blocked'),
(5,'2025-01-05','Booked'),(6,'2025-01-06','Available'),
(7,'2025-01-07','Booked'),(8,'2025-01-08','Available'),
(9,'2025-01-09','Booked'),(10,'2025-01-10','Available'),
(11,'2025-01-11','Booked'),(12,'2025-01-12','Available'),
(13,'2025-01-13','Booked'),(14,'2025-01-14','Available'),
(15,'2025-01-15','Blocked'),(16,'2025-01-16','Available'),
(17,'2025-01-17','Booked'),(18,'2025-01-18','Available'),
(19,'2025-01-19','Booked'),(20,'2025-01-20','Available');

INSERT INTO Notification (UserID, Message, Status)
VALUES
(1,'Booking confirmed','Unread'),(2,'Payment successful','Read'),
(3,'New message received','Unread'),(4,'Booking cancelled','Read'),
(5,'Discount applied','Unread'),(6,'Host replied','Read'),
(7,'New booking','Unread'),(8,'Reminder notification','Read'),
(9,'Review submitted','Unread'),(10,'Payment failed','Read'),
(11,'Booking confirmed','Unread'),(12,'Host message','Read'),
(13,'Discount available','Unread'),(14,'Booking updated','Read'),
(15,'Cancellation processed','Unread'),(16,'Payment received','Read'),
(17,'New review','Unread'),(18,'Booking reminder','Read'),
(19,'Host response','Unread'),(20,'System alert','Read');

INSERT INTO Discount (PropertyID, DiscountType, DiscountValue, ExpiryDate)
VALUES
(1,'Percentage',10,'2025-02-01'),(2,'Flat',500,'2025-02-02'),
(3,'Percentage',15,'2025-02-03'),(4,'Flat',300,'2025-02-04'),
(5,'Percentage',20,'2025-02-05'),(6,'Flat',400,'2025-02-06'),
(7,'Percentage',12,'2025-02-07'),(8,'Flat',250,'2025-02-08'),
(9,'Percentage',18,'2025-02-09'),(10,'Flat',600,'2025-02-10'),
(11,'Percentage',10,'2025-02-11'),(12,'Flat',350,'2025-02-12'),
(13,'Percentage',14,'2025-02-13'),(14,'Flat',450,'2025-02-14'),
(15,'Percentage',16,'2025-02-15'),(16,'Flat',200,'2025-02-16'),
(17,'Percentage',11,'2025-02-17'),(18,'Flat',700,'2025-02-18'),
(19,'Percentage',13,'2025-02-19'),(20,'Flat',500,'2025-02-20');

INSERT INTO Cancellation (BookingID, Reason, RefundStatus)
VALUES
(1,'Change of plans','Processed'),(2,'Emergency','Refunded'),
(3,'Schedule conflict','Pending'),(4,'Personal reason','Refunded'),
(5,'Travel issue','Processed'),(6,'Health issue','Refunded'),
(7,'Weather issue','Pending'),(8,'Family reason','Processed'),
(9,'Work conflict','Refunded'),(10,'Other','Pending'),
(11,'Change plan','Processed'),(12,'Emergency','Refunded'),
(13,'Schedule issue','Pending'),(14,'Personal','Processed'),
(15,'Travel issue','Refunded'),(16,'Health','Pending'),
(17,'Weather','Processed'),(18,'Family','Refunded'),
(19,'Work','Pending'),(20,'Other','Processed');

INSERT INTO Property_Amenity (PropertyID, AmenityID)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);

INSERT INTO SavedProperty (GuestID, PropertyID, SavedDate)
VALUES
(1,5,NOW()),(2,3,NOW()),(3,8,NOW()),(4,2,NOW()),
(5,10,NOW()),(6,7,NOW()),(7,1,NOW()),(8,6,NOW()),
(9,9,NOW()),(10,4,NOW()),(11,11,NOW()),(12,12,NOW()),
(13,13,NOW()),(14,14,NOW()),(15,15,NOW()),
(16,16,NOW()),(17,17,NOW()),(18,18,NOW()),
(19,19,NOW()),(20,20,NOW());

INSERT INTO Complaint (BookingID, UserID, ComplaintText, Status, ResolutionDate)
VALUES
(1,1,'Late check-in issue','Resolved','2025-02-01'),(2,2,'Cleanliness problem','Pending',NULL),
(3,3,'Wrong billing','Resolved','2025-02-02'),(4,4,'Host not responsive','Pending',NULL),
(5,5,'Amenities missing','Resolved','2025-02-03'),(6,6,'Noise issue','Pending',NULL),
(7,7,'Payment delay','Resolved','2025-02-04'),(8,8,'Booking error','Pending',NULL),
(9,9,'Location mismatch','Resolved','2025-02-05'),(10,10,'Refund delay','Pending',NULL),
(11,11,'Room issue','Resolved','2025-02-06'),(12,12,'AC not working','Pending',NULL),
(13,13,'Late service','Resolved','2025-02-07'),(14,14,'Check-out issue','Pending',NULL),
(15,15,'Overcharged','Resolved','2025-02-08'),(16,16,'WiFi issue','Pending',NULL),
(17,17,'Staff behavior','Resolved','2025-02-09'),(18,18,'Maintenance issue','Pending',NULL),
(19,19,'Security concern','Resolved','2025-02-10'),(20,20,'Other issue','Pending',NULL);

INSERT INTO ServiceProvider (Name, ServiceType, ContactInfo)
VALUES
('CleanPro','Cleaning','clean@mail.com'),('FixIt','Repair','fix@mail.com'),
('SecurePlus','Security','sec@mail.com'),('WashPro','Laundry','wash@mail.com'),
('GardenCare','Gardening','garden@mail.com'),('RepairX','Repair','repair@mail.com'),
('ElectricPro','Electrical','elec@mail.com'),('WaterFix','Plumbing','water@mail.com'),
('SafeHome','Security','safe@mail.com'),('SparkleClean','Cleaning','spark@mail.com'),
('BuildPro','Construction','build@mail.com'),('FastFix','Repair','fast@mail.com'),
('EcoClean','Cleaning','eco@mail.com'),('BrightLight','Electrical','bright@mail.com'),
('FlowWater','Plumbing','flow@mail.com'),('GreenLife','Gardening','green@mail.com'),
('SafeGuard','Security','guard@mail.com'),('UrbanClean','Cleaning','urban@mail.com'),
('FixMaster','Repair','master@mail.com'),('PrimeCare','Maintenance','prime@mail.com');

INSERT INTO Property_ServiceProvider (PropertyID, ProviderID, ServiceDate)
VALUES
(1,1,'2025-01-01'),(2,2,'2025-01-02'),(3,3,'2025-01-03'),
(4,4,'2025-01-04'),(5,5,'2025-01-05'),
(6,6,'2025-01-06'),(7,7,'2025-01-07'),
(8,8,'2025-01-08'),(9,9,'2025-01-09'),
(10,10,'2025-01-10'),(11,11,'2025-01-11'),
(12,12,'2025-01-12'),(13,13,'2025-01-13'),
(14,14,'2025-01-14'),(15,15,'2025-01-15'),
(16,16,'2025-01-16'),(17,17,'2025-01-17'),
(18,18,'2025-01-18'),(19,19,'2025-01-19'),
(20,20,'2025-01-20');

INSERT INTO HostPaymentRecord (HostID, Amount, PaymentDate, PaymentType)
VALUES
(1,10000,'2025-01-10','UPI'),(2,9000,'2025-01-11','Card'),
(3,12000,'2025-01-12','Bank'),(4,7000,'2025-01-13','UPI'),
(5,20000,'2025-01-14','Card'),(6,8000,'2025-01-15','Bank'),
(7,14000,'2025-01-16','UPI'),(8,7500,'2025-01-17','Card'),
(9,11000,'2025-01-18','Bank'),(10,22000,'2025-01-19','UPI'),
(11,9000,'2025-01-20','Card'),(12,7000,'2025-01-21','Bank'),
(13,6000,'2025-01-22','UPI'),(14,13000,'2025-01-23','Card'),
(15,6500,'2025-01-24','Bank'),(16,5500,'2025-01-25','UPI'),
(17,11500,'2025-01-26','Card'),(18,16000,'2025-01-27','Bank'),
(19,7000,'2025-01-28','UPI'),(20,8000,'2025-01-29','Card');

INSERT INTO Amenity (Name, Description)
VALUES
('WiFi','High speed internet'),('Air Conditioning','Cooling system'),
('Parking','Free parking'),('Swimming Pool','Outdoor pool'),
('Gym','Fitness center'),('Kitchen','Fully equipped kitchen'),
('TV','Smart television'),('Heater','Room heating'),
('Washing Machine','Laundry facility'),('Balcony','Private balcony'),
('Elevator','Lift access'),('Security','24/7 security'),
('Pet Friendly','Pets allowed'),('Breakfast','Free breakfast'),
('Workspace','Work desk'),('Hot Water','24/7 hot water'),
('Garden','Outdoor garden'),('Fireplace','Indoor fireplace'),
('Spa','Spa services'),('Bar','Mini bar');

INSERT INTO Property_Amenity (PropertyID, AmenityID)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15),
(16,16),(17,17),(18,18),(19,19),(20,20);


SELECT 
    u.Name AS HostName,
    SUM(h.Amount) AS TotalEarnings
FROM HostPaymentRecord h
JOIN Host ho ON h.HostID = ho.HostID
JOIN `User` u ON ho.UserID = u.UserID
GROUP BY h.HostID
ORDER BY TotalEarnings DESC;

SELECT 
    u.Name AS GuestName,
    COUNT(b.BookingID) AS TotalBookings
FROM Booking b
JOIN Guest g ON b.GuestID = g.GuestID
JOIN `User` u ON g.UserID = u.UserID
GROUP BY b.GuestID
HAVING COUNT(b.BookingID) > 0
ORDER BY TotalBookings DESC;

SELECT 
    TABLE_NAME AS 'Table Name', 
    TABLE_ROWS AS 'Number of Entries'
FROM 
    information_schema.TABLES 
WHERE 
    TABLE_SCHEMA = 'airbnb_database' 
ORDER BY 
    TABLE_ROWS DESC;
    
    SELECT 
    TABLE_SCHEMA AS 'Database Name', 
    ROUND(SUM(data_length + index_length) / 1024, 2) AS 'Total Volume (KB)'
FROM 
    information_schema.TABLES 
WHERE 
    TABLE_SCHEMA = 'airbnb_database'
GROUP BY 
    TABLE_SCHEMA;