-- Drop the existing Booking table if it exists (backup data first if needed)
DROP TABLE IF EXISTS Booking;

-- Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL
) PARTITION BY RANGE (start_date);

-- Create partitions for specific years
CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_2026 PARTITION OF Booking
    FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

-- Create a default partition for future dates
CREATE TABLE Booking_default PARTITION OF Booking
    FOR VALUES FROM ('2027-01-01') TO ('9999-12-31');

-- Insert existing data (adjust based on your seed data)
-- Example: Copy data from a backup or temporary table
INSERT INTO Booking
SELECT * FROM old_booking_data
WHERE start_date >= '2025-01-01' AND start_date < '2026-01-01'; -- Adjust for 2025 partition

-- Add indexes on frequently used columns (assumes from Task 3)
CREATE INDEX idx_booking_start_date ON Booking (start_date);
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);