-- ============================================================
-- Product Inventory Management System — Seed Data
-- Timeline: March – April 2026 | Domain: Tech Products
-- ============================================================

-- Password for all users: "Admin@123" (BCrypt encoded)
-- Run: docker compose exec -T db psql -U postgres -d "HCL-LMS" < seed.sql
-- Safe to re-run: truncates all tables first

BEGIN;

TRUNCATE stock_alerts, purchase_order_items, purchase_orders, transactions,
          supplier_profiles, supplier_metrics, products, suppliers, categories, users
RESTART IDENTITY CASCADE;

-- ======================== CATEGORIES ========================
INSERT INTO categories (id, name) VALUES
    (1, 'Laptops'),
    (2, 'Smartphones'),
    (3, 'Tablets'),
    (4, 'Monitors'),
    (5, 'Keyboards'),
    (6, 'Mice'),
    (7, 'Headphones'),
    (8, 'Storage'),
    (9, 'Networking'),
    (10, 'Accessories');

-- ========================== USERS ===========================
INSERT INTO users (id, name, email, password, phone_number, role, created_at) VALUES
    (1,  'ayush',      'ayush@gmail.com',      '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543201', 'ADMIN',               '2026-03-01 09:00:00'),
    (2,  'smriti',     'smriti@gmail.com',      '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543202', 'ADMIN',               '2026-03-01 09:01:00'),
    (3,  'palak',      'palak@gmail.com',       '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543203', 'ADMIN',               '2026-03-01 09:02:00'),
    (4,  'abhishek',   'abhishek@gmail.com',    '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543204', 'ADMIN',               '2026-03-01 09:03:00'),
    (5,  'parth',      'parth@gmail.com',       '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543205', 'ADMIN',               '2026-03-01 09:04:00'),
    (6,  'ramkrishna', 'ramkrishna@gmail.com',  '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543206', 'ADMIN',               '2026-03-01 09:05:00'),
    (7,  'abhay',      'abhay@gmail.com',       '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543207', 'ADMIN',               '2026-03-01 09:06:00'),
    (8,  'raja rao',   'rajarao@gmail.com',    '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543208', 'ADMIN',               '2026-03-01 09:07:00'),
    (9,  'naman',      'naman@gmail.com',       '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543209', 'ADMIN',               '2026-03-01 09:08:00'),
    (10, 'raman',      'raman@gmail.com',       '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543210', 'ADMIN',               '2026-03-01 09:09:00'),
    (11, 'officer',    'officer@ims.io',        '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543211', 'PROCUREMENT_OFFICER',  '2026-03-01 09:10:00'),
    (12, 'manager',    'manager@ims.io',        '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543212', 'WAREHOUSE_MANAGER',    '2026-03-01 09:11:00'),
    (13, 'staff',      'staff@ims.io',          '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543213', 'STAFF',                '2026-03-01 09:12:00'),
    (14, 'dev',        'dev@ims.io',            '$2b$10$b8HMOjqGUECQEwUV7badJek1qxtDw7oJzJY7ASpJtXODvhYwZsQ6e', '+91-9876543214', 'STAFF',                '2026-03-05 11:00:00');

-- ========================= SUPPLIERS ========================
INSERT INTO suppliers (id, name, address, status) VALUES
    (1,  'TechDistro India Pvt Ltd',     'Block A, Electronic City, Bangalore 560100',     'ACTIVE'),
    (2,  'CompuWholesale Mumbai',         '14 Marine Drive, Mumbai 400020',                 'ACTIVE'),
    (3,  'GadgetPro Supply Chain',        'Plot 22, Nehru Nagar, Hyderabad 500029',         'ACTIVE'),
    (4,  'PeripheralKing Solutions',      '45 MG Road, Pune 411001',                        'ACTIVE'),
    (5,  'ByteShift Logistics',           '78 Salt Lake, Kolkata 700091',                   'ACTIVE'),
    (6,  'DigiMart Imports',              'Sector 18, Noida 201301',                        'ACTIVE'),
    (7,  'SiliconEdge Traders',           '12 T Nagar, Chennai 600017',                     'ACTIVE'),
    (8,  'Omega Parts & Accessories',     'Phase 2, Gandhinagar 382355',                    'INACTIVE');

