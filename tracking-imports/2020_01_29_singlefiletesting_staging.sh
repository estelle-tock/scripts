# ------------------------------------------------
# -               IMPORT COMMANDS                -
# ------------------------------------------------
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/Downloads/Aurum_Steamboat_OTGC_Reservations.csv
--config_json="{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}"

# TODO
# add in valdiation so it will error on bad date format


# ----------------------- OTGC ---------------------------


# OTGC - Resos & Guests
nohup ./run_importer.sh -e staging -b 33283 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &

# Want to change: Visit Notes, Visit Notes 2, visit Notes 3 - Merge w/o keys

# Second Run with fixes
nohup ./run_importer.sh -e staging -b 33319 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &

# Reservations that are canceled are coming over - fixed
# General Notes are duplicated - fixed

# Third run with fixes
nohup ./run_importer.sh -e staging -b 33334 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &

# General Notes is in both guest and visit notes (only want in visit notes)
# Guest notes need some merged and some merged with keys

# Fourth run with fixes
nohup ./run_importer.sh -e staging -b 33336 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &


# Fifth run with fixes
nohup ./run_importer.sh -e staging -b 33337 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &

# Sixth run with fixes
nohup ./run_importer.sh -e staging -b 33340 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &

# Seventh run with fixes
nohup ./run_importer.sh -e staging -b 33354 -g ~/trashcan/Aurum_Steamboat_OTGC_Reservations.csv -c "{formatVersion:SINGLE_FILE,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false,allowReimport: true}" &


# ------------------ OTGC GUESTS ONLY--------------------


# OTGC - Guests Only
nohup ./run_importer.sh -e staging -b 33284 -g ~/trashcan/Dim_Sum_House_OTGC_Guest_ONLYData.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# General Notes, Special Relationship, Seating Preferences, Food & Drink Preferences didn't come over - fix

# Run 2 with fixes
nohup ./run_importer.sh -e staging -b 33320 -g ~/trashcan/Dim_Sum_House_OTGC_Guest_ONLYData.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &


# third run
nohup ./run_importer.sh -e staging -b 33335 -g ~/trashcan/Dim_Sum_House_OTGC_Guest_ONLYData.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# Guest notes are not there - fixed

# Fourth run
nohup ./run_importer.sh -e staging -b 33355 -g ~/trashcan/Dim_Sum_House_OTGC_Guest_ONLYData.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &


# ----------------------- CUSTOM ---------------------------

# Custom - Resos & Guests
nohup ./run_importer.sh -e staging -b 33289 -g ~/trashcan/TPWC_All_Reservations_new_Custom_with_Resos.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# Guestbook notes, 2, 3 missing

# second run
nohup ./run_importer.sh -e staging -b 33356 -g ~/trashcan/TPWC_All_Reservations_new_Custom_with_Resos.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &


# ------------------- CUSTOM - GUESTS ONLY -----------------

# Custom - Guests Only
nohup ./run_importer.sh -e staging -b 33285 -g ~/trashcan/Game_Creek_Guest_Data_v2_guest_data_only_Custom.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &

# reservation count is not right

#second run
nohup ./run_importer.sh -e staging -b 33357 -g ~/trashcan/Game_Creek_Guest_Data_v2_guest_data_only_Custom.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false}" &


# --------------------- OTGC (2nd Dataset) ------------------------

# OTGC - Resos & Guests (2nd Dataset)
nohup ./run_importer.sh -e staging -b 33287 -g ~/trashcan/ProvenderKitchen_OTGC_RESO_FILE.csv -c "{separator:',', formatVersion:SINGLE_FILE,resoDateFormat:M_D_YY,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, allowRebalancing:false, allowReimport:true}" &


