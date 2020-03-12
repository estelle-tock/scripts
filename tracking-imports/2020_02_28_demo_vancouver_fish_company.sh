# Vancouver Fish Copany Restaurant & Bar - Vancouver
# Demo 2.0 - 3244
# Open Table ERB
# Columns - OpenTableCustomFields

# Run Locally
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/vfc_demo2_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_CUSTOM,separator:',', guestDateFormat:M_D_YY,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"

# added ampersand delimeter to OpenTableUtils for reservation.setTableNumber in code
# reservation.setTableNumber(row.get(OpenTableCustomFields.TABLE).replaceAll("&", ","));

scp -i ~/.ssh/google_compute_engine ~/vfc_demo2_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp vfc_demo2_resos.csv ~

cd ~/importer/server

git pull

git checkout estelle/imports-table-number

./gradlew regenerateSource shadowJar cronJar

#DEMO
./run_importer.sh -e demo -b 3244 -g ../../vfc_demo2_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_CUSTOM,separator:',', guestDateFormat:M_D_YY,guestTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true}"