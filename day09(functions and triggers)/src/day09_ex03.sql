-- create or replace function fnc_trg_person_audit() returns trigger as
-- $$
-- begin
--     IF (TG_OP = 'DELETE') THEN
--         insert into person_audit(created, type_event, row_id, name, age, gender, address)
--         select now(), 'D', old.*;
--     ELSIF (TG_OP = 'UPDATE') THEN
--         insert into person_audit(created, type_event, row_id, name, age, gender, address)
--         select now(), 'U', old.*;
--     ELSIF (TG_OP = 'INSERT') THEN
--         insert into person_audit(row_id, name, age, gender, address)
--         values (new.id, new.name, new.age, new.gender, new.address);
--     END IF;
--     return null;
-- end;
-- $$
-- language plpgsql;
--
-- create trigger trg_person_audit
--     AFTER INSERT OR UPDATE OR DELETE on person
--     for each row
--     execute function fnc_trg_person_audit();
--
-- drop trigger if exists trg_person_delete_audit on person;
-- drop trigger if exists trg_person_update_audit on person;
-- drop trigger if exists trg_person_insert_audit on person;
-- drop function fnc_trg_person_delete_audit;
-- drop function fnc_trg_person_update_audit;
-- drop function fnc_trg_person_insert_audit;
-- truncate person_audit;
--
-- INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
-- UPDATE person SET name = 'Bulat' WHERE id = 10;
-- UPDATE person SET name = 'Damir' WHERE id = 10;
-- DELETE FROM person WHERE id = 10;

drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;
drop function fnc_trg_person_insert_audit;
drop function fnc_trg_person_update_audit;
drop function fnc_trg_person_delete_audit;
create
or replace function fnc_trg_person_audit()
returns trigger as $trg_person_delete_audit$
begin
if (tg_op = 'INSERT') then
insert into
    person_audit
values(
    default,
    'I',
    new.*);
end if;
if (tg_op = 'UPDATE') then
insert into
    person_audit
values(
    default,
    'U',
    new.*);
end if;
if (tg_op = 'DELETE') then
insert into
    person_audit
values(
    default,
    'D',
    old.*);
end if;
return new;
end;
$trg_person_delete_audit$ language plpgsql;
create trigger trg_person_delete_audit after insert or update or delete on person
for each row execute function fnc_trg_person_audit();
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;