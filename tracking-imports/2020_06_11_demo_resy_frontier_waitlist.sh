@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/frontier_waitlist.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationTimeFormat:H_MM, ticketTypeName: 'Frontier'}"

./run_importer.sh -e demo -b 3802 -g ../../frontier_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationTimeFormat:H_MM, ticketTypeName: 'Frontier'}"



@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/frontier_guests_clipped.csv
--reso_csv=/Users/estelle/frontier_resos_clipped.csv
--config_json="{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:HH_MM_SS,resoCreationTimeFormat:H_MM, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
