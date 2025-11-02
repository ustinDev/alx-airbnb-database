# Database Normalization – Property Booking System

## 1. Overview
This document outlines the normalization process applied to the **Property Booking System** database to ensure it adheres to **Third Normal Form (3NF)**.  
Normalization reduces redundancy, ensures data integrity, and improves maintainability.

The database consists of the following entities:
- User  
- Property  
- Booking  
- Payment  
- Review  
- Message  

---

## 2. Normalization Process

### **First Normal Form (1NF)**
**Rule:**  
- Each table cell should contain only atomic (indivisible) values.  
- Each record must be unique (primary key defined).  

**Application:**  
All tables meet 1NF requirements:
- Every attribute holds a single value (no arrays or repeating groups).  
- Each table has a defined **primary key** (`user_id`, `property_id`, `booking_id`, etc.).  
- Data types are atomic (VARCHAR, DECIMAL, DATE, ENUM, etc.).  

**Status:** All tables are in 1NF.

---

### **Second Normal Form (2NF)**
**Rule:**  
- The table must be in 1NF.  
- All non-key attributes must depend on the entire primary key (no partial dependency).  

**Application:**  
Each table has a **single-attribute primary key (UUID)**.  
There are no composite keys, so **partial dependency cannot occur**.  

Examples:
- In **Property**, attributes like `name`, `description`, and `location` depend entirely on `property_id`.  
- In **Booking**, `start_date`, `end_date`, and `status` depend fully on `booking_id`.  

**Status:** All tables are in 2NF.

---

### **Third Normal Form (3NF)**
**Rule:**  
- The table must be in 2NF.  
- No transitive dependencies (non-key attributes must not depend on other non-key attributes).  

**Application & Adjustments:**

| Table | Check | Action / Explanation |
|--------|--------|----------------------|
| **User** | All attributes depend solely on `user_id`. | No transitive dependency. |
| **Property** | `pricepernight`, `location`, and `host_id` depend only on `property_id`. | No transitive dependency. |
| **Booking** | Attributes (`start_date`, `end_date`, `total_price`, `status`) depend only on `booking_id`. | No transitive dependency. |
| **Payment** | Attributes (`amount`, `payment_method`, `payment_date`) depend only on `payment_id`. | No transitive dependency. |
| **Review** | `rating`, `comment`, `created_at` depend solely on `review_id`. | No transitive dependency. |
| **Message** | `message_body` and `sent_at` depend solely on `message_id`. | No transitive dependency. |

No non-key attribute depends on another non-key attribute, and all dependencies lead directly to the primary key.

**Status:** All tables are in 3NF.

---

## 3. Summary of Normalization

| Table | 1NF | 2NF | 3NF |
|--------|-----|-----|-----|
| User | ✅ | ✅ | ✅ |
| Property | ✅ | ✅ | ✅ |
| Booking | ✅ | ✅ | ✅ |
| Payment | ✅ | ✅ | ✅ |
| Review | ✅ | ✅ | ✅ |
| Message | ✅ | ✅ | ✅ |

---

## 4. Benefits Achieved
- **Eliminated redundancy:** No duplicate storage of user, property, or booking data.  
- **Improved integrity:** Each record depends directly on its primary key.  
- **Simplified updates:** Changes to one entity (e.g., user info) do not affect unrelated entities.  
- **Enhanced scalability:** The schema can be extended (e.g., adding availability calendars or notifications) without structural changes.

---

## 5. Final Verification
After applying normalization principles:
- The schema remains consistent and efficient.  
- All foreign keys maintain referential integrity.  
- The design supports 3NF with no modification needed beyond enforcing key constraints.

---

### Author:
*Odiase Stephen*  
*Date: November 2025*
