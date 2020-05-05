./run_importer.sh -e demo -b 3442 -g ../../chinois_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', guestDateFormat:M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: true}"

./run_importer.sh -e demo -b 3301 -g ../../sanford_resos.csv -r ../../empty.txt -c "{formatVersion:CELLAR_PASS,separator:',', guestDateFormat:M_D_YYYY, quoteDetectionEnabled: false, smsReminderEnabled: true}"
