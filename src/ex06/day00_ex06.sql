select
    (select name
     from person
     where id = person_order.person_id) as name,
    case
        when (select name from person where id = person_order.person_id) = 'Denis' then 'true'
        else 'false'
    end as check_name
from person_order
where (menu_id = 13 or menu_id = 14 or menu_id = 18)
and order_date = '2022-01-07';

-- second solution

with o_name as (
    select
        (select name
        from person
        where id = person_order.person_id) as name
    from person_order
    where (menu_id = 13 or menu_id = 14 or menu_id = 18)
    and order_date = '2022-01-07')
select *,
    case
        when name = 'Denis' then 'true'
        else 'false'
    end as check_name
from o_name;
