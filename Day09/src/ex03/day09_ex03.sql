DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;
DROP FUNCTION fnc_trg_person_insert_audit;
DROP FUNCTION fnc_trg_person_update_audit;
DROP FUNCTION fnc_trg_person_delete_audit;
TRUNCATE TABLE person_audit;

CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $$
    begin
        if tg_op = 'insert' then
            insert into person_audit values (NEW.*, CURRENT_TIMESTAMP, 'I');
            return new;
        elsif tg_op = 'update' then
            insert into person_audit values (OLD.*, CURRENT_TIMESTAMP, 'U');
            return old;
        elsif tg_op = 'delete' then
            insert into person_audit values (OLD.*, CURRENT_TIMESTAMP, 'D');
            return old;
    end;
$$ language plpgsql;

create trigger trg_person_audit
after delete or update or insert
on person
for each row
execute function fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;