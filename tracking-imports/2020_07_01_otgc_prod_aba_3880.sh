# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------


scp -i ~/.ssh/google_compute_engine ~/aba_resos_prod.csv estelle@crawl-server:~/
scp -i ~/.ssh/google_compute_engine ~/aba_guests_only_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp aba_resos_prod.csv ~
cp aba_guests_only_prod.csv ~

cd ~/importer/server

# FINAL DEMO (RESOS & GUESTS)
nohup ./run_importer.sh -e demo -b 4088 -g ../../aba_resos_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

nohup ./run_importer.sh -e demo -b 4088 -g ../../aba_guests_only_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowReimport:true}" &

# testing not locking business out (86 chunks - LEYE )

nohup ./run_importer.sh -e prod -b 3880 -g ../../aba_resos_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

nohup ./run_importer.sh -e prod -b 3880 -g ../../aba_guests_only_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowReimport:true}" &

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# new importer code

#final demo
start time 18:04:23
end time 

#prod
start time 19:39:40
end time 20.25.22

# 3 deadlocks

# 2.5 hours
file lines 159,972 -> 1.5