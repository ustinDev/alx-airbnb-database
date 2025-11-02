# Database Requirements – Property Booking System

## 1. Overview
This document defines the database schema and entity relationships for the **Property Booking System**.  
It specifies all entities, attributes, data types, constraints, and relationships required to implement the system.

---

## 2. Entities and Attributes

### **User**
Represents all registered users, including guests, hosts, and admins.

| Attribute | Type | Constraints |
|------------|------|-------------|
| user_id | UUID | **Primary Key**, Indexed |
| first_name | VARCHAR | **NOT NULL** |
| last_name | VARCHAR | **NOT NULL** |
| email | VARCHAR | **UNIQUE, NOT NULL** |
| password_hash | VARCHAR | **NOT NULL** |
| phone_number | VARCHAR | NULL |
| role | ENUM (‘guest’, ‘host’, ‘admin’) | **NOT NULL** |
| created_at | TIMESTAMP | **DEFAULT CURRENT_TIMESTAMP** |

---

### **Property**
Represents properties listed by hosts.

| Attribute | Type | Constraints |
|------------|------|-------------|
| property_id | UUID | **Primary Key**, Indexed |
| host_id | UUID | **Foreign Key → User(user_id)** |
| name | VARCHAR | **NOT NULL** |
| description | TEXT | **NOT NULL** |
| location | VARCHAR | **NOT NULL** |
| pricepernight | DECIMAL | **NOT NULL** |
| created_at | TIMESTAMP | **DEFAULT CURRENT_TIMESTAMP** |
| updated_at | TIMESTAMP | **ON UPDATE CURRENT_TIMESTAMP** |

---

### **Booking**
Represents reservations made by users for specific properties.

| Attribute | Type | Constraints |
|------------|------|-------------|
| booking_id | UUID | **Primary Key**, Indexed |
| property_id | UUID | **Foreign Key → Property(property_id)** |
| user_id | UUID | **Foreign Key → User(user_id)** |
| start_date | DATE | **NOT NULL** |
| end_date | DATE | **NOT NULL** |
| total_price | DECIMAL | **NOT NULL** |
| status | ENUM (‘pending’, ‘confirmed’, ‘canceled’) | **NOT NULL** |
| created_at | TIMESTAMP | **DEFAULT CURRENT_TIMESTAMP** |

---

### **Payment**
Stores payment transactions for bookings.

| Attribute | Type | Constraints |
|------------|------|-------------|
| payment_id | UUID | **Primary Key**, Indexed |
| booking_id | UUID | **Foreign Key → Booking(booking_id)** |
| amount | DECIMAL | **NOT NULL** |
| payment_date | TIMESTAMP | **DEFAULT CURRENT_TIMESTAMP** |
| payment_method | ENUM (‘credit_card’, ‘paypal’, ‘stripe’) | **NOT NULL** |

---

### **Review**
Captures user feedback and ratings for properties.

| Attribute | Type | Constraints |
|------------|------|-------------|
| review_id | UUID | **Primary Key**, Indexed |
| property_id | UUID | **Foreign Key → Property(property_id)** |
| user_id | UUID | **Foreign Key → User(user_id)** |
| rating | INTEGER | **CHECK (rating >= 1 AND rating <= 5), NOT NULL** |
| comment | TEXT | **NOT NULL** |
| created_at | TIMESTAMP | **DEFAULT CURRENT_TIMESTAMP** |

---

### **Message**
Facilitates communication between users (e.g., guest ↔ host).

| Attribute | Type | Constraints |
|------------|------|-------------|
| message_id | UUID | **Primary Key**, Indexed |
| sender_id | UUID | **Foreign Key → User(user_id)** |
| recipient_id | UUID | **Foreign Key → User(user_id)** |
| message_body | TEXT | **NOT NULL** |
| sent_at | TIMESTAMP | **DEFAULT CURRENT_TIMESTAMP** |

---

## 3. Constraints

### **User Table**
- Unique constraint on `email`.  
- Non-null constraints on all required fields (`first_name`, `last_name`, `email`, `password_hash`, `role`).  

### **Property Table**
- Foreign key constraint on `host_id` referencing `User(user_id)`.  
- Non-null constraints on `name`, `description`, `location`, and `pricepernight`.  

### **Booking Table**
- Foreign key constraints on `property_id` and `user_id`.  
- `status` must be one of (`pending`, `confirmed`, `canceled`).  

### **Payment Table**
- Foreign key constraint on `booking_id`, ensuring payment is linked to a valid booking.  

### **Review Table**
- `rating` must be between **1 and 5** (inclusive).  
- Foreign key constraints on `property_id` and `user_id`.  

### **Message Table**
- Foreign key constraints on `sender_id` and `recipient_id`, ensuring messages are only between valid users.  

---

## 4. Indexing

- **Primary Keys:** Indexed automatically for all tables.  
- **Additional Indexes:**
  - `email` in **User** table.  
  - `property_id` in **Property** and **Booking** tables.  
  - `booking_id` in **Booking** and **Payment** tables.  

---

## 5. Relationships

| Relationship | Type | Description |
|---------------|------|-------------|
| User → Property | 1 : M | A host can have multiple properties. |
| User → Booking | 1 : M | A user can make multiple bookings. |
| Property → Booking | 1 : M | A property can have multiple bookings. |
| Booking → Payment | 1 : 1 | Each booking has one payment record. |
| Property → Review | 1 : M | A property can have multiple reviews. |
| User → Review | 1 : M | A user can write multiple reviews. |
| User ↔ Message | M : M | Users can send messages to each other (via sender_id and recipient_id). |

---

## 6. ER Diagram

Attached is the ER Diagram i created:

```markdown
![ER Diagram](./er-diagram.png)
