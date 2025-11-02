# Database Seed Script – Airbnb Booking System

## 📘 Overview
This directory contains SQL scripts to **populate the database** with sample data for the Airbnb-style booking system.

The data set includes:
- Multiple **users** (guests, hosts, admin)
- Several **properties** listed by hosts
- Active and pending **bookings**
- Related **payments**
- Customer **reviews**
- **Messages** exchanged between users

---

## 📂 Files
| File | Description |
|------|--------------|
| `seed.sql` | SQL script to insert sample data into all tables. |

---

## 🧩 Prerequisites
Ensure that:
- The database schema (`schema.sql`) from `database-script-0x01` has already been created.
- You are connected to the same database where the tables exist.

---

## 🚀 Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/ustinDev/alx-airbnb-database.git

2. cd alx-airbnb-database/database-script-0x02

3. psql -U <ustinDev_username> -d <ustinDev_database_name> -f seed.sql

4. Verify my datas:
    SELECT * FROM User;
    SELECT * FROM Property;
    SELECT * FROM Booking;
    SELECT * FROM Payment;
    SELECT * FROM Review;
    SELECT * FROM Message;


