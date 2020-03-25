# bin/bash
set -eo pipefail

inputs() {
  read -p 'Name of command file (date_env_business.sh): ' command_file
  read -p 'Business Name? ' business_name
  read -p '(Final) Demo ID? ' demo_id
  read -p 'Production ID? (press enter if not production) ' prod_id
  read -p 'Reminder Texts On? true or false: ' reminder_texts_bool
  read -p 'Welcome Texts On? true or false: ' welcome_texts_bool
  read -p 'Export Configurations? y or n ' export_configs_bool
  if [[ "$export_configs_bool" == "y" ]]; then
    read -p 'Export Configurations FROM environment (demo, staging, prod): ' export_business_env
    read -p 'Export Configurations FROM ID: ' export_business_id
    read -p 'Import Configurations TO environment (demo, staging, prod): ' import_business_env
    read -p 'Import Configurations TO: ' import_business_id
    read -p 'Import to a second site? y or n ' second_import_bool
    if [[ "$second_import_bool" == 'y' ]]; then
      read -p 'Second Import Configurations TO environment: (demo, staging, prod)' import2_business_env
      read -p 'Second Import Configurations TO : ' import2_business_id
    fi
  fi
  read -p 'Booking System (OPENTABLE_GUEST_CENTER, YELP, RESY, etc.): ' booking_system
  read -p 'Ticket Type (press enter if none): ' ticket_type
  ticket_type="ticketTypeName: $ticket_type"
  read -p 'Config Type (ex. flex/slot): ' config_type
  read -p 'Reservation File Name [mandatory]: (ex. alinea_resos) ' business_resos
  read -p 'Guest file name [press enter if none]: (ex. alinea_guests) ' business_guests
  read -p 'Waitlist file name [press enter if none]: (ex. alinea_waitlist) ' business_waitlist

  read -p 'Reservation Date Format (ex. YYYY_M_D_DASH, M_D_YY): ' reso_date_format
  read -p 'Reservation Time Format (ex. HH_MM_SS, H_M_A): ' reso_time_format
  read -p 'Waitlist Date Format [press enter if none] (ex. YYY_M_D_DASH, M_D_YY): ' waitlist_date_format
  read -p 'Waitlist Time Format [press enter if none] (ex. HH_MM_SS, H_M_A): ' waitlist_time_format
}

createFile() {
  sed -i '' "s/<??business_name??>/$business_name/g" "$1"
  sed -i '' "s/<??demo_id??>/$demo_id/g" "$1"
  sed -i '' "s/<??prod_id??>/$prod_id/g" "$1"
  sed -i '' "s/<??reminder_texts_bool??>/$reminder_texts_bool/g" "$1"
  sed -i '' "s/<??welcome_texts_bool??>/$welcome_texts_bool/g" "$1"
  sed -i '' "s/<??export_configs_bool??>/$export_configs_bool/g" "$1"
  sed -i '' "s/<??export_business_env??>/$export_business_env/g" "$1"
  sed -i '' "s/<??export_business_id??>/$export_business_id/g" "$1"
  sed -i '' "s/<??import_business_env??>/$import_business_env/g" "$1"
  sed -i '' "s/<??import_business_id??>/$import_business_id/g" "$1"
  sed -i '' "s/<??second_import_bool??>/$second_import_bool/g" "$1"
  sed -i '' "s/<??import2_business_env??>/$import2_business_env/g" "$1"
  sed -i '' "s/<??import2_business_id??>/$import2_business_id/g" "$1"
  sed -i '' "s/<??booking_system??>/$booking_system/g" "$1"
  sed -i '' "s/<??ticket_type??>/$ticket_type/g" "$1"
  sed -i '' "s/<??config_type??>/$config_type/g" "$1"
  sed -i '' "s/<??reso_date_format??>/$reso_date_format/g" "$1"
  sed -i '' "s/<??reso_time_format??>/$reso_time_format/g" "$1"
  sed -i '' "s/<??waitlist_date_format??>/$waitlist_date_format/g" "$1"
  sed -i '' "s/<??waitlist_time_format??>/$waitlist_time_format/g" "$1"
  sed -i '' "s/<??business_resos??>/$business_resos/g" "$1"
  sed -i '' "s/<??business_guests??>/$business_guests/g" "$1"
  sed -i '' "s/<??business_waitlist??>/$business_waitlist/g" "$1"
}

main() {
  inputs

  cp "templates/date_env_businessName.sh" "$command_file"
  createFile "$command_file"

  #cp "templates/run_local.sh" "run_local_$command_file"
  #createFile "run_local_$command_file"

  open "$command_file" 
  # open "run_local_$command_file"
}

# Calling main
main "$@"

#################
# End of script #
#################
