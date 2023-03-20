CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $$
    begin
            insert into person_audit values (OLD.*, CURRENT_TIMESTAMP, 'D');
    return old;
    end;
$$ language plpgsql;

create trigger trg_person_delete_audit
after delete
on person
for each row
execute function fnc_trg_person_delete_audit();

DELETE FROM person WHERE id = 10;