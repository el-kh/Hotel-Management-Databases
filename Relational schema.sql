
use Hotels;


CREATE TABLE HotelOwner (
    owner_id INT(12) PRIMARY KEY,
    fName VARCHAR(20) NOT NULL,
    lName VARCHAR(30) NOT NULL,
    phone INT(20) NOT NULL,
    salary INT(10) NOT NULL
);


CREATE TABLE Hotel (
    hotel_id INT(12) PRIMARY KEY,
    hotel_name VARCHAR(30),
    address VARCHAR(40),
    phone INT(20),
    email VARCHAR(30),
    webpage VARCHAR(40),
    stars INT(1),
    owner_id INT(12) NOT NULL,
    FOREIGN KEY (owner_id)
        REFERENCES HotelOwner (owner_id)
);



CREATE TABLE Department (
    dep_id INT(12) PRIMARY KEY,
    department_name VARCHAR(20) NOT NULL,
    staffNumber INT(10) NOT NULL
);


CREATE TABLE Staff (
    member_id INT(10) PRIMARY KEY,
    firstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    phone INT(20) NOT NULL,
    memberPosition VARCHAR(20) NOT NULL,
    salary INT(10) NOT NULL,
    hotel_id INT(12) NOT NULL,
    dep_id INT(12) NOT NULL,
    FOREIGN KEY (hotel_id)
        REFERENCES Hotel (hotel_id),
    FOREIGN KEY (dep_id)
        REFERENCES Department (dep_id)
);

CREATE TABLE Room (
    roomNumber INT(5) PRIMARY KEY,
    roomType VARCHAR(20) NOT NULL,
    price INT(15) NOT NULL,
    roomStatus VARCHAR(20) NOT NULL,
    capacity INT(5) NOT NULL,
    hotel_id INT(12) NOT NULL,
    FOREIGN KEY (hotel_id)
        REFERENCES Hotel (hotel_id)
);

CREATE TABLE Customer (
    customer_id INT(20) PRIMARY KEY,
    passport_id INT(10),
    firstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    dob DATETIME NOT NULL,
    phone INT(20) NOT NULL,
    email VARCHAR(20) NOT NULL
);

CREATE TABLE RoomReserve (
    reserve_id INT(20) PRIMARY KEY,
    customer_id INT(20) NOT NULL,
    roomNumber INT(5) NOT NULL,
    checkin DATETIME NOT NULL,
    checkout DATETIME NOT NULL,
    total_price INT(20) NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id),
    FOREIGN KEY (roomNumber)
        REFERENCES Room (roomNumber)
);

CREATE TABLE Payment (
    payment_id INT(20) PRIMARY KEY,
    customer_id INT(20) NOT NULL,
    amount INT(20) NOT NULL,
    method VARCHAR(20) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
);
CREATE TABLE Restaurant (
    restaurant_id INT(12) PRIMARY KEY,
    restaurant_tables INT(5),
    hotel_id INT(12) NOT NULL,
    FOREIGN KEY (hotel_id)
        REFERENCES Hotel (hotel_id)
);


CREATE TABLE Menutype (
    menu_id INT(12) PRIMARY KEY,
    menuType VARCHAR(30) NOT NULL,
    restaurant_id INT(12) NOT NULL,
    FOREIGN KEY (restaurant_id)
        REFERENCES Restaurant (restaurant_id)
);

CREATE TABLE Items (
    itemName VARCHAR(20) PRIMARY KEY,
    usedIn INT(12) NOT NULL,
    FOREIGN KEY (usedIn)
        REFERENCES Menutype (menu_id)
);

CREATE TABLE MenuItem (
    menuItem INT(12) PRIMARY KEY,
    itemName VARCHAR(20) NOT NULL,
    menu_id INT(12) NOT NULL,
    FOREIGN KEY (itemName)
        REFERENCES Items (itemName),
    FOREIGN KEY (menu_id)
        REFERENCES Menutype (menu_id)
);

CREATE TABLE RestaurantTables (
    tableNumber INT(12) PRIMARY KEY,
    restaurant_id INT(12) NOT NULL,
    tableStatus VARCHAR(10),
    bill INT(10) NOT NULL,
    ordered VARCHAR(50) NOT NULL,
    FOREIGN KEY (restaurant_id)
        REFERENCES Restaurant (restaurant_id)
);
CREATE TABLE Gym (
    gym_id INT(12) PRIMARY KEY,
    equipment VARCHAR(20) NOT NULL,
    hotel_id INT(12) NOT NULL,
    FOREIGN KEY (hotel_id)
        REFERENCES Hotel (hotel_id)
);
CREATE TABLE GymEquipment (
    equipment_id INT(12) PRIMARY KEY,
    gym_id INT(12) NOT NULL,
    equipmentType VARCHAR(10),
    works VARCHAR(50) NOT NULL,
    FOREIGN KEY (gym_id)
        REFERENCES Gym (gym_id)
);
CREATE TABLE Spa (
    spa_id INT(12) PRIMARY KEY,
    services VARCHAR(20) NOT NULL,
    hotel_id INT(12) NOT NULL,
    FOREIGN KEY (hotel_id)
        REFERENCES Hotel (hotel_id)
);
CREATE TABLE SpaService (
    service_id INT(12) PRIMARY KEY,
    spa_id INT(12) NOT NULL,
    service_name VARCHAR(10) NOT NULL,
    price INT(50) NOT NULL,
    FOREIGN KEY (spa_id)
        REFERENCES Spa (spa_id)
);
