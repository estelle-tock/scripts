
@local.env.flags
com.tocktix.cron.dataimport.ImportJob
--businessId=1
--guest_csv=/Users/estelle/tlr_waitlist_prod.csv
--config_json="{formatVersion:WAITLIST,separator:',',guestDateFormat:YYYY_M_D_DASH, resoTimeFormat:H_M_A, resoCreationDateFormat:YYYY_M_D_DASH, resoCreationTimeFormat:H_MM, ticketTypeName: 'Publican', allowReimport: true}"

scp -i ~/.ssh/google_compute_engine ~/tlr_guests_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/tlr_resos_prod.csv estelle@crawl-server:~/ &&
scp -i ~/.ssh/google_compute_engine ~/tlr_waitlist_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp tlr_guests_prod.csv ~ && cp tlr_resos_prod.csv ~ && cp tlr_waitlist_prod.csv ~

cd ~/importer/server

nohup ./run_importer.sh -e demo -b 4324 -g ../../tlr_guests_prod.csv -r ../../tlr_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false}" &

nohup ./run_importer.sh -e demo -b 4324 -g ../../tlr_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Pacific Standard Time', allowReimport: true}" &



# second final demo

nohup ./run_importer.sh -e demo -b 4330 -g ../../tlr_guests_prod.csv -r ../../tlr_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:9}" &

nohup ./run_importer.sh -e demo -b 4330 -g ../../tlr_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'Pacific Standard Time', allowReimport: true}" &


# ------------------------------------------------
# -                      PROD                    -
# ------------------------------------------------

nohup ./run_importer.sh -e prod -b 18481 -g ../../tlr_guests_prod.csv -r ../../tlr_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: true, resumeFromChunkId:9}" &

start time 14:15:35.083 UTC
end time 14:26:24.073 UTC

nohup ./run_importer.sh -e prod -b 18481 -g ../../tlr_waitlist_prod.csv -r ../../empty.txt -c "{formatVersion:WAITLIST,separator:',',guestDateFormat:M_D_YY, resoTimeFormat:H_MM, resoCreationDateFormat:M_D_YY, resoCreationTimeFormat:H_MM, ticketTypeName: 'The Laurel Room', allowReimport: true}" &

start time 14:27:16 UTC
end time 14:27:56.414 UTC

# ------------------------------------------------
# -                 END OF IMPORT                -
# ------------------------------------------------


# ------------------------------------------------
# -                 REMEDIATION                  -
# ------------------------------------------------

# KIBANA TIMES
# Run 1 (Chunk 0-1)
start time 12:35:00 (17:35:00 UTC)
end time 12:37:00 (17:37:00 UTC)

# guests to archive run 1
select g.id, g.business_group_id, g.is_archived, pat.first_name, pat.last_name, pat.email, pat.phone, g.created_at, g.updated_at from guest_profile g
left outer join purchase pur on pur.original_patron_id=g.patron_id
left outer join patron pat on pat.id=g.patron_id
where g.business_group_id=6329
and g.created_at > '2020-08-04 17:35:00' and g.created_at < '2020-08-04 17:37:00'
and g.updated_at <= '2020-08-04 17:37:00'
and pur.id is null;


# CANCELLED PURCHASES RUN 1:
84845700,84845685,84845688,84845691,84845694,84845697,84845682,84845673,84845676,84845679,84845406,84845409,84845412,84845670,84845403,84845400,84845667,84845397,84845664,84845661,84845388,84845391,84845394,84845382,84845385,84845379,84845655,84845658,84845376,84845652,84845646,84845649,84845640,84845643,84845637,84845373,84845634,84845370,84845628,84845631,84845364,84845367,84845625,84845619,84845622,84845361,84845358,84845616,84845355,84845613,84845352,84845610,84845346,84845349,84845343,84845607,84845340,84845598,84845601,84845604,84845592,84845595,84845337,84845589,84845334,84845586,84845580,84845583,84845574,84845577,84845331,84845571,84845568,84845328,84845565,84845322,84845325,84845562,84845319,84845559,84845316,84845313,84845310,84845307,84845304,84845556,84845553,84845550,84845547,84845301,84845544,84845538,84845541,84845298,84845532,84845535,84845295,84845292,84845526,84845529,84845286,84845289,84845283,84845523,84845520,84845517,84845280,84845277,84845274,84845514


