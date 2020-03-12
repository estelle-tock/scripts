# Tutto 
# prod business ID - 10184
# demo business ID - 2974
# Resy

scp -i ~/.ssh/google_compute_engine big_star_prod_guests.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine resy_empty_resos_2.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp big_star_prod_guests.txt ~

cp resy_empty_resos_2.txt ~

cd ~/importer/server

git pull

./gradlew regenerateSource shadowJar cronJar



#DEMO
./run_importer.sh -e demo -b 3171 -g ../../tutto_bene_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false}"


#PROD
./run_importer.sh -e prod -b 10184 -g ../../tutto_bene_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:YYYY_M_D_DASH, quoteDetectionEnabled: false}"
