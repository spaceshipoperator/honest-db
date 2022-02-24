-- Revert migrate-schema:table_client_server_json from pg

begin;

drop table if exists app.client_server_json_template cascade;
drop table if exists app.client_server_json cascade;

commit;
