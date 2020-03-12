# Wahoo
# prod business ID - 10055
# demo business ID - 3244
# RESY

scp -i ~/.ssh/google_compute_engine wahoo_guest.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine wahoo_resos.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine wahoo_waitlist.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp wahoo_guest.csv ~

cp wahoo_resos.csv ~

cp wahoo_waitlist.csv ~

cd ~/importer/server

git pull

./gradlew regenerateSource shadowJar cronJar

#DEMO
./run_importer.sh -e demo -b 2937 -g ../../wahoo_guest.csv -r ../../wahoo_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false}"


#WAITLIST DEMO
./run_importer.sh -e demo -b 2937 -g ../../wahoo_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}]}"


#PROD
./run_importer.sh -e prod -b 10055 -g ../../wahoo_guest.csv -r ../../wahoo_resos.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:HH_MM_SS, quoteDetectionEnabled: false}"


#WAITLIST PROD
./run_importer.sh -e prod -b 10055 -g ../../wahoo_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:HH_MM_SS, fieldNameMap:[{fieldName: 'firstName', columnName: 'first_name'}, {fieldName: 'lastName', columnName: 'last_name'},{fieldName: 'phone', columnName: 'mobile_number'}, {fieldName: 'email', columnName: 'em_address'}, {fieldName: 'createdAt', columnName: 'date_created'}, {fieldName: 'desiredDate', columnName: 'date_booked'}, {fieldName: 'desiredSize', columnName: 'num seats'}, {fieldName: 'note', columnName: 'preferred start'}]}"