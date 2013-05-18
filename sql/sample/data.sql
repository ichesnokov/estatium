SET foreign_key_checks = 0;

-- Roles
DELETE FROM role;
INSERT INTO role VALUES (1, 'Admin');
INSERT INTO role VALUES (2, 'Manager');
INSERT INTO role VALUES (3, 'User');

-- Users
-- Password: 'password'
DELETE FROM user;
INSERT INTO user VALUES (1, 'admin@example.com',   '212cb08fa2e7ee673020962d175685e2ea1c9f3e', 1, 'Crazy',  'Admin', NULL);
INSERT INTO user VALUES (2, 'manager@example.com', '212cb08fa2e7ee673020962d175685e2ea1c9f3e', 2, 'Cool',   'Manager', NULL);
INSERT INTO user VALUES (3, 'user@example.com',    '212cb08fa2e7ee673020962d175685e2ea1c9f3e', 3, 'Simple', 'User', NULL);

-- Estates
DELETE FROM estate;
INSERT INTO estate VALUES (1, 'Маленькая комната', 10.00, 5000.00, 500.00, 'Москва, Варшавское шоссе, д. 28А', NULL, NULL, 'Нагатинская', '+7 915 123456789', '');
INSERT INTO estate VALUES (2, 'Средняя комната', 20.00, 6000.00, 600.00, 'Москва, ул. Василия Петушкова, д. 3', NULL, NULL, 'Тушинская', '+7 926 987654321', '');
INSERT INTO estate VALUES (3, 'Большая комната', 30.00, 10000.00, 1000.00, 'Москва, Красная площадь, д. 1', NULL, NULL, 'Тушинская', '+7 926 987654321', '');

