-- Deploy migrate-schema:partman_schema to pg

begin;
    create schema if not exists partman;

    create extension if not exists pg_partman schema partman;
commit;
