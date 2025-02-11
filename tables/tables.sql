-- Tabla que almacena la información de los empleados

CREATE TABLE document_type
(
    document_type_id SERIAL PRIMARY KEY,
    name             VARCHAR(100) NOT NULL
);

CREATE TABLE employees
(
    employee_id          SERIAL PRIMARY KEY,
    name                 VARCHAR(100)   NOT NULL,
    document_number      VARCHAR(100)   NOT NULL UNIQUE,
    document_type_id     INT            NOT NULL REFERENCES document_type (document_type_id),
    phone                VARCHAR(20)    NOT NULL,
    address              VARCHAR(255)   NOT NULL,
    email                VARCHAR(255)   NOT NULL,
    monthly_contribution NUMERIC(10, 2) NOT NULL,
    hire_date            TIMESTAMP      NOT NULL,
    created_by           VARCHAR(255),
    updated_by           VARCHAR(255),
    created_date         TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date          TIMESTAMP
);


-- Tabla que registra los aportes mensuales de los empleados al fondo de ahorro
CREATE TABLE contributions
(
    contribution_id   SERIAL PRIMARY KEY,
    employee_id       INT            NOT NULL,
    contribution_date DATE           NOT NULL,
    savings_amount    NUMERIC(10, 2) NOT NULL,
    created_by        VARCHAR(255),
    created_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);


-- Tabla que almacena los negocios asociados donde los empleados pueden realizar compras
CREATE TABLE businesses
(
    business_id  SERIAL PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    address      VARCHAR(255) NOT NULL,
    status       BOOLEAN   DEFAULT TRUE,
    created_by   VARCHAR(255),
    updated_by   VARCHAR(255),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_date  TIMESTAMP
);

-- Tabla que almacena los tipos de prestamos
CREATE TABLE loan_types
(
    loan_type_id     SERIAL PRIMARY KEY,
    name             VARCHAR(20),
    monthly_interest NUMERIC(5, 2) DEFAULT 1.00, -- 1% de interés mensual
    term_months      INT CHECK (term_months BETWEEN 1 AND 60),
    created_by       VARCHAR(255),
    updated_by       VARCHAR(255),
    created_date     TIMESTAMP     DEFAULT CURRENT_TIMESTAMP,
    update_date      TIMESTAMP
);

-- Tabla que almacena los préstamos otorgados a los empleados
CREATE TABLE loans
(
    loan_id      SERIAL PRIMARY KEY,
    employee_id  INT            NOT NULL,
    granted_date DATE           NOT NULL,
    loan_amount  NUMERIC(10, 2) NOT NULL,
    term_months  INT CHECK (term_months BETWEEN 1 AND 60),
    status       VARCHAR(10) CHECK (status IN ('ACTIVE', 'PAID')) DEFAULT 'ACTIVE',
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);

-- Tabla que almacena la cuotas de los prestamos
CREATE TABLE loan_installments
(
    loan_installment   SERIAL PRIMARY KEY,
    loan_id            INT REFERENCES loans (loan_id),
    number_installment INT NOT NULL,
    date_payment       TIMESTAMP,
    amount             NUMERIC(10, 2),
    status             VARCHAR(10) CHECK (status IN ('ACTIVE', 'PAID')) DEFAULT 'ACTIVE'
);

-- Tabla que registra las compras realizadas por los empleados en los negocios asociados
CREATE TABLE loan_purchases
(
    purchase_id   SERIAL PRIMARY KEY,
    loan_id       INT REFERENCES loans (loan_id),
    business_id   INT  NOT NULL,
    purchase_date DATE NOT NULL,
    FOREIGN KEY (business_id) REFERENCES businesses (business_id) ON DELETE CASCADE
);

-- Tabla que registra los pagos realizados por los empleados (aportes, compras y préstamos)
CREATE TABLE payments
(
    payment_id   SERIAL PRIMARY KEY,
    employee_id  INT                                                              NOT NULL,
    payment_date DATE                                                             NOT NULL,
    amount_paid  NUMERIC(10, 2)                                                   NOT NULL,
    type         VARCHAR(12) CHECK (type IN ('contribution', 'purchase', 'loan')) NOT NULL,
    reference_id INT                                                              NOT NULL, -- Puede referirse a una compra o un préstamo
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);

