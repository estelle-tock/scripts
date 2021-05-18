
scp -i ~/.ssh/google_compute_engine ~/sabio_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp sabio_prod.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e prod -b 14549 -g ../../sabio_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:3}"



./run_importer.sh -e prod -b 14549 -g ../../sabio_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:3}"

update 
  guest_profile g
  left outer join purchase p
  on g.patron_id = p.original_patron_id 
set 
  g.is_archived=1
where g.business_group_id=10874 
  and g.email is null
  and g.created_at > '2020-06-19 16:30:02' 
  and g.created_at < '2020-06-19 16:41:36' 
  and g.updated_at < '2020-06-19 16:41:36' 
  and p.id is null;
  
select * from guest_profile 
left outer join purchase on guest_profile.patron_id = purchase.original_patron_id 
where guest_profile.business_group_id=10874 
  and guest_profile.email is null
  and guest_profile.created_at > '2020-06-19 16:30:02' 
  and guest_profile.created_at < '2020-06-19 16:41:36' 
  and guest_profile.updated_at < '2020-06-19 16:41:36' 
  and purchase.id is null;

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


-- guests that don't have visits (SABIO)
select * from guest_profile left outer join purchase on guest_profile.patron_id = purchase.original_patron_id 
where guest_profile.business_group_id=10874 and guest_profile.email is null
and guest_profile.created_at > '2020-06-22 8:53:27' and guest_profile.created_at < '2020-06-22 10:09:00'
and purchase.id is null
group by guest_profile.first_name, guest_profile.last_name, guest_profile.email, guest_profile.nick_name;

-- guests that were created today (Sabio) 10559
select * from guest_profile where guest_profile.business_group_id=10874 and guest_profile.created_at > '2020-06-22 14:06:43' and guest_profile.created_at < '2020-06-22 14:08:43';

-- guests that were created w/ guests only (Sabio) 11487
select * from guest_profile where guest_profile.business_group_id=10874 and guest_profile.created_at > '2020-06-19 16:30:02' and guest_profile.created_at < '2020-06-19 16:42:36';

-- guests that were created w/ guests only that were updated after import (Sabio) 933
select * from guest_profile where guest_profile.business_group_id=10874 and guest_profile.created_at > '2020-06-19 16:30:02' and guest_profile.created_at < '2020-06-19 16:42:36' and updated_at>'2020-06-19 16:42:36';

-- guests that were created w/ guests only  that don't have a visit, email, created on friday during import & was not updated over the weekend. (Sabio) 10554
select * from guest_profile 
left outer join purchase on guest_profile.patron_id = purchase.original_patron_id 
where guest_profile.business_group_id=10874 
  and guest_profile.email is null
  and guest_profile.created_at > '2020-06-19 16:30:02' 
  and guest_profile.created_at < '2020-06-19 16:41:36' 
  and guest_profile.updated_at < '2020-06-19 16:41:36' 
  and purchase.id is null;

-- 11,487 guests were imported w/ no historical reservations
-- 10,554 of those guests were not updated after the import
-- 993 of those guests were updated after the import
-- 10,559 guests were re-imported w/ historical reseration information
-- 10,554 guests that were created w/ no historical reservations were not updated again & have no reservations associated with them - are safe to be archived
-- 778 were updated over the weekend w/ reservations. -- will not be archived & have duplicate guests information (one w/ historical & one with reservations from over the weekend)
-- 152 were updated over the weekend w/o reservations -- will not be archived & have duplicate guests information (one w/ profile information from improt & one with profile changes from over the weekend)

  
update 
  guest_profile g
  left outer join purchase p
  on g.patron_id = p.original_patron_id 
set 
  g.is_archived=1
where g.business_group_id=10874 
  and g.email is null
  and g.created_at > '2020-06-19 16:30:02' 
  and g.created_at < '2020-06-19 16:41:36' 
  and g.updated_at < '2020-06-19 16:41:36' 
  and p.id is null;

