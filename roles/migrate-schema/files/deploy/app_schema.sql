-- deploy migrate-schema:app_schema to pg
begin;
    create schema app;
commit;
