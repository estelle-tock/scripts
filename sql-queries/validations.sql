-- pull all reservations for a given date
select * from visit where business_id=10654 and service_date='2020-04-11';

-- checking reservation count
select * from business where id=15811;
select count(*) from visit where business_id=15811;

-- find all visits to businessId for a given guest
select * from patron where email='katy@thedooronline.com'; -- patronId=926667
select * from visit where patron_id=926667 AND business_id=8345;

-- cabra duplicate resos (chunk reprocessed at this time, 851 were in that chunk)
select * from visit where updated_at > '2020-06-11 06:20:00' AND business_id=8345 order by updated_at ASC LIMIT 851;

-- cabra duplicate guests (chunk reprocessed at this time, 1000 guests were in that chunk)
select * from patron where created_at >'2020-06-11 06:20:00' AND created_by_business=8345 order by created_at ASC LIMIT 1000;

-- find a guest
select * from guest_profile where nick_name='Eric Reinhorn' AND business_group_id=3327; -- buisness_group_ids=3327,3326
