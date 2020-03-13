# bin/bash
set -eo pipefail

./concat.sh ~/<??business_resos??>.zip ~/<??business_resos??>.csv

# Check headers & adjust appropriately to Import Job Formatter on Mac Numbers

read -p 'Is Api Server running? y or n ' api_server_running
if [[ "$api_server_running" != 'y' ]]; then 
  echo "Please start your local API server before proceeding."
  exit 1
fi

read -p 'Path to root folder: ' root
read -p 'Path to admin folder: ' admin_root

cd "$admin_root"
cd server 

read -p 'Clear out DB? y or n ' clear_db
if [[ "$clear_db" == 'n' ]]; then 
  exit 1
elif [[ "$clear_db" == 'y' ]]
  rake db:regenerate
fi

read -p 'Run locally to test? y or n ' run_locally
if [[ "$run_locally" == 'n' ]]; then 
  exit 1
elif [[ "$run_locally" == 'y' ]]
  # Run Locally (RESOS & GUESTS)
  java -Xmx12G -Dlog4j.configuration=logging-dev.properties -Dsun.net.inetaddr.ttl=60 -jar build/libs/cron.jar @local.env.flags \
      com.tocktix.cron.dataimport.ImportJob --businessId=1 \
      --guest_csv="$root/<??business_guests??>.csv" --reso_csv="$root/<??business_resos??>.csv" --config_json="{formatVersion:<??booking_system??>,separator:',', resoDateFormat:<??reso_date_format??>,resoTimeFormat:<??reso_time_format??>, quoteDetectionEnabled: false, smsReminderEnabled: <??reminder_texts_bool??>,'<??ticket_type??>'}"
fi

scp -i ~/.ssh/google_compute_engine ~/<??business_resos??>.csv estelle@crawl-server:~/

if [[ -z "$business_guests" ]]; then
else
  scp -i ~/.ssh/google_compute_engine ~/<??business_guests??>.csv estelle@crawl-server:~/
fi

# Run Locally (WAITLISTS)
if [[ "$waitlist_bool" == "true" ]]; then
  java -Xmx12G -Dlog4j.configuration=logging-dev.properties -Dsun.net.inetaddr.ttl=60 -jar build/libs/cron.jar @local.env.flags \
      com.tocktix.cron.dataimport.ImportJob --businessId=1 \
      --guest_csv="$root/<??business_waitlist??>.csv" --reso_csv="$root/empty.txt" --config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:<??waitlist_date_format??> ,resoTimeFormat:<??waitlist_time_format??>,fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}],'<??ticket_type??>'}"

  scp -i ~/.ssh/google_compute_engine ~/<??business_waitlist??>.csv estelle@crawl-server:~/
fi

ssh -i ~/.ssh/google_compute_engine crawl-server
