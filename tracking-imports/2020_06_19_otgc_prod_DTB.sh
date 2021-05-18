./run_importer.sh -e prod -b 11120 -g ../../dtb_prod_2.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:1}"


select * from business where id=11120;
select * from business where business_group_id=8200;

-- guests that were created on second run OTGC w/ reservations on friday (DTB)  14439
select * from guest_profile where guest_profile.business_group_id=8200 and guest_profile.created_at > '2020-06-19 17:05:56' and guest_profile.created_at < '2020-06-19 17:09:39';

-- guests that were created w/ OTGC - guests only (DTB) 14,433
select * from guest_profile where guest_profile.business_group_id=8200 and guest_profile.created_at > '2020-06-19 16:46:24' and guest_profile.created_at < '2020-06-19 17:05:56' and guest_profile.updated_at < '2020-06-19 17:05:56';

-- guests that were created w/ guests only that were updated after import (DTB) 1251
select * from guest_profile where guest_profile.business_group_id=8200 and guest_profile.created_at > '2020-06-19 16:46:24' and guest_profile.created_at < '2020-06-19 17:05:56' and guest_profile.updated_at>'2020-06-19 17:05:56';

-- guests that were created w/ guests only that were NOT updated after import (DTB)
select * from guest_profile where guest_profile.business_group_id=8200 and guest_profile.created_at > '2020-06-19 16:46:24' and guest_profile.created_at < '2020-06-19 17:05:56' and guest_profile.updated_at < '2020-06-19 17:05:56';

-- guests that were created w/ guests only  that don't have a visit, email, created on friday during import & was not updated over the weekend. (DTB) 14431
select * from guest_profile 
left outer join purchase on guest_profile.patron_id = purchase.original_patron_id 
where guest_profile.business_group_id=8200 
  and guest_profile.email is null
  and guest_profile.created_at > '2020-06-19 16:46:24' 
  and guest_profile.created_at < '2020-06-19 17:05:56' 
  and guest_profile.updated_at < '2020-06-19 17:05:56'
  and purchase.id is null;

-- 17,413 guests were incorrectly imported w/ no historical reservations
-- 14,434 of those guests were not updated after the import
-- 2,979 of those guests were updated after the import (over the weekend)
-- 14,439 guests were re-imported w/ historical reseration information
-- 14,431 guests that were created w/ no historical reservations were not updated again & have no reservations associated with them - are safe to be archived


-- 2,979 guests that were created w/ no historical reservations were updated over the weekend
-- 2,756 were updated over the weekend w/ reservations. -- will not be archived & have duplicate guests information (one w/ historical & one with reservations from over the weekend)
-- 223 were updated over the weekend w/o reservations -- will not be archived & have duplicate guests information (one w/ profile information from improt & one with profile changes from over the weekend)

  
update 
  guest_profile g
  left outer join purchase p
  on g.patron_id = p.original_patron_id 
set 
  g.is_archived=1
where g.business_group_id=8200 
  and g.email is null
  and g.created_at > '2020-06-19 16:46:24' 
  and g.created_at < '2020-06-19 17:05:56' 
  and g.updated_at < '2020-06-19 17:05:56'
  and p.id is null;