-- Revert migrate-schema:partman_schema from pg
begin;
    drop schema partman cascade;
commit;
