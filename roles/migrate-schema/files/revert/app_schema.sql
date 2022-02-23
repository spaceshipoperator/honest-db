-- revert migrate-schema:app_schema from pg
begin;
    drop schema if exists app cascade;
commit;
