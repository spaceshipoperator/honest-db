-- Verify migrate-schema:app_schema on pg
do $$
begin
    assert (select has_schema_privilege('app', 'usage'));
end $$;
