# ------------------- INSTRUCTIONS ------------------------
#
# (Cmd + Shift + F) -> <??____??> -> actual value
# or run ./createRunCommands.sh to auto-fill
#
# ----------------- BUSINESS DETAILS ----------------------
#
# Business Name - Alma Cafe / Alma Restaurant
# Demo ID - 3439
# Reminder Texts - true
# Welcome Texts - false
# Export Configurations - n 
#
# ------------------- DATA DETAILS -----------------------
#
# Booking System - OPENTABLE_GUESTCENTER
# Ticket Type - ticketTypeName: Alma Cafe
# Config Type - flex
# Reso Date Format - YYYY_M_D_DASH
# Reso Time Format - H_M_A
# Reservation file name - alma_cafe_resos
#
# --------------------------------------------------------


# ------------------------------------------------
# -                 FINAL DEMO                   -
# ------------------------------------------------
./concat.sh ~/alma_cafe_resos.zip ~/alma_cafe_resos.csv

# Check headers & adjust appropriately to Import Job Formatter on Mac Numbers

# Run Locally (RESOS & GUESTS)
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/alma_cafe_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/alma_restaurant_resos.csv
--reso_csv=/Users/estelle/empty.txt
--config_json="{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"

scp -i ~/.ssh/google_compute_engine ~/alma_restaurant_resos.csv estelle@crawl-server:~/ && 
scp -i ~/.ssh/google_compute_engine ~/alma_cafe_resos.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp alma_cafe_resos.csv ~ && cp alma_restaurant_resos.csv ~

cd ~/importer/server

# check dashboard-demo.exploretock.com for tables at ID 
./export_configuration.sh prod 10246 10246.prod.proto
./import_configuration.sh demo 3439 10246.prod.proto

# FINAL DEMO (RESOS & GUESTS)
./run_importer.sh -e demo -b 3439 -g ../../alma_cafe_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Cafe Alma'}"

./run_importer.sh -e demo -b 3439 -g ../../alma_restaurant_resos.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, quoteDetectionEnabled: false, smsReminderEnabled: true, ticketTypeName: 'Restaurant Alma'}"

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------

15:52:30.993 steve.e.list@uwrf.edu
15:52:30.993 jmk@trcnyc.com
15:52:30.993 pwgroth@mmm.com
15:52:30.993 breda001@umn.edu
15:52:30.994 ander215@umn.edu
15:52:30.994 jeffrey.hill77@gmail.com
15:52:30.995 constanceaa@comcast.net
15:52:30.995 marr0061@umn.edu
15:52:30.995 fergu226@umn.edu
15:52:30.995 boley014@umn.edu
15:52:30.995 metta54@gmail.com
15:52:30.996 sivaraj@umn.edu
15:52:30.996 rebecca.sutherland@orthology.com
15:52:30.997 christopher.brown@xenuclear.com
15:52:30.997 afurston@umn.edu
15:52:30.997 jackfbrunner@gmail.com
15:52:30.998 pattioberger@gmail.com
15:52:30.998 kkthames60@gmail.com
15:52:30.998 dara@bitstream.net
15:52:30.998 failletl@stolaf.edu
15:52:30.998 patnodes5@yahoo.com
15:52:30.999 jamgado@gmail.com
15:52:30.999 jody_mahoney@comcast.net
15:52:30.999 jjewell.thomas@gmail.com
15:52:30.999 mayhe001@umn.edu
15:52:30.999 tonsoni@comcast.net
15:52:31.000 grslade31@aol.com
15:52:31.000 tori216@me.umn.edu
15:52:31.001 genxgem@yahoo.com
15:52:31.001 kmm@mgmllp.com
15:52:31.001 swans143@umn.edu
15:52:31.002 gary.mayeux@yahoo.com
15:52:31.002 veronica@ghjm.com
15:52:31.002 ander607@umn.edu
15:52:31.002 cuthb001@umn.edu
15:52:31.002 prh6868@gmail.com
15:52:31.003 asalvato@sjm.com
15:52:31.003 ddfellner@comcast.net
15:52:31.003 fanclanfive@gmail.com
15:52:31.004 jbassoc@erols.com
15:52:31.004 bob_harding2001@yahoo.com
15:52:31.004 dmashaal@comcast.net
15:52:31.004 carol.kayser@usdoj.gov
15:52:31.005 hansoo.k.laptop@gmail.com
15:52:31.005 jensen@crccs.com
15:52:31.005 theresa@mnopera.org
15:52:31.005 oneil009@umn.edu
15:52:31.006 mlkrogh@comcast.net
15:52:31.006 ddbaird@me.com
15:52:31.006 linne009@umn.edu
15:52:31.006 mort.mortenson@mortenson.com
15:52:31.006 tbauser22@gmail.com
15:52:31.007 sfpermuth@gmail.com
15:52:31.007 menzel@umn.edu
15:52:31.007 tiry.brian@gmail.com
15:52:31.007 aberg@afmov.com
15:52:31.007 jrolson1111@gmail.com
15:52:31.008 kelly.roysland@gmail.com
15:52:31.008 blcmdpa@gmail.com
15:52:31.008 marydhall@charter.net
15:52:31.008 mmoholendt@gmail.com
15:52:31.009 ageecathy@aol.com
15:52:31.009 liz.melby@icsi.org
15:52:31.009 mwitt0625@yahoo.com
15:52:31.009 ajmidwife8@gmail.com
15:52:31.010 pjslimbacher@gmail.com
15:52:31.010 pboss@umn.edu
15:52:31.010 slukas221@comcast.net
15:52:31.010 Concierges 68


# -------------- UPDATE SALESFORCE ---------------
# Comment with commands and steps used for import
# Update with time completed on Account Page > Details > Import for Eng
# ------------------------------------------------

# Total manual eyeball-ing checks that should be automated: 47
# Total manual commands run: 18
