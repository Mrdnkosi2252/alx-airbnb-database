USE airbnb;

-- Insert sample Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440000', 'John', 'Doe', 'john.doe@example.com', 'hashedpassword1', '+1234567890', 'host', '2025-06-01 10:00:00'),
('550e8400-e29b-41d4-a716-446655440001', 'Jane', 'Smith', 'jane.smith@example.com', 'hashedpassword2', '+0987654321', 'guest', '2025-06-02 12:00:00'),
('550e8400-e29b-41d4-a716-446655440002', 'Alice', 'Johnson', 'alice.j@example.com', 'hashedpassword3', NULL, 'guest', '2025-06-03 14:00:00'),
('550e8400-e29b-41d4-a716-446655440003', 'Bob', 'Brown', 'bob.brown@example.com', 'hashedpassword4', '+1122334455', 'admin', '2025-06-04 16:00:00');

-- Insert sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440000', 'Cozy Apartment', 'A cozy 2-bedroom apartment in the city center.', 'Cape Town, South Africa', 120.50, '2025-06-05 09:00:00', '2025-06-10 15:00:00'),
('550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440000', 'Beach House', 'Spacious beachfront house with ocean views.', 'Durban, South Africa', 250.00, '2025-06-06 11:00:00', '2025-06-12 17:00:00');

-- Insert sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('550e8400-e29b-41d4-a716-446655440006', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', '2025-07-01', '2025-07-05', 482.00, 'confirmed', '2025-06-15 10:00:00'),
('550e8400-e29b-41d4-a716-446655440007', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', '2025-07-10', '2025-07-12', 500.00, 'pending', '2025-06-16 12:00:00');

-- Insert sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('550e8400-e29b-41d4-a716-446655440008', '550e8400-e29b-41d4-a716-446655440006', 482.00, '2025-06-16 14:00:00', 'credit_card'),
('550e8400-e29b-41d4-a716-446655440009', '550e8400-e29b-41d4-a716-446655440007', 250.00, '2025-06-17 16:00:00', 'paypal');

-- Insert sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('550e8400-e29b-41d4-a716-44665544000a', '550e8400-e29b-41d4-a716-446655440004', '550e8400-e29b-41d4-a716-446655440001', 4, 'Great stay, very clean and comfortable!', '2025-07-06 09:00:00'),
('550e8400-e29b-41d4-a716-44665544000b', '550e8400-e29b-41d4-a716-446655440005', '550e8400-e29b-41d4-a716-446655440002', 5, 'Amazing view, highly recommend!', '2025-07-13 11:00:00');

-- Insert sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('550e8400-e29b-41d4-a716-44665544000c', '550e8400-e29b-41d4-a716-446655440001', '550e8400-e29b-41d4-a716-446655440000', 'Can I check in early?', '2025-06-20 10:00:00'),
('550e8400-e29b-41d4-a716-44665544000d', '550e8400-e29b-41d4-a716-446655440000', '550e8400-e29b-41d4-a716-446655440001', 'Yes, 2 PM is fine.', '2025-06-20 11:00:00');