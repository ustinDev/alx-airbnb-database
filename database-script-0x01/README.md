# Airbnb Database Schema

## 📘 Overview
This directory contains the SQL schema definition for the **Airbnb-style Property Booking System** database.  
The schema is designed to support user management, property listings, bookings, payments, reviews, and messaging between users.

---

## 📂 Files
| File | Description |
|------|--------------|
| `schema.sql` | SQL script that creates the database tables, constraints, and indexes. |

---

## 🧱 Entities
The schema includes six main tables:

1. **User** – Stores all user information (guests, hosts, admins).  
2. **Property** – Represents property listings created by hosts.  
3. **Booking** – Handles reservations between users and properties.  
4. **Payment** – Manages payment transactions related to bookings.  
5. **Review** – Captures user feedback and ratings on properties.  
6. **Message** – Allows direct communication between users.

---

## ⚙️ Features
- **Data Integrity:** Enforced through foreign key constraints.  
- **Referential Actions:** Cascade deletes ensure dependent data is removed automatically.  
- **Indexes:** Added to optimize performance on key lookup columns.  
- **ENUM and CHECK Constraints:** Enforce valid field values.  
- **Timestamps:** Automatic tracking of record creation and updates.

---

## 🧩 Normalization
The schema adheres to **Third Normal Form (3NF)**:
- No repeating groups or multi-valued attributes.
- No partial or transitive dependencies.
- All non-key attributes depend solely on their primary keys.

---

## 🚀 Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/ustinDev/alx-airbnb-database.git

2. cd alx-airbnb-database/database-script-0x01
3. psql -U <ustinDev_username> -d <ustinDev_database_name> -f schema.sql

