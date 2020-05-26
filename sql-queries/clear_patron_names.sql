-- to get business group id
select * from business where id=3460;

select * from business where id=3506;

 
-- to get the date for filter
select * from patron join guest_profile on patron.id = guest_profile.patron_id where business_group_id=3139 AND created_by_business=3460; 

 

-- clearing out flipped patrons in db
UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3460 AND created_at > '2020-05-04';

UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3506 AND created_at > '2020-05-04';