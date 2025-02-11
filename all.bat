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



REM actualiza las secuencias
psql -U postgres -d savings_found -f ./update_sequences.sql

REM TRIGGERS


REM FUNCIONES


