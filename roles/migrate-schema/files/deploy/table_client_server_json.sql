-- Deploy migrate-schema:table_client_server_json to pg
-- requires: app_schema
begin;

drop table if exists app.client_server_json_template cascade;
drop table if exists app.client_server_json cascade;

create table app.client_server_json ( client_addr_in text not null default inet_client_addr()::text
    , server_addr_in text not null default inet_server_addr()::text
    , time_in timestamp without time zone default now()
    , md5_random_in text not null default md5(random()::text)
    , json_object json not null default '{}'::json
    , primary key (client_addr_in, server_addr_in, time_in, md5_random_in) )
partition by range (time_in);

create table app.client_server_json_template (like app.client_server_json);

alter table app.client_server_json_template add primary key (client_addr_in
    , server_addr_in, time_in, md5_random_in);

select ext_pg_partman.create_parent('app.client_server_json', 'time_in', 'native', 'daily'
    , p_template_table := 'app.client_server_json_template');

commit;
