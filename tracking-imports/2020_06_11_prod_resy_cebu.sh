# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------

# reservation add source column before table_seated_at
# guest renaming columns to resy format

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/cebu_guests.csv
--reso_csv=/Users/estelle/cebu_resos.csv
--config_json="{formatVersion:RESY, resoDateFormat:M_D_YY,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:HH_MM,quoteDetectionEnabled: false, smsReminderEnabled: false, separator:','}"

scp -i ~/.ssh/google_compute_engine ~/cebu_guests.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/cebu_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp cebu_resos.csv ~ && cp cebu_guests.csv ~

cd ~/importer/server


# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3323 -g ../../cebu_guests.csv -r ../../cebu_resos.csv -c  "{formatVersion:RESY, resoDateFormat:M_D_YY,resoTimeFormat:HH_MM_SS, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:HH_MM,quoteDetectionEnabled: false, smsReminderEnabled: false, separator:','}"

./run_importer.sh -e demo -b 3323 -g ../../cebu_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: 'Cebu'}"

# run cebu prod using clowncar


@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/cebu_waitlist.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: 'Cebu'}"


./run_importer.sh -e prod -b 10654 -g ../../cebu_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}], ticketTypeName: 'Cebu'}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
