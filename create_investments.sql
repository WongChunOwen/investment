-- !preview conn=con

-- Create and fill a table of dividends
DROP TABLE IF EXISTS dividends_per_share CASCADE;
CREATE TABLE dividends_per_share (
    comp_id INT,
    time TIMESTAMPTZ,
    amount_in_usd MONEY,
    PRIMARY KEY (comp_id, time)
);
INSERT INTO dividends_per_share (comp_id, time, amount_in_usd)
VALUES
(1, '2023-04-15T04:05:06.75[Asia/Singapore]', '$1.49'),
(2, '2023-04-15T10:15:30.46[Asia/Kolkata]', '$0.24'),
(7, '2023-07-12T12:49:08.99[America/Toronto]', '$0.46'),
(2, '2023-09-15T16:58:00.51[Asia/Kolkata]', '$0.24'),
(1, '2023-10-05T00:00:00.00[Asia/Singapore]', '$1.52');

-- Create and fill a table of products sold by traded companies
DROP TABLE IF EXISTS products CASCADE;
CREATE TABLE products (
    comp_id INT,
    prod_name VARCHAR(255),
    price MONEY,
    PRIMARY KEY (comp_id, prod_name)
);
INSERT INTO products (comp_id, prod_name, price)
VALUES
(2, 'ByteMate Virtual Reality Headset', '$498.69'),
(5, 'Silly Saver Certificate of Deposit', '$100.00'),
(6, 'HyperMagneto Flying Drone', '$49.99'),
(6, 'NebulaForce Magnetic Motor', '$243.50'),
(9, 'Smart Spark Gadget', '$9.99'),
(9, 'WittyWatch', '$599.75'),
(9, 'WittyWatch Pro', '$799.75');

-- Create and fill a table of shareholders
DROP TABLE IF EXISTS shareholders CASCADE;
CREATE TABLE shareholders (
    sh_holder_id SERIAL PRIMARY KEY,
    sh_holder_name VARCHAR(255),
    country VARCHAR(255),
    is_indiv BOOL
);
INSERT INTO shareholders (sh_holder_name, country, is_indiv)
VALUES
('Haha Holdings Hub', 'Hungary', FALSE),
('LaughingStock Holdings, Inc.', 'Canada', FALSE),
('Li Mei', 'Singapore', TRUE),
('LOL Finance Firm', 'Singapore', FALSE),
('Neha Patel', 'India', TRUE),
('Nurul Hidayah', 'Malaysia', TRUE),
('Ponzi Pyramid Pension Portfolio', 'Australia', FALSE),
('Rajesh Kumar', 'India', TRUE);

-- Create and fill a table of shares
DROP TABLE IF EXISTS shares;
CREATE TABLE shares (
    sh_holder_id INT,
    comp_id INT,
    share_qty INT,
    PRIMARY KEY (sh_holder_id, comp_id)
);
INSERT INTO shares (sh_holder_id, comp_id, share_qty)
VALUES
(1, 3, 100),
(1, 4, 300),
(2, 2, 500),
(2, 3, 1000),
(3, 3, 250),
(4, 2, 800),
(5, 1, 150);

-- Create and fill a table of traded companies
DROP TABLE IF EXISTS traded_companies CASCADE;
CREATE TABLE traded_companies (
    comp_id SERIAL PRIMARY KEY,
    comp_name VARCHAR(255),
    country VARCHAR(255),
    sector VARCHAR(255),
    incorp_date DATE
);
INSERT INTO traded_companies (comp_name, country, sector, incorp_date)
VALUES
('Absurd Assets Associates', 'Singapore', 'Finance', '1999-9-19'),
('ByteMe Up Tech', 'India', 'Technology', '2005-08-15'),
('LaughingStock Holdings, Inc.', 'Canada', 'Finance', '1997-01-01'),
('LOL Finance Firm', 'Singapore', 'Finance', '2012-06-30'),
('Loony Loot National Bank', 'United Kingdom', 'Finance', '2010-04-22'),
('Magnetic Maverick Megacorp.', 'Australia', 'Technology', '2008-11-10'),
('Maple Syrup Bandits Inc.', 'Canada', 'Food', '1986-12-31'),
('Swiss Cheese Smuggling Syndicate', 'Switzerland', 'Food', '1948-03-27'),
('Witty Widgets Worldwide', 'Switzerland', 'Manufacturing', '2015-02-03');

-- Add foreign-key constraints
ALTER TABLE dividends_per_share
ADD FOREIGN KEY (comp_id) REFERENCES traded_companies;
ALTER TABLE products
ADD FOREIGN KEY (comp_id) REFERENCES traded_companies;
ALTER TABLE shares
ADD FOREIGN KEY (sh_holder_id) REFERENCES shareholders,
ADD FOREIGN KEY (comp_id) REFERENCES traded_companies;