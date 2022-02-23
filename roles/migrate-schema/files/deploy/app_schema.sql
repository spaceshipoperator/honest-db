-- deploy migrate-schema:app_schema to pg
begin;
    create schema if not exists app;
commit;
