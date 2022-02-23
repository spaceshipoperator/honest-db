-- revert migrate-schema:app_schema from pg
begin;
    drop schema app;
commit;
