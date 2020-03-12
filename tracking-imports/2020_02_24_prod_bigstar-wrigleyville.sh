# Big Star Wrigleyville
# prod business ID - 8680
# demo business ID - 3212
# Resy

# nohup ./run_importer.sh -e demo -b 1234 -g ../restaurant_guests.csv -r ../restaurant_resos.csv -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',',guestDateFormat:M_D_YYYY}" &

scp -i ~/.ssh/google_compute_engine big_star_prod_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine resy_empty_resos_2.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp big_star_prod_guests.txt ~

cp resy_empty_resos_2.txt ~

cd importer

git pull

./gradlew regenerateSource shadowJar cronJar

# DEMO
./run_importer.sh -e demo -b 3212 -g ../../big_star_prod_guests.csv -r ../../resy_empty_resos_2.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH, resoTimeFormat: HH_MM_SS, quoteDetectionEnabled: false}"

# PROD
./run_importer.sh -e prod -b 8680 -g ../../big_star_prod_guests.csv -r ../../resy_empty_resos_2.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:YYYY_M_D_DASH, resoTimeFormat: HH_MM_SS, quoteDetectionEnabled: false}"
