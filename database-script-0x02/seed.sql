-- =============================================================
--  Database Seed Script: Airbnb Booking System
--  Repository: alx-airbnb-database
--  Directory: database-script-0x02
--  File: seed.sql
--  Description: Sample data inserts for testing the schema.
-- =============================================================

-- Clear tables in reverse dependency order
DELETE FROM Message;
DELETE FROM Review;
DELETE FROM Payment;
DELETE FROM Booking;
DELETE FROM Property;
DELETE FROM User;

-- =============================================================
--  USER TABLE
-- =============================================================
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hash_pw_1', '555-1234', 'guest', CURRENT_TIMESTAMP),
    ('22222222-2222-2222-2222-222222222222', 'Bob', 'Miller', 'bob@example.com', 'hash_pw_2', '555-5678', 'host', CURRENT_TIMESTAMP),
    ('33333333-3333-3333-3333-333333333333', 'Charlie', 'Smith', 'charlie@example.com', 'hash_pw_3', '555-9012', 'host', CURRENT_TIMESTAMP),
    ('44444444-4444-4444-4444-444444444444', 'Diana', 'Lee', 'diana@example.com', 'hash_pw_4', '555-3456', 'guest', CURRENT_TIMESTAMP),
    ('55555555-5555-5555-5555-555555555555', 'Evan', 'Taylor', 'evan@example.com', 'hash_pw_5', '555-7890', 'admin', CURRENT_TIMESTAMP);

-- =============================================================
--  PROPERTY TABLE
-- =============================================================
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('aaaa1111-aaaa-1111-aaaa-111111111111', '22222222-2222-2222-2222-222222222222',
     'Seaside Cottage', 'Cozy cottage near the ocean with 2 bedrooms and a garden.', 'California, USA', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('bbbb2222-bbbb-2222-bbbb-222222222222', '33333333-3333-3333-3333-333333333333',
     'Downtown Apartment', 'Modern apartment in the heart of the city.', 'New York, USA', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    ('cccc3333-cccc-3333-cccc-333333333333', '33333333-3333-3333-3333-333333333333',
     'Mountain Cabin', 'Peaceful cabin surrounded by nature.', 'Denver, USA', 180.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- =============================================================
--  BOOKING TABLE
-- =============================================================
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('dddd4444-dddd-4444-dddd-444444444444', 'aaaa1111-aaaa-1111-aaaa-111111111111',
     '11111111-1111-1111-1111-111111111111', '2025-12-01', '2025-12-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
    ('eeee5555-eeee-5555-eeee-555555555555', 'bbbb2222-bbbb-2222-bbbb-222222222222',
     '44444444-4444-4444-4444-444444444444', '2025-12-10', '2025-12-15', 1000.00, 'pending', CURRENT_TIMESTAMP),
    ('ffff6666-ffff-6666-ffff-666666666666', 'cccc3333-cccc-3333-cccc-333333333333',
     '11111111-1111-1111-1111-111111111111', '2026-01-02', '2026-01-07', 900.00, 'confirmed', CURRENT_TIMESTAMP);

-- =============================================================
--  PAYMENT TABLE
-- =============================================================
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('gggg7777-gggg-7777-gggg-777777777777', 'dddd4444-dddd-4444-dddd-444444444444', 600.00, CURRENT_TIMESTAMP, 'credit_card'),
    ('hhhh8888-hhhh-8888-hhhh-888888888888', 'ffff6666-ffff-6666-ffff-666666666666', 900.00, CURRENT_TIMESTAMP, 'paypal');

-- =============================================================
--  REVIEW TABLE
-- =============================================================
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('iiii9999-iiii-9999-iiii-999999999999', 'aaaa1111-aaaa-1111-aaaa-111111111111',
     '11111111-1111-1111-1111-111111111111', 5, 'Beautiful view and very clean!', CURRENT_TIMESTAMP),
    ('jjjj0000-jjjj-0000-jjjj-000000000000', 'bbbb2222-bbbb-2222-bbbb-222222222222',
     '44444444-4444-4444-4444-444444444444', 4, 'Great location, slightly noisy at night.', CURRENT_TIMESTAMP);

-- =============================================================
--  MESSAGE TABLE
-- =============================================================
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('kkkk1111-kkkk-1111-kkkk-111111111111', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222',
     'Hi Bob, I loved staying at your Seaside Cottage!', CURRENT_TIMESTAMP),
    ('llll2222-llll-2222-llll-222222222222', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111',
     'Thank you, Alice! You’re welcome anytime.', CURRENT_TIMESTAMP);

-- =============================================================
--  END OF SEED DATA
-- =============================================================
