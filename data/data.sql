-- 1️⃣ Tipos de Documentos
INSERT INTO document_type (name)
VALUES ('Cédula de Ciudadanía'),
       ('Cédula de Extranjería'),
       ('Pasaporte');

-- 2️⃣ Empleados
-- 1️⃣ Tipos de Documentos (ya insertados antes)
-- No se repiten para evitar errores

-- 2️⃣ Empleados
INSERT INTO employees (name, document_number, document_type_id, phone, address, email, hire_date, created_by,
                       monthly_contribution)
VALUES ('Carlos Pérez', '123456789', 1, '3001234567', 'Calle 123 #45-67', 'carlos.perez@example.com', '2023-05-01',
        'admin', 15000.00),
       ('María Gómez', '987654321', 2, '3019876543', 'Carrera 10 #20-30', 'maria.gomez@example.com', '2022-10-15',
        'admin', 20000.00),
       ('Juan Rodríguez', '111223344', 1, '3105556677', 'Diagonal 45 #67-89', 'juan.rodriguez@example.com',
        '2021-08-25', 'admin', 50000.00),
       ('Laura Martínez', '222334455', 1, '3128889999', 'Calle 50 #10-20', 'laura.martinez@example.com', '2020-12-10',
        'admin',0),
       ('Pedro Ramírez', '333445566', 2, '3157778888', 'Carrera 80 #5-15', 'pedro.ramirez@example.com', '2019-07-01',
        'admin',0);

-- 6️⃣ Aportes Mensuales
INSERT INTO contributions (employee_id, contribution_date, savings_amount, created_by)
VALUES (1, '2024-02-01', 200.00, 'admin'),
       (2, '2024-02-01', 150.00, 'admin'),
       (3, '2024-02-01', 250.00, 'admin'),
       (4, '2024-02-01', 300.00, 'admin'),
       (5, '2024-02-01', 180.00, 'admin');

-- 3️⃣ Negocios Asociados
INSERT INTO businesses (name, address, created_by)
VALUES ('Tienda Electrodomésticos', 'Avenida Principal #34-56', 'admin'),
       ('Supermercado Ahorro', 'Calle 8 #12-34', 'admin');

-- 4️⃣ Tipos de Préstamos
INSERT INTO charges (name, monthly_interest, term_months, created_by, type_charge)
VALUES ('CONTRIBUCION', 0, 0, 'admin', 'DEFECTO'),
       ('ORDINARIO', 1.00, 60, 'admin', 'PRESTAMO'),
       ('EXTRA ORDINARIO', 1.00, 4, 'admin', 'PRESTAMO'),
       ('RECREATIVO', 1.00, 12, 'admin', 'PRESTAMO'),
       ('COMPRA', 0, 3, 'admin', 'PRESTAMO');

-- 5️⃣ Préstamos Otorgados
INSERT INTO loans (loan_type_id, employee_id, granted_date, loan_amount, term_months, status)
VALUES (4, 1, '2024-01-01', 5000.00, 3, 'ACTIVO'),
       (4, 2, '2023-12-15', 3000.00, 3, 'ACTIVO'),
       (1, 3, '2023-12-15', 400000.00, 12, 'ACTIVO');

-- 7️⃣ Compras Realizadas
INSERT INTO loan_purchases (loan_id, business_id, purchase_date)
VALUES (1, 1, '2024-02-05'),
       (2, 2, '2024-02-07');

-- 8️⃣ Cuotas de Préstamos
INSERT INTO loan_installments (loan_id, number_installment, date_payment, amount, status)
VALUES (1, 1, '2024-02-01', 1667.00, 'ACTIVO'),
       (1, 2, '2024-03-01', 1667.00, 'ACTIVO'),
       (1, 3, '2024-03-01', 1667.00, 'ACTIVO'),
       (2, 1, '2024-02-01', 1000.00, 'ACTIVO'),
       (2, 2, '2024-03-01', 1000.00, 'ACTIVO'),
       (2, 3, '2024-03-01', 1000.00, 'ACTIVO'),
       (3, 1, '2024-02-01', 33666.00, 'ACTIVO'),
       (3, 2, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 3, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 4, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 5, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 6, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 7, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 8, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 9, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 10, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 11, '2024-03-01', 33666.00, 'ACTIVO'),
       (3, 12, '2024-03-01', 33666.00, 'ACTIVO');

-- 9️⃣ Pagos Realizados
INSERT INTO payments (employee_id, payment_date, amount_paid)
VALUES (1, '2024-02-01', 16667.00),
       (2, '2024-02-01', 21000.00),
       (3, '2024-02-01', 50000.00);

-- 🔟 Detalle de Pagos
INSERT INTO payments_details (payment_id, charge_id, amount_paid, number_installment)
VALUES (1, 1, 15000.00, 0),
       (1, 5, 1667.00, 1),
       (2, 1, 20000.00, 0),
       (2, 5, 1000.00, 1),
       (3, 1, 50000.00, 0),
       (3, 3, 33666.00, 1)
;

-- 🔟 Parámetros Generales del Fondo
INSERT INTO parameters (start_date, end_date)
VALUES (28, 5);


