# Airbnb Database Schema

## Overview
This directory contains the SQL Data Definition Language (DDL) scripts to create a database schema for an Airbnb-like system. The schema includes tables for users, properties, bookings, payments, reviews, and messages, with appropriate constraints and indexes for optimal performance.

## Files
- `schema.sql`: SQL script defining the database schema with CREATE TABLE statements, constraints, and indexes.

## Schema Details
- **Database Name**: `airbnb`
- **Tables**:
  - `User`: Stores user information with a unique email and role (guest, host, admin).
  - `Property`: Manages property listings with a foreign key to the host (User).
  - `Booking`: Handles booking details with foreign keys to Property and User.
  - `Payment`: Tracks payments linked to bookings.
  - `Review`: Stores reviews with ratings (1-5) linked to properties and users.
  - `Message`: Manages messages between users with sender and recipient foreign keys.

## Constraints
- Primary keys are UUIDs for all tables.
- Unique constraint on `email` in `User`.
- Foreign key constraints ensure referential integrity.
- `rating` in `Review` is constrained between 1 and 5.
- ENUM types are used for `role`, `status`, and `payment_method`.

## Indexes
- Automatic indexing on primary keys.
- Additional indexes on `email` (User), `property_id` (Property, Booking, Review), and `booking_id` (Booking, Payment) for performance optimization.

## Usage
1. Execute the `schema.sql` script in a SQL environment (e.g., MySQL, PostgreSQL) that supports UUID and ENUM types.
2. Ensure the database `airbnb` is created before running the script.
3. Verify table creation and constraints using appropriate SQL commands (e.g., `DESCRIBE` or `\d`).

