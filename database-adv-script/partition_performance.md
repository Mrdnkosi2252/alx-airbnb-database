# Partition Performance Analysis for alx-airbnb-database

## Overview
This report evaluates the performance impact of partitioning the `Booking` table by `start_date` to optimize queries on large datasets. Partitioning was implemented in `partitioning.sql`, and performance was tested using `EXPLAIN ANALYZE`.

## Partitioning Implementation
- **File**: `partitioning.sql`
- **Approach**: Range partitioning by `start_date` into yearly partitions (e.g., `Booking_2025`, `Booking_2026`, `Booking_default`).
- **Command Example** (PostgreSQL):
  ```sql
  CREATE TABLE Booking (
      booking_id UUID PRIMARY KEY,
      user_id UUID NOT NULL,
      property_id UUID NOT NULL,
      start_date DATE NOT NULL,
      end_date DATE NOT NULL,
      total_price DECIMAL(10, 2) NOT NULL,
      status VARCHAR(20) NOT NULL
  ) PARTITION BY RANGE (start_date);
  CREATE TABLE Booking_2025 PARTITION OF Booking
      FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
