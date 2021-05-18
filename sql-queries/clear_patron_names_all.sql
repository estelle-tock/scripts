-- created by business (all demo ids)
-- 3462
-- 3463
-- 3529
-- 3582

select * from business where id=3462; -- business group id: 3084
select * from business where id=3463; -- business group id: 3085
select * from business where id=3529; -- business group id: 3146
select * from business where id=3582; -- business group id: 3188

select * from patron join guest_profile on patron.id = guest_profile.patron_id where business_group_id=3084 AND created_by_business=3462; -- 2020-05-04 18:49:39
select * from patron join guest_profile on patron.id = guest_profile.patron_id where business_group_id=3085 AND created_by_business=3463; -- 2020-05-13 18:40:18
select * from patron join guest_profile on patron.id = guest_profile.patron_id where business_group_id=3146 AND created_by_business=3529; -- 2020-05-19 02:14:53
select * from patron join guest_profile on patron.id = guest_profile.patron_id where business_group_id=3188 AND created_by_business=3582; -- 2020-05-27 13:03:36

UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3462 AND created_at > '2020-05-04';
UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3463 AND created_at > '2020-05-13';
UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3529 AND created_at > '2020-05-19';
UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3582 AND created_at > '2020-05-27';