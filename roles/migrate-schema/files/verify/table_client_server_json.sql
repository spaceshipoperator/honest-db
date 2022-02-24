-- Verify migrate-schema:table_client_server_json on pg
begin;

select client_addr_in, server_addr_in, time_in, md5_random_in
from app.client_server_json where false;

select client_addr_in, server_addr_in, time_in, md5_random_in
from app.client_server_json_template where false;

rollback;
