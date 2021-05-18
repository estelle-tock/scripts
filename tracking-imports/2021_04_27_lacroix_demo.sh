# ------------------------------------------------
# -               IMPORT COMMANDS                -
# ------------------------------------------------

# DEMO 
nohup ./run_importer.sh -e demo -b 5821 -g ~/trashcan/lacroix_demo_2.csv  -c "{formatVersion:SINGLE_FILE, separator: ',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A,resoCreationDate:YYYY_M_D_DASH, resoCreationTimeFormat:H_M_A,guestDateFormat: YYYY_M_D_DASH,allowReimport:false}" &
