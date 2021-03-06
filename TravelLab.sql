CREATE DATABASE TravelDb
GO
USE TravelDb

CREATE TABLE [User](
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
UserName NVARCHAR(50) NOT NULL,
PhoneNumber NVARCHAR(14),
[Address] NVARCHAR(50))

CREATE TABLE Passport(
PassportNumber INT PRIMARY KEY NOT NULL,
ExpirationDate DATE NOT NULL)

ALTER TABLE [User]
ADD PassportNum INT FOREIGN KEY REFERENCES Passport(PassportNumber)

ALTER TABLE Passport
ADD [Userid] INT FOREIGN KEY REFERENCES [User](id)

CREATE TABLE Trip(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE,
StartLocation NVARCHAR(50) NOT NULL,
EndDestination NVARCHAR(50),
TravelMode NVARCHAR(20),
Budget DECIMAL)

CREATE TABLE Hotel(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(20) NOT NULL,
PhoneNumber NVARCHAR(14),
[Address] NVARCHAR(50),
CheckIn DATE NOT NULL,
CheckOut DATE NOT NULL,
Rate DECIMAL NOT NULL)

CREATE TABLE TripHotel(
id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
TripId INT FOREIGN KEY REFERENCES Trip(id))

ALTER TABLE TripHotel
ADD HotelId INT FOREIGN KEY REFERENCES Hotel(id)