-- ========================= PRODUCTS =========================
INSERT INTO products (id, name, sku, price, stock_quantity, description, image_url, category_id, created_at) VALUES
    -- Laptops
    (1,  'MacBook Pro 14" M4',           'LAP-MBP14-001', 199999.00,  25, 'Apple MacBook Pro 14-inch with M4 chip, 16GB RAM, 512GB SSD',    null, 1, '2026-03-02 10:00:00'),
    (2,  'Dell XPS 15 9540',             'LAP-DXPS-002',  154990.00,  40, 'Dell XPS 15 OLED, Intel i9-14900H, 32GB RAM, 1TB SSD',           null, 1, '2026-03-02 10:05:00'),
    (3,  'ThinkPad X1 Carbon Gen 12',    'LAP-TPX1-003',  142500.00,  18, 'Lenovo ThinkPad X1 Carbon, Intel i7, 16GB RAM, 512GB SSD',       null, 1, '2026-03-02 10:10:00'),
    (4,  'ASUS ROG Zephyrus G16',        'LAP-ROGZ-004',  179990.00,  12, 'ASUS ROG Zephyrus G16, RTX 4070, 32GB RAM, 1TB SSD',             null, 1, '2026-03-05 11:00:00'),
    (5,  'HP Spectre x360 14',           'LAP-HSPC-005',  128990.00,  30, 'HP Spectre x360 2-in-1, Intel i7, 16GB RAM, 512GB SSD',          null, 1, '2026-03-05 11:05:00'),

    -- Smartphones
    (6,  'iPhone 16 Pro 256GB',          'PHN-IP16-006',  119900.00,  55, 'Apple iPhone 16 Pro, A18 Pro chip, Titanium frame',               null, 2, '2026-03-02 10:30:00'),
    (7,  'Samsung Galaxy S25 Ultra',     'PHN-SGS25-007', 109999.00,  65, 'Samsung Galaxy S25 Ultra, Snapdragon 8 Gen 4, 256GB',            null, 2, '2026-03-02 10:35:00'),
    (8,  'Google Pixel 10 Pro',          'PHN-PX10-008',   89999.00,  35, 'Google Pixel 10 Pro, Tensor G5, 128GB',                           null, 2, '2026-03-03 09:00:00'),
    (9,  'OnePlus 13',                   'PHN-OP13-009',   64999.00,  80, 'OnePlus 13, Snapdragon 8 Gen 4, 12GB RAM, 256GB',                null, 2, '2026-03-03 09:05:00'),
    (10, 'Nothing Phone 3',              'PHN-NP03-010',   39999.00,  45, 'Nothing Phone 3, Snapdragon 8s Gen 4, 128GB',                    null, 2, '2026-03-03 09:10:00'),

    -- Tablets
    (11, 'iPad Pro M4 11"',              'TAB-IPM4-011',   99990.00,  30, 'Apple iPad Pro 11-inch M4, 256GB Wi-Fi',                         null, 3, '2026-03-04 10:00:00'),
    (12, 'Samsung Galaxy Tab S10 Ultra', 'TAB-SGS10-012',  84999.00,  20, 'Samsung Galaxy Tab S10 Ultra, 14.6", 256GB',                     null, 3, '2026-03-04 10:05:00'),
    (13, 'iPad Air M3',                  'TAB-IPAIR-013',  69900.00,  35, 'Apple iPad Air M3, 11-inch, 128GB',                              null, 3, '2026-03-04 10:10:00'),

    -- Monitors
    (14, 'LG UltraFine 5K 27"',          'MON-LG5K-014',   72999.00,  15, 'LG UltraFine 5K 27-inch IPS Display',                            null, 4, '2026-03-04 11:00:00'),
    (15, 'Samsung Odyssey G9 49"',       'MON-SOD9-015',   99990.00,  8,  'Samsung Odyssey G9 49" Curved QLED, 240Hz',                      null, 4, '2026-03-04 11:05:00'),
    (16, 'Dell UltraSharp U2723QE',      'MON-DELL-016',   42999.00,  22, 'Dell UltraSharp 27" 4K USB-C Hub Monitor',                       null, 4, '2026-03-04 11:10:00'),

    -- Keyboards
    (17, 'Keychron Q1 Max',              'KEY-KQ1M-017',   16999.00,  50, 'Keychron Q1 Max, QMK/VIA, Gateron switches',                     null, 5, '2026-03-05 09:00:00'),
    (18, 'Logitech MX Keys S',           'KEY-MXKS-018',    9999.00,  70, 'Logitech MX Keys S, Wireless, Backlit',                          null, 5, '2026-03-05 09:05:00'),
    (19, 'Corsair K100 RGB',             'KEY-CK100-019',  14999.00,  35, 'Corsair K100 RGB OPX, Mechanical Gaming Keyboard',               null, 5, '2026-03-05 09:10:00'),

    -- Mice
    (20, 'Logitech MX Master 3S',        'MSE-MXM3S-020',   8999.00,  90, 'Logitech MX Master 3S, Wireless, Ergonomic',                     null, 6, '2026-03-05 10:00:00'),
    (21, 'Razer DeathAdder V3 Pro',      'MSE-RDDV3-021',   7999.00,  60, 'Razer DeathAdder V3 Pro, Wireless Gaming Mouse',                 null, 6, '2026-03-05 10:05:00'),

    -- Headphones
    (22, 'Sony WH-1000XM6',             'HDP-SNXM6-022',  29990.00,  40, 'Sony WH-1000XM6, ANC, 40h battery',                              null, 7, '2026-03-06 09:00:00'),
    (23, 'AirPods Max USB-C',            'HDP-APMX-023',   59900.00,  25, 'Apple AirPods Max, USB-C, ANC',                                  null, 7, '2026-03-06 09:05:00'),
    (24, 'Bose QC Ultra Headphones',     'HDP-BQCU-024',   34990.00,  30, 'Bose QuietComfort Ultra, Spatial Audio',                         null, 7, '2026-03-06 09:10:00'),

    -- Storage
    (25, 'Samsung 990 Pro 2TB NVMe',     'STO-S990-025',   15999.00, 100, 'Samsung 990 Pro 2TB M.2 NVMe SSD',                               null, 8, '2026-03-06 10:00:00'),
    (26, 'WD Black SN850X 4TB',          'STO-WDBK-026',   32999.00,  45, 'WD Black SN850X 4TB NVMe SSD',                                   null, 8, '2026-03-06 10:05:00'),
    (27, 'Seagate IronWolf 8TB NAS',     'STO-STIW-027',   19999.00,  30, 'Seagate IronWolf 8TB NAS HDD, 7200RPM',                          null, 8, '2026-03-06 10:10:00'),

    -- Networking
    (28, 'TP-Link Archer AXE300',        'NET-TPAXE-028',  24999.00,  20, 'TP-Link Archer AXE300, Wi-Fi 6E Router',                         null, 9, '2026-03-07 09:00:00'),
    (29, 'Ubiquiti UniFi 6 Enterprise',  'NET-UBU6-029',   19999.00,  15, 'Ubiquiti UniFi 6 Enterprise AP',                                  null, 9, '2026-03-07 09:05:00'),

    -- Accessories
    (30, 'Anker 737 Power Bank 24K',     'ACC-ANK737-030',  7999.00, 120, 'Anker 737 Power Bank, 24000mAh, 140W',                           null, 10, '2026-03-07 10:00:00'),
    (31, 'Belkin Thunderbolt 4 Dock',    'ACC-BLKT4-031',  27999.00,  25, 'Belkin Thunderbolt 4 Dock Pro, 12-in-1',                         null, 10, '2026-03-07 10:05:00'),
    (32, 'CalDigit TS4 Thunderbolt',     'ACC-CDTS4-032',  32999.00,  18, 'CalDigit TS4 Thunderbolt 4 Dock, 18 ports',                      null, 10, '2026-03-07 10:10:00');

