create table person_audit (
    created timestamp with time zone not null default current_timestamp,
    type_event char(1) not null default 'I'
) inherits (person);

alter table person_audit add constraint ch_type_event check ( type_event in ('I','U','D') );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $$
    begin
        insert into person_audit values (NEW.*, CURRENT_TIMESTAMP, 'I');
    return new;
    end;
$$ language plpgsql;

create trigger trg_person_insert_audit
after insert
on person
for each row
execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');