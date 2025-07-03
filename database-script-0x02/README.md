# Airbnb Database Seed Data

## Overview
This directory contains SQL scripts to populate the `airbnb` database with sample data, simulating real-world usage for an Airbnb-like system. The data includes users, properties, bookings, payments, reviews, and messages.

## Files
- `seed.sql`: SQL script with INSERT statements to seed the database.

## Sample Data Details
- **Users**: 4 users (1 host, 2 guests, 1 admin) with varied details.
- **Properties**: 2 properties listed by the host with different locations and prices.
- **Bookings**: 2 bookings, one confirmed and one pending, spanning multiple days.
- **Payments**: 2 payments corresponding to the bookings, using different methods.
- **Reviews**: 2 reviews with ratings (4 and 5) and comments.
- **Messages**: 2 messages between a guest and host regarding a booking.

## Usage
1. Ensure the `airbnb` database and schema (from `database-script-0x01/schema.sql`) are created.
2. Execute the `seed.sql` script in a SQL environment (e.g., MySQL, PostgreSQL) that supports UUID and ENUM types.
3. Verify data insertion using SELECT queries (e.g., `SELECT * FROM User;`).