-- =================== SUPPLIER PROFILES =====================
INSERT INTO supplier_profiles (id, supplier_id, email, category_specialisation, payment_terms, star_rating, on_time_delivery_percent, active) VALUES
    (1,  1, 'orders@techdistro.in',     'Laptops,Smartphones',     'Net 30', 4.8, 95, true),
    (2,  2, 'sales@compuwholesale.in',   'Monitors,Storage',        'Net 15', 4.5, 88, true),
    (3,  3, 'info@gadgetpro.in',         'Smartphones,Tablets',     'Net 30', 4.7, 92, true),
    (4,  4, 'b2b@peripheralking.in',     'Keyboards,Mice,Headphones','Net 15', 4.3, 85, true),
    (5,  5, 'logistics@byteshift.in',    'Networking,Accessories',  'Net 60', 4.0, 78, true),
    (6,  6, 'imports@digimart.in',       'Laptops,Tablets',         'Net 30', 4.6, 90, true),
    (7,  7, 'trade@siliconedge.in',      'Storage,Accessories',     'Net 15', 4.4, 87, true);

-- =================== SUPPLIER METRICS ======================
INSERT INTO supplier_metrics (id, supplier_id, email, category_specialisation, payment_terms, star_rating, on_time_delivery_percent, quality_score_percent, response_time_score, active, total_purchase_value, created_at) VALUES
    (1,  1, 'orders@techdistro.in',     'Laptops,Smartphones',     'Net 30', 4.8, 95, 96, 88, true, 4850000.00, '2026-03-01 09:00:00'),
    (2,  2, 'sales@compuwholesale.in',   'Monitors,Storage',        'Net 15', 4.5, 88, 91, 82, true, 2100000.00, '2026-03-01 09:00:00'),
    (3,  3, 'info@gadgetpro.in',         'Smartphones,Tablets',     'Net 30', 4.7, 92, 94, 90, true, 3700000.00, '2026-03-01 09:00:00'),
    (4,  4, 'b2b@peripheralking.in',     'Keyboards,Mice,Headphones','Net 15', 4.3, 85, 89, 78, true, 1500000.00, '2026-03-01 09:00:00'),
    (5,  5, 'logistics@byteshift.in',    'Networking,Accessories',  'Net 60', 4.0, 78, 82, 72, true,  900000.00, '2026-03-01 09:00:00'),
    (6,  6, 'imports@digimart.in',       'Laptops,Tablets',         'Net 30', 4.6, 90, 93, 85, true, 2800000.00, '2026-03-01 09:00:00'),
    (7,  7, 'trade@siliconedge.in',      'Storage,Accessories',     'Net 15', 4.4, 87, 90, 80, true, 1200000.00, '2026-03-01 09:00:00');

