-- Verify migrate-schema:partman_schema on pg
do $$
begin
    assert (select has_schema_privilege('partman', 'usage'));
end $$;
