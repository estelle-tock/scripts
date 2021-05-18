@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/jewel_waitlist.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationTimeFormat:H_MM, ticketTypeName: 'Jewel of the South - New Orleans'}"



./run_importer.sh -e prod -b 17449 -g ../../jewel_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Jewel of the South - New Orleans'}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