-- ==================== PURCHASE ORDERS ======================
INSERT INTO purchase_orders (id, order_number, supplier_id, required_by_date, expected_delivery_date, status, total_value, priority, notes, created_at, created_by_user_id) VALUES
    (1,  'PO-2026-001', 1, '2026-03-20', '2026-03-18', 'RECEIVED',  2799970.00, 'Normal',  'Initial stock — laptops and phones',            '2026-03-02 10:00:00', 11),
    (2,  'PO-2026-002', 3, '2026-03-22', '2026-03-20', 'RECEIVED',  10999850.00,'High',   'Flagship smartphones for launch',               '2026-03-03 09:00:00', 11),
    (3,  'PO-2026-003', 4, '2026-03-25', '2026-03-23', 'RECEIVED',  1750000.00, 'Normal',  'Peripherals restock',                           '2026-03-05 09:30:00', 11),
    (4,  'PO-2026-004', 2, '2026-04-01', '2026-03-30', 'RECEIVED',  1720000.00, 'Normal',  'Monitors and storage drives',                   '2026-03-10 11:00:00', 11),
    (5,  'PO-2026-005', 1, '2026-04-10', '2026-04-08', 'RECEIVED',  2140000.00, 'Normal',  'MacBook and ThinkPad restock',                  '2026-03-25 14:00:00', 11),
    (6,  'PO-2026-006', 5, '2026-04-15', '2026-04-12', 'RECEIVED',   600000.00, 'Low',    'Networking equipment',                          '2026-04-01 10:00:00', 11),
    (7,  'PO-2026-007', 3, '2026-04-20', '2026-04-18', 'APPROVED',  2500000.00, 'High',   'Galaxy Tab and iPad restock',                   '2026-04-08 11:00:00', 11),
    (8,  'PO-2026-008', 4, '2026-04-25', '2026-04-22', 'PENDING',    980000.00, 'Normal',  'Keyboard and mouse replenishment',              '2026-04-15 09:00:00', 11),
    (9,  'PO-2026-009', 6, '2026-04-28', '2026-04-25', 'APPROVED',  1800000.00, 'High',   'Laptop and tablet import',                      '2026-04-18 14:00:00', 11),
    (10, 'PO-2026-010', 7, '2026-04-30', '2026-04-28', 'PENDING',    450000.00, 'Normal',  'SSD and power bank stock',                      '2026-04-20 10:00:00', 11);

