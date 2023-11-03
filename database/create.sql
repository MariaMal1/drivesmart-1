use ismgroup47;

-- DROP TABLE Trip;
-- DROP TABLE Booking;
-- DROP TABLE Has;
-- DROP TABLE Car;
-- DROP TABLE User;
-- DROP TABLE Fuel;

-- apofasisa na sviso to fueltypeid kai na afiso to fueltype san primary key
CREATE TABLE Fuel(
  FuelType varchar(20),
  FuelPrice float,
  Primary Key (FuelType)
);

CREATE TABLE User(
  Email varchar(20),
  FirstName varchar(20),
  LastName varchar(20),
  password varchar(20),
  Primary Key (Email)
);

CREATE TABLE Car(
  CarPlate varchar(7), -- mia pinakida exei 3 grammata kai 4 noumera
  FuelType varchar(20),
  Brand varchar(20),
  Model varchar(20),
  ManufactureYear varchar(4), -- mipos na to kano date??
  CarKilometers float,
  NickName varchar(20),
  CarCode varchar(20),
  CarConsumption float,
  Primary Key (CarPlate),
  Foreign Key (FuelType) references Fuel(FuelType)
);

CREATE TABLE Has(
  Email varchar(20),
  CarPlate varchar(7),
  Primary Key(Email, CarPlate),
  Foreign Key (Email) references User(Email),
  Foreign key (CarPlate) references Car(CarPlate)
);

CREATE TABLE Booking(
  BookingId integer,
  BookingDate datetime,
  Email varchar(20),
  CarPlate varchar(7),
  Primary Key(BookingId),
  Foreign Key (Email) references User(Email),
  Foreign Key (CarPlate) references Car(CarPlate)
);

CREATE TABLE Trip(
  TripId integer,
  Email varchar(20),
  CarPlate varchar(7),
  DateOfTrip date,
  StartingPoint varchar(30), -- endeiktika 30 grammata
  Destination varchar(30),
  Distance float,
  Consumption float,
  TripCost float,
  FuelType varchar(20),
  Primary Key (TripId),
  Foreign Key (Email) references User(Email),
  Foreign Key (CarPlate) references Car(CarPlate),
  Foreign Key (FuelType) references Fuel(FuelType)
)