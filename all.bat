@echo off
set PGPASSWORD=12345

psql -U postgres -d savings_found -f ./tables/tables.sql

SET PGCLIENTENCODING=utf8

REM CONSTRAINTS
psql -U postgres -d savings_found -f ./constraints/pk.sql
psql -U postgres -d savings_found -f ./constraints/uk.sql
psql -U postgres -d savings_found -f ./constraints/fk.sql
psql -U postgres -d savings_found -f ./constraints/ck.sql


REM DATA
psql -U postgres -d savings_found -f ./data/businesses.sql
psql -U postgres -d savings_found -f ./data/charges.sql
psql -U postgres -d savings_found -f ./data/document_type.sql
psql -U postgres -d savings_found -f ./data/employees.sql
psql -U postgres -d savings_found -f ./data/contributions.sql
psql -U postgres -d savings_found -f ./data/loans.sql
psql -U postgres -d savings_found -f ./data/loan_installments.sql
psql -U postgres -d savings_found -f ./data/loan_purchases.sql
psql -U postgres -d savings_found -f ./data/parameters.sql
psql -U postgres -d savings_found -f ./data/payments.sql
psql -U postgres -d savings_found -f ./data/payments_details.sql


REM actualiza las secuencias
psql -U postgres -d savings_found -f ./update_sequences.sql

REM TRIGGERS


REM FUNCIONES


