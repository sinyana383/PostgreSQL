create table if not exists person_audit
(
    created timestamp with time zone default current_timestamp not null,
    type_event char(1) default 'I'
        constraint ch_type_event check (type_event in ('I','D','U') ),
    row_id bigint not null, -- нужен ли primary key?
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null ,
    address varchar
);

create or replace function fnc_trg_person_insert_audit() returns trigger as
$$
begin
    insert into person_audit(row_id, name, age, gender, address)
    values (new.id, new.name, new.age, new.gender, new.address);
    return new;
end;
$$
language plpgsql;

create trigger trg_person_insert_audit
    after insert on person
    for each row
    execute function fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');