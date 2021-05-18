@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/frontier_waitlist.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationTimeFormat:H_MM, ticketTypeName: 'Frontier'}"

./run_importer.sh -e demo -b 3975 -g ../../frontier_waitlist.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Frontier'}"


./run_importer.sh -e prod -b 15853 -g ../../frontier_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Frontier'}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------
