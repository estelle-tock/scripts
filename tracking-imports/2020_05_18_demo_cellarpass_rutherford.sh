

# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
select * from patron join guest_profile on patron.id = guest_profile.patron_id where business_group_id=3084 AND created_by_business=3462;

select * from business where id=3462;

UPDATE patron SET first_name=NULL, last_name=NULL where created_by_business=3462 AND created_at > '2020-05-04';

# -------------------------------------------------
# modified events file to be OTGC_GUEST_ONLY columns

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--reso_csv=/Users/estelle/rutherford_resos_final.csv
--config_json="{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/rutherford_otgc_guests_only.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: true}"

scp -i ~/.ssh/google_compute_engine ~/rutherford_resos_final.csv estelle@crawl-server:~/ 
scp -i ~/.ssh/google_compute_engine ~/rutherford_otgc_guests_only.csv estelle@crawl-server:~/ 

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp rutherford_resos_final.csv ~ 
cp rutherford_otgc_guests_only.csv ~

cd ~/importer/server

./export_configuration.sh prod 12851 12851.prod.proto
./import_configuration.sh demo 3529 12851.prod.proto


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3529 -r ../../rutherford_resos_final.csv -c "{formatVersion:CELLAR_PASS,separator:',', resoDateFormat:M_D_YYYY,resoTimeFormat:H_M_A, resoCreationDateFormat:M_D_YYYY_H_M_A,guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: true}"

./run_importer.sh -e demo -b 3529 -g ../../rutherford_otgc_guests_only.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,guestDateFormat:M_D_YYYY,separator:',',quoteDetectionEnabled: false, smsReminderEnabled: true}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