-- ================= PURCHASE ORDER ITEMS ====================
INSERT INTO purchase_order_items (id, purchase_order_id, product_id, quantity, unit_price, line_total) VALUES
    -- PO-2026-001: TechDistro — laptops & phones
    (1,  1, 1,  10, 199999.00, 1999990.00),
    (2,  1, 5,  10, 128990.00, 128990.00),
    (3,  1, 6,  50, 109999.00, 5499950.00),
    -- PO-2026-002: GadgetPro — smartphones
    (4,  2, 7,  60, 109999.00, 6599940.00),
    (5,  2, 9,  50, 64999.00,  3249950.00),
    -- PO-2026-003: PeripheralKing — peripherals
    (6,  3, 17, 40, 16999.00,  679960.00),
    (7,  3, 20, 60, 8999.00,   539940.00),
    (8,  3, 22, 30, 29990.00,  899700.00),
    -- PO-2026-004: CompuWholesale — monitors & storage
    (9,  4, 14, 10, 72999.00,  729990.00),
    (10, 4, 16, 15, 42999.00,  644985.00),
    (11, 4, 25, 50, 15999.00,  799950.00),
    -- PO-2026-005: TechDistro — laptop restock
    (12, 5, 1,  5,  199999.00, 999995.00),
    (13, 5, 3,  8,  142500.00, 1140000.00),
    -- PO-2026-006: ByteShift — networking
    (14, 6, 28, 10, 24999.00,  249990.00),
    (15, 6, 29,  5, 19999.00,   99995.00),
    (16, 6, 30, 30, 7999.00,   239970.00),
    -- PO-2026-007: GadgetPro — tablet restock
    (17, 7, 11, 20, 99990.00,  1999800.00),
    (18, 7, 12, 10, 84999.00,  849990.00),
    -- PO-2026-008: PeripheralKing — kb/mouse
    (19, 8, 18, 40, 9999.00,   399960.00),
    (20, 8, 21, 30, 7999.00,   239970.00),
    -- PO-2026-009: DigiMart — laptops & tablets
    (21, 9, 2,  10, 154990.00, 1549900.00),
    (22, 9, 13, 20, 69900.00,  1398000.00),
    -- PO-2026-010: SiliconEdge — SSD & power banks
    (23, 10, 26, 10, 32999.00,  329990.00),
    (24, 10, 30, 15, 7999.00,   119985.00);

