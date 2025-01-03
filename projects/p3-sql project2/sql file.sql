create database tab;
use tab;


select * from users;
select * from events;
select * from email_events;

select
    DATE_FORMAT(created_at, '%Y-%u-01') AS week_start_date,
    COUNT(distinct user_id) AS active_users_count
from users
group by DATE_FORMAT(created_at, '%Y-%u-01')
order by week_start_date;


select
    date_format(STR_TO_DATE(created_at, '%d-%m-%Y %H:%i'), '%Y-%u-01') AS week_start_date,
    count(DISTINCT user_id) AS active_users
from
    users
group by
    week_start_date
order by
    week_start_date;





SELECT created_at
FROM users
LIMIT 10;

SELECT 
    STR_TO_DATE(created_at, '%Y/%m/%d') AS converted_date
FROM users
LIMIT 10;



select
    date_format(str_to_date(created_at, '%d-%m-%Y %H:%i'), '%Y-%m-01') as month_start_date,
    count(distinct user_id) as totalusers
from
    users
group by
    month_start_date
order by
    month_start_date;
    
    
    
    
    
    
with user_signups as (
    select
        user_id,
        date_format(str_to_date(created_at, '%d-%m-%Y %H:%i'), '%Y-%u-01') as signup_week
    from
        users
),
user_activity as (
    select
        user_id,
        date_format(str_to_date(occurred_at, '%d-%m-%Y %H:%i'), '%Y-%u-01') as activity_week
    from
        events
)
select
    us.signup_week as cohort_week,
    ua.activity_week as retention_week,
    count(distinct ua.user_id) as retained_users
from
    user_signups us
left join
    user_activity ua on us.user_id = ua.user_id and ua.activity_week >= us.signup_week
group by
    us.signup_week, ua.activity_week
having
    ua.activity_week is not null
order by
    us.signup_week, ua.activity_week;



select
    date_format(str_to_date(e.occurred_at, '%d-%m-%Y %H:%i'), '%Y-%u-01') as week_start_date,
    e.device,
    count(distinct e.user_id) as active_users
from
    events e
group by
    week_start_date, e.device
order by
    week_start_date, e.device;

select
    action,
    count(distinct user_id) as unique_users_count,
    count(*) as total_actions_count
from
    email_events
group by
    action
order by
    action;
