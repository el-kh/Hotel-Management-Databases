# Hotel Management System

## Overview

The **Hotel Management System** is a relational database project designed to efficiently manage hotel operations, including room reservations, staff management, restaurant services, gym and spa facilities, and customer payments. The system is structured using an **Entity-Relationship Diagram (ERD)** and follows best practices in database normalization to ensure data integrity and efficiency.

## Features

- **Hotel & Room Management**: Handles multiple hotels, their rooms, and availability.
- **Customer Management**: Stores customer details, including reservations and payments.
- **Staff & Department Management**: Manages hotel staff, their departments, and assigned hotels.
- **Restaurant & Menu Management**: Tracks restaurant tables, menu items, and orders.
- **Gym & Spa Services**: Supports gym equipment management and spa services.
- **Payment Processing**: Logs customer payments, methods, and statuses.

## Database Structure

### 1. **Entity-Relationship Diagram (ERD)**
The **ERD (Hotel ERD.png)** represents the system’s relational model, defining entity relationships such as:
- **Hotel, Rooms, and Customers**
- **Staff and Departments**
- **Restaurants, Tables, and Menus**
- **Gym, Spa, and Equipment**

### 2. **Functional Dependencies & Normalization**
The **document (Functional dependency and normalizations.docx)** outlines:
- Functional dependencies for all relations.
- **Normalization up to BCNF** to avoid redundancy and ensure consistency.

### 3. **Relational Schema**
- **Relational schemas.mwb**: MySQL Workbench schema file.
- **Relational schema.sql**: SQL script to create database tables.
- **Queries.sql**: Insertions and Queries on the tabeles
- 

## Installation & Setup

### Prerequisites
- MySQL or any SQL-compatible database management system.
- MySQL Workbench (for **.mwb** file visualization).
- Any SQL execution environment (e.g., MySQL CLI, Workbench, or PostgreSQL).

### Steps to Set Up the Database
1. **Import Schema**
   - Open MySQL Workbench.
   - Load the **Relational schemas.mwb** file to visualize database relationships.
   - Run **Relational schema.sql** to create tables.
   - Run **Queries.sql** to see queries

2. **Verify Schema**
   - Check tables using:
     ```sql
     SHOW TABLES;
     ```

3. **Populate Data (Optional)**
   - Insert sample data for testing using:
     ```sql
     INSERT INTO Hotel (hotel_id, Name, address, phone, email, webpage, stars, owner_id)
     VALUES (1, 'Luxury Hotel', '123 Main St', '+123456789', 'info@luxuryhotel.com', 'luxuryhotel.com', 5, 101);
     ```

4. **Run or add Queries**
   - Test queries such as:
     ```sql
     SELECT * FROM Room WHERE price < 200;
     ```
   - Perform joins to analyze customer reservations:
     ```sql
     SELECT Customers.Full_name, Room.type, Room.price
     FROM Customers
     JOIN RoomReserve ON Customers.customer_id = RoomReserve.customer_id
     JOIN Room ON RoomReserve.roomNumber = Room.roomNumber;
     ```

---