-- ==================== TRANSACTIONS =========================
INSERT INTO transactions (id, total_products, total_price, transaction_type, status, description, created_at, user_id, product_id, supplier_id) VALUES
    -- March 2026 — Purchases (stocking up)
    (1,   10, 1999990.00, 'PURCHASE', 'COMPLETED', 'Initial MacBook Pro M4 stock',                   '2026-03-05 10:00:00', 12, 1,  1),
    (2,   50, 5499950.00, 'PURCHASE', 'COMPLETED', 'iPhone 16 Pro batch for launch',                 '2026-03-05 14:00:00', 12, 6,  1),
    (3,   60, 6599940.00, 'PURCHASE', 'COMPLETED', 'Galaxy S25 Ultra batch',                         '2026-03-06 09:00:00', 12, 7,  3),
    (4,   10, 1289900.00, 'PURCHASE', 'COMPLETED', 'HP Spectre x360 initial stock',                  '2026-03-06 11:00:00', 12, 5,  1),
    (5,   50, 679960.00,  'PURCHASE', 'COMPLETED', 'Keychron Q1 Max restock',                        '2026-03-08 09:30:00', 12, 17, 4),
    (6,   60, 539940.00,  'PURCHASE', 'COMPLETED', 'Logitech MX Master 3S batch',                    '2026-03-08 10:00:00', 12, 20, 4),
    (7,   30, 899700.00,  'PURCHASE', 'COMPLETED', 'Sony WH-1000XM6 headphones',                    '2026-03-08 11:00:00', 12, 22, 4),
    (8,   50, 3249950.00, 'PURCHASE', 'COMPLETED', 'OnePlus 13 batch',                               '2026-03-10 09:00:00', 12, 9,  3),
    (9,   40, 1549900.00, 'PURCHASE', 'COMPLETED', 'Dell XPS 15 initial stock',                      '2026-03-10 11:00:00', 12, 2,  6),
    (10,  18, 617400.00,  'PURCHASE', 'COMPLETED', 'ThinkPad X1 Carbon restock',                     '2026-03-12 09:30:00', 12, 3,  1),
    (11,  15, 729990.00,  'PURCHASE', 'COMPLETED', 'LG UltraFine 5K monitors',                       '2026-03-15 10:00:00', 12, 14, 2),
    (12,  22, 945978.00,  'PURCHASE', 'COMPLETED', 'Dell UltraSharp 4K monitors',                    '2026-03-15 10:30:00', 12, 16, 2),
    (13, 100, 1599900.00, 'PURCHASE', 'COMPLETED', 'Samsung 990 Pro SSD bulk',                       '2026-03-16 09:00:00', 12, 25, 2),
    (14,  30, 199500.00,  'PURCHASE', 'COMPLETED', 'Anker 737 power banks',                          '2026-03-18 11:00:00', 12, 30, 5),
    (15,  25, 1497500.00, 'PURCHASE', 'COMPLETED', 'AirPods Max stock',                              '2026-03-20 09:00:00', 12, 23, 4),
    (16,  12, 2159880.00, 'PURCHASE', 'COMPLETED', 'ASUS ROG Zephyrus G16',                          '2026-03-22 10:00:00', 12, 4,  1),
    (17,  35, 899965.00,  'PURCHASE', 'COMPLETED', 'Google Pixel 10 Pro batch',                      '2026-03-25 09:00:00', 12, 8,  3),
    (18,  30, 1049700.00, 'PURCHASE', 'COMPLETED', 'iPad Pro M4 restock',                            '2026-03-28 10:00:00', 12, 11, 3),
    (19,  20, 1699980.00, 'PURCHASE', 'COMPLETED', 'Galaxy Tab S10 Ultra',                           '2026-03-28 11:00:00', 12, 12, 3),
    (20,  45, 1799550.00, 'PURCHASE', 'COMPLETED', 'Nothing Phone 3 batch',                          '2026-03-30 09:00:00', 12, 10, 3),

    -- March 2026 — Sales
    (21,   3, 599997.00,  'SALE', 'COMPLETED', 'MacBook Pro sold — enterprise client',            '2026-03-08 15:00:00', 13, 1,  null),
    (22,   8, 879992.00,  'SALE', 'COMPLETED', 'iPhone 16 Pro online orders',                     '2026-03-10 16:00:00', 13, 6,  null),
    (23,   5, 549995.00,  'SALE', 'COMPLETED', 'Galaxy S25 Ultra sales',                          '2026-03-12 14:00:00', 13, 7,  null),
    (24,   2, 305998.00,  'SALE', 'COMPLETED', 'Dell XPS 15 sold — freelance studio',             '2026-03-14 11:00:00', 13, 2,  null),
    (25,  10, 169990.00,  'SALE', 'COMPLETED', 'Keychron Q1 Max — office bulk',                   '2026-03-16 12:00:00', 13, 17, null),
    (26,  15, 134985.00,  'SALE', 'COMPLETED', 'MX Master 3S — coworking space order',            '2026-03-17 10:00:00', 13, 20, null),
    (27,   5, 149950.00,  'SALE', 'COMPLETED', 'Sony XM6 sales',                                  '2026-03-18 15:00:00', 13, 22, null),
    (28,  10, 649990.00,  'SALE', 'COMPLETED', 'OnePlus 13 online sales',                         '2026-03-20 14:00:00', 13, 9,  null),
    (29,   3, 599970.00,  'SALE', 'COMPLETED', 'iPad Pro M4 — design agency',                     '2026-03-22 11:30:00', 13, 11, null),
    (30,   5, 128990.00,  'SALE', 'COMPLETED', 'Samsung 990 Pro SSD sales',                       '2026-03-25 10:00:00', 13, 25, null),
    (31,   4, 179996.00,  'SALE', 'COMPLETED', 'HP Spectre x360 sales',                           '2026-03-26 14:00:00', 13, 5,  null),
    (32,   2, 199980.00,  'SALE', 'COMPLETED', 'LG 5K monitor — creative studio',                 '2026-03-27 09:30:00', 13, 14, null),
    (33,  20, 799980.00,  'SALE', 'COMPLETED', 'Nothing Phone 3 flash sale',                      '2026-03-28 16:00:00', 13, 10, null),
    (34,   7, 629993.00,  'SALE', 'COMPLETED', 'Galaxy S25 Ultra weekend sales',                  '2026-03-30 15:00:00', 13, 7,  null),
    (35,   3, 449970.00,  'SALE', 'COMPLETED', 'Galaxy Tab S10 Ultra',                            '2026-03-31 11:00:00', 13, 12, null),

    -- April 2026 — Purchases (restocking)
    (36,   5, 999995.00,  'PURCHASE', 'COMPLETED', 'MacBook Pro restock',                           '2026-04-02 09:00:00', 12, 1,  1),
    (37,  20, 699800.00,  'PURCHASE', 'COMPLETED', 'iPad Air M3 batch',                             '2026-04-02 10:00:00', 12, 13, 6),
    (38,   8, 1140000.00, 'PURCHASE', 'COMPLETED', 'ThinkPad X1 Carbon restock',                    '2026-04-05 09:30:00', 12, 3,  1),
    (39,  35, 2499650.00, 'PURCHASE', 'COMPLETED', 'iPhone 16 Pro restock',                         '2026-04-05 11:00:00', 12, 6,  1),
    (40,   8, 799920.00,  'PURCHASE', 'COMPLETED', 'Samsung Odyssey G9 monitors',                   '2026-04-08 09:00:00', 12, 15, 2),
    (41,  30, 239970.00,  'PURCHASE', 'COMPLETED', 'Anker power bank restock',                      '2026-04-08 10:30:00', 12, 30, 5),
    (42,  25, 874975.00,  'PURCHASE', 'COMPLETED', 'Bose QC Ultra headphones',                      '2026-04-10 09:00:00', 12, 24, 4),
    (43,  45, 1484955.00, 'PURCHASE', 'COMPLETED', 'WD Black SN850X SSD batch',                     '2026-04-12 10:00:00', 12, 26, 7),
    (44,  10, 249990.00,  'PURCHASE', 'COMPLETED', 'TP-Link AXE300 routers',                        '2026-04-14 09:00:00', 12, 28, 5),
    (45,  25, 699750.00,  'PURCHASE', 'COMPLETED', 'iPad Pro M4 April restock',                      '2026-04-15 10:00:00', 12, 11, 3),
    (46,  15, 524985.00,  'PURCHASE', 'COMPLETED', 'Corsair K100 RGB keyboards',                    '2026-04-18 09:30:00', 12, 19, 4),
    (47,  30, 989970.00,  'PURCHASE', 'COMPLETED', 'Seagate IronWolf NAS drives',                   '2026-04-20 10:00:00', 12, 27, 7),

    -- April 2026 — Sales
    (48,   4, 799996.00,  'SALE', 'COMPLETED', 'MacBook Pro — startup bulk',                      '2026-04-03 14:00:00', 13, 1,  null),
    (49,  12, 1079988.00, 'SALE', 'COMPLETED', 'iPhone 16 Pro — corporate order',                 '2026-04-05 16:00:00', 13, 6,  null),
    (50,   6, 389994.00,  'SALE', 'COMPLETED', 'Galaxy S25 Ultra sales',                          '2026-04-07 11:00:00', 13, 7,  null),
    (51,   8, 559992.00,  'SALE', 'COMPLETED', 'Dell XPS 15 — dev team',                          '2026-04-08 15:00:00', 13, 2,  null),
    (52,  10, 179990.00,  'SALE', 'COMPLETED', 'Logitech MX Keys S office order',                 '2026-04-10 12:00:00', 13, 18, null),
    (53,  20, 1799800.00, 'SALE', 'COMPLETED', 'OnePlus 13 — retail partner',                     '2026-04-12 14:00:00', 13, 9,  null),
    (54,   5, 164995.00,  'SALE', 'COMPLETED', 'AirPods Max sales',                               '2026-04-14 10:00:00', 13, 23, null),
    (55,  15, 524985.00,  'SALE', 'COMPLETED', 'iPad Air M3 — school district',                   '2026-04-15 11:30:00', 13, 13, null),
    (56,   3, 224997.00,  'SALE', 'COMPLETED', 'Bose QC Ultra sales',                             '2026-04-17 14:00:00', 13, 24, null),
    (57,   5, 714950.00,  'SALE', 'COMPLETED', 'ROG Zephyrus — gaming cafe',                      '2026-04-18 15:00:00', 13, 4,  null),
    (58,  25, 199975.00,  'SALE', 'COMPLETED', 'Anker power banks — event giveaway',              '2026-04-20 12:00:00', 13, 30, null),
    (59,   4, 131996.00,  'SALE', 'COMPLETED', 'Dell UltraSharp — design firm',                   '2026-04-22 10:00:00', 13, 16, null),
    (60,  10, 109999.00,  'SALE', 'COMPLETED', 'Nothing Phone 3 sales',                           '2026-04-24 14:00:00', 13, 10, null),
    (61,  30, 479970.00,  'SALE', 'COMPLETED', 'Samsung 990 Pro SSD — PC builder order',          '2026-04-25 11:00:00', 13, 25, null),
    (62,  15, 449985.00,  'SALE', 'COMPLETED', 'Razer DeathAdder V3 Pro — esports org',           '2026-04-27 10:00:00', 13, 21, null),
    (63,   2, 65998.00,   'SALE', 'COMPLETED', 'Samsung Odyssey G9 — video studio',               '2026-04-28 14:00:00', 13, 15, null),
    (64,   8, 215992.00,  'SALE', 'COMPLETED', 'Belkin TB4 Dock — IT dept',                       '2026-04-29 09:00:00', 13, 31, null),
    (65,   5, 89995.00,   'SALE', 'COMPLETED', 'Google Pixel 10 Pro sales',                       '2026-04-30 11:00:00', 13, 8,  null),

    -- Returns to supplier
    (66,  2, 285000.00,   'RETURN_TO_SUPPLIER', 'COMPLETED', 'ThinkPad X1 — 2 units DOA, bad display',  '2026-03-15 09:00:00', 12, 3,  1),
    (67,  3, 239997.00,   'RETURN_TO_SUPPLIER', 'COMPLETED', 'Galaxy S25 Ultra — 3 units screen defect', '2026-03-22 10:00:00', 12, 7,  3),
    (68,  5, 49995.00,    'RETURN_TO_SUPPLIER', 'COMPLETED', 'Keychron — 5 units switch malfunction',   '2026-04-05 09:30:00', 12, 17, 4),
    (69,  2, 51998.00,    'RETURN_TO_SUPPLIER', 'COMPLETED', 'Samsung Odyssey G9 — 2 dead pixels',     '2026-04-15 10:00:00', 12, 15, 2),
    (70,  4, 31996.00,    'RETURN_TO_SUPPLIER', 'COMPLETED', 'Nothing Phone 3 — 4 units battery issue', '2026-04-22 11:00:00', 12, 10, 3),

    -- Pending / processing transactions
    (71,  10, 1199990.00, 'SALE',      'PENDING',   'MacBook Pro — pending enterprise PO',   '2026-04-28 09:00:00', 13, 1,  null),
    (72,  20, 2199980.00, 'PURCHASE',  'PROCESSING','iPhone 16 Pro — in transit',            '2026-04-29 09:00:00', 12, 6,  1),
    (73,   5, 509995.00,  'SALE',      'PENDING',   'iPad Pro M5 — pre-order deposit',       '2026-04-30 10:00:00', 13, 11, null),
    (74,   8, 159992.00,  'SALE',      'PROCESSING','Logitech MX Keys S — fulfillment',     '2026-04-30 14:00:00', 13, 18, null);

