CREATE OR REPLACE FUNCTION fnc_trg_person_update_audit() RETURNS TRIGGER AS $$
    begin
        insert into person_audit values (OLD.*, CURRENT_TIMESTAMP, 'U');
    return old;
    end;
$$ language plpgsql;

create trigger trg_person_update_audit
after update
on person
for each row
execute function fnc_trg_person_update_audit();

UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;