# Run 2 (Chunk 0-8) DO NOT CLEAR OUT
start time 12:54:00 (17:54:00 UTC)
end time 13:03:00 (18:03:00 UTC)

# Run 3 (Chunk 0-5)
start time 13:18:00 (18:18:00 UTC)
end time 13:23:00 (18:23:00 UTC)

# guests to archive Run 3
select g.id, g.business_group_id, g.is_archived, pat.first_name, pat.last_name, pat.email, pat.phone, g.created_at, g.updated_at from guest_profile g
left outer join purchase pur on pur.original_patron_id=g.patron_id
left outer join patron pat on pat.id=g.patron_id
where g.business_group_id=6329
and g.created_at > '2020-08-04 18:18:00' and g.created_at < '2020-08-04 18:23:00'
and g.updated_at <= '2020-08-04 18:23:00'
and pur.id is null;


# CANCELLED PURCHASES RUN 3:
84852144,84852147,84852678,84852681,84853228,84853231,84852141,84852432,84852675,84853222,84853225,84852138,84852672,84853219,84852135,84852669,84852132,84852666,84852660,84852663,84853213,84853216,84852129,84852429,84852126,84852426,84853207,84853210,84852123,84852420,84852423,84852120,84852417,84852657,84852414,84852117,84852411,84853204,84852408,84852654,84853198,84853201,84852105,84852108,84852111,84852114,84852405,84852102,84852651,84853195,84852399,84852402,84852648,84852099,84852645,84852096,84852639,84852642,84853192,84852390,84852393,84852396,84852636,84852387,84852633,84852384,84853189,84852381,84852630,84853186,84852627,84852093,84852618,84852621,84852624,84853183,84852378,84852090,84852087,84852375,84853177,84853180,84852084,84852372,84852078,84852081,84852369,84853162,84853165,84853168,84853171,84853174,84852366,84852615,84853159,84852075,84852357,84852360,84852363,84852612,84852072,84852354,84852606,84852609,84853156,84852351,84853144,84853147,84853150,84853153,84852348,84852069,84853141,84852597,84852600,84852603,84852594,84852063,84852066,84852339,84852342,84852345,84852585,84852588,84852591,84853138,84853132,84853135,84852582,84853123,84853126,84853129,84852579,84853120,84852060,84852570,84852573,84852576,84853117,84853114,84852057,84852336,84852333,84853111,84852330,84852564,84852567,84853108,84852054,84853105,84852327,84852561,84852324,84852051,84852321,84853102,84852048,84852318,84852045,84852558,84852042,84852555,84852039,84852036,84852546,84852549,84852552,84853099,84852033,84852315,84853093,84853096,84852030,84852543,84852312,84852540,84853090,84853081,84853084,84853087,84852027,84852534,84852537,84852309,84852024,84852531,84853078,84852018,84852021,84853075,84852015,84852306,84853072,84852012,84852528,84852525,84852006,84852003,84852303,84853069,84852300,84852522,84852000,84852297,84851997,84852294,84852285,84852288,84852291,84852282,84853066,84852519,84852279,84853063,84852276,84852273,84853060,84852264,84852267,84852270,84852516

# Run 1 (0-1)
# Run 2 (1-8)
# Run 3 (2-5)
# Run 4 (9-70)
# Removed all resos/guests from Run 1
# Removed all resos/guests from Run 3
# Need to reprocess chunk 0

# Reprocess chunk 0

nohup ./run_importer.sh -e demo -b 4331 -g ../../tlr_guests_prod.csv -r ../../tlr_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: false, startFromChunkId:0, endBeforeChunkId:1}" &

# prod
nohup ./run_importer.sh -e prod -b 18481 -g ../../tlr_guests_prod.csv -r ../../tlr_resos_prod.csv -c "{formatVersion:RESY,separator:',', resoDateFormat:M_D_YY,resoTimeFormat:H_MM, guestDateFormat: M_D_YY, resoCreationDateFormat:M_D_YY,resoCreationTimeFormat:H_MM, quoteDetectionEnabled: false, smsReminderEnabled: true, startFromChunkId:0, endBeforeChunkId:1, allowReimport:true}" &