-- ===================== STOCK ALERTS ========================
INSERT INTO stock_alerts (id, product_id, status, threshold, stock_quantity_at_alert, resolved, resolved_at, created_at, updated_at) VALUES
    (1,  4,  'WATCH',    20, 12, false, null, '2026-04-20 09:00:00', '2026-04-20 09:00:00'),
    (2,  8,  'LOW',      10, 8,  false, null, '2026-04-25 10:00:00', '2026-04-25 10:00:00'),
    (3,  15, 'CRITICAL',  5, 3,  false, null, '2026-04-28 11:00:00', '2026-04-28 11:00:00'),
    (4,  31, 'LOW',      10, 7,  false, null, '2026-04-29 09:30:00', '2026-04-29 09:30:00'),
    (5,  29, 'WATCH',    20, 14, false, null, '2026-04-28 14:00:00', '2026-04-28 14:00:00'),
    (6,  27, 'LOW',      10, 9,  false, null, '2026-04-30 10:00:00', '2026-04-30 10:00:00'),
    -- Resolved alerts
    (7,  3,  'LOW',      10, 6,  true, '2026-04-05 10:00:00', '2026-03-20 09:00:00', '2026-04-05 10:00:00'),
    (8,  17, 'CRITICAL',  5, 3,  true, '2026-04-10 11:00:00', '2026-03-25 14:00:00', '2026-04-10 11:00:00'),
    (9,  25, 'WATCH',    20, 15, true, '2026-04-12 09:00:00', '2026-04-01 10:00:00', '2026-04-12 09:00:00');

COMMIT;
