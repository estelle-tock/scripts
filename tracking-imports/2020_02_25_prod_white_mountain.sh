# White Mountain 
# prod business ID - 10170
# demo business ID - 3197
# YELP

scp -i ~/.ssh/google_compute_engine white_mountain_demo_guest.csv estelle@crawl-server:~/

scp -i ~/.ssh/google_compute_engine white_mountain_demo_reso.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp white_mountain_demo_guest.csv ~

cp white_mountain_demo_reso.csv ~

cd ~/importer/server

git pull

./gradlew regenerateSource shadowJar cronJar



#DEMO
./run_importer.sh -e demo -b 3197 -g ../../white_mountain_demo_guest.csv -r ../../white_mountain_demo_reso.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YY, quoteDetectionEnabled: false}"


#PROD
./run_importer.sh -e prod -b 10170 -g ../../white_mountain_demo_guest.csv -r ../../white_mountain_demo_reso.csv -c "{formatVersion:YELP,separator:',', resoDateFormat:M_D_YY, quoteDetectionEnabled: false}"
