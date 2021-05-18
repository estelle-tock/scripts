scp -i ~/.ssh/google_compute_engine ~/luca_prod.csv estelle@crawl-server:~/ && scp -i ~/.ssh/google_compute_engine ~/mizuna_prod.csv estelle@crawl-server:~/ && scp -i ~/.ssh/google_compute_engine ~/russels_prod.csv estelle@crawl-server:~/

ssh -i ~/.ssh/google_compute_engine crawl-server

sudo su robinanil

cp luca_prod.csv ~ && cp mizuna_prod.csv ~ && cp russels_prod.csv ~

cd ~/importer/server


# 8:00 PM

# ------------------------------------------------------------------------------------

# FRENCH 75
update business set is_importing=1 where id=15155;
select * from business where id=15155;

# reservations
./run_importer.sh -e prod -b 15155 -g ../../french75_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# 00:59:10.752 [main] INFO  com.tocktix.dataimport.ImportHelper  - Inserting Chunk 9/15 with 1000 guests, 1047 reservations, 0 waitlists, for businessId 15155
# Caused by: java.sql.BatchUpdateException: (conn=124799) Deadlock found when trying to get lock; try restarting transaction

./run_importer.sh -e prod -b 15155 -g ../../french75_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:9}"

# guests
./run_importer.sh -e prod -b 15155 -g ../../french75_guests_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

#01:10:38.141 [main] ERROR org.hibernate.engine.jdbc.batch.internal.BatchingBatch  - HHH000315: Exception executing batch [java.sql.BatchUpdateException: (conn=125488) Deadlock found when trying to get lock; try restarting transaction], SQL: /* update com.tocktix.model.entities.GuestProfileEntity */ update guest_profile set updated_at=?, version=?, original_guest_profile_id=? where id=? and version=?
#01:10:38.141 [main] WARN  org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - SQL Error: 1213, SQLState: 40001
#01:10:38.141 [main] ERROR org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - (conn=125488) Deadlock found when trying to get lock; try restarting transaction
#01:10:38.152 [main] INFO  com.tocktix.process.ProcessLauncher  - Took 62s
#01:10:38.152 [main] INFO  com.tocktix.process.ProcessLauncher  - Nothing to shut down com.tocktix.cron.dataimport.ImportJob.shutdown(com.google.inject.Injector,com.tocktix.environment.EnvironmentOptions), skipping...
#01:10:38.152 [main] ERROR com.tocktix.process.ProcessLauncher  - Program terminated with an exception
#com.tocktix.exceptions.ApiException: Tock has a case of the hiccups. Please try again or contact Tock if the issue persists.
#  at com.tocktix.cron.dataimport.ImportJob.run(ImportJob.java:113)
#  at com.tocktix.process.ProcessLauncher.runClass(ProcessLauncher.java:231)
#  at com.tocktix.process.ProcessLauncher.runWithEnvironmentArgs(ProcessLauncher.java:166)
#  at com.tocktix.process.ProcessLauncher.runFromCommandLineOptions(ProcessLauncher.java:132)
#  at com.tocktix.process.ProcessLauncher.main(ProcessLauncher.java:76)
#Caused by: java.lang.IllegalStateException: javax.persistence.RollbackException: Error while committing the transaction
#  at com.tocktix.dataimport.ImportHelper.upsert(ImportHelper.java:255)
#  at com.tocktix.cron.dataimport.ImportJob$Importer.lambda$run$4(ImportJob.java:217)
#  at com.tocktix.eventbus.EventBusWrapper.callWithoutPublishing(EventBusWrapper.java:41)
#  at com.tocktix.cron.dataimport.ImportJob$Importer.run(ImportJob.java:207)
#  at com.tocktix.cron.dataimport.ImportJob.lambda$run$0(ImportJob.java:108)
#  at com.tocktix.util.guice.SimpleScope.lambda$runInScope$3(SimpleScope.java:116)
#  at com.tocktix.cron.dataimport.ImportJob.run(ImportJob.java:109)
#  ... 4 more

./run_importer.sh -e prod -b 15155 -g ../../french75_guests_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:15}"


update business set is_importing=0 where id=15155;
select * from business where id=15155;

# ------------------------------------------------------------------------------------


# 10:00 PM

# ------------------------------------------------------------------------------------
update business set is_importing=0 where business_group_id=9953;
select * from business where business_group_id=9953;

# OSTERIA

./run_importer.sh -e prod -b 15152 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# 03:01:18.290 [main] ERROR org.hibernate.engine.jdbc.batch.internal.BatchingBatch  - HHH000315: Exception executing batch [java.sql.BatchUpdateException: (conn=128534) Deadlock found when trying to get lock; try restarting transaction], SQL: /* insert collection row com.tocktix.model.entities.PurchaseEntity.payments */ insert into payment_purchase (purchase_id, payment_id) values (?, ?)
# 03:01:18.290 [main] WARN  org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - SQL Error: 1213, SQLState: 40001
# 03:01:18.290 [main] ERROR org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - (conn=128534) Deadlock found when trying to get lock; try restarting transaction

./run_importer.sh -e prod -b 15152 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:48}"


#03:13:57.097 [main] INFO  com.tocktix.dataimport.ImportHelper  - Inserting Chunk 100/169 with 1000 guests, 1133 reservations, 0 waitlists, for businessId 15152
#03:14:03.478 [main] ERROR org.hibernate.engine.jdbc.batch.internal.BatchingBatch  - HHH000315: Exception executing batch [java.sql.BatchUpdateException: (conn=128934) Deadlock found when trying to get lock; try restarting transaction], SQL: /* update com.tocktix.model.entities.PurchaseEntity */ update purchase set updated_at=?, version=?, original_purchase_id=? where id=? and version=?
#03:14:03.478 [main] WARN  org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - SQL Error: 1213, SQLState: 40001
#03:14:03.478 [main] ERROR org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - (conn=128934) Deadlock found when trying to get lock; try restarting transaction

./run_importer.sh -e prod -b 15152 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:100}"

#03:18:54.540 [main] INFO  com.tocktix.dataimport.ImportHelper  - Inserting Chunk 106/169 with 1000 guests, 1041 reservations, 0 waitlists, for businessId 15152
#03:19:00.556 [main] ERROR org.hibernate.engine.jdbc.batch.internal.BatchingBatch  - HHH000315: Exception executing batch [org.hibernate.StaleStateException: Batch update returned unexpected row count from update [0]; actual row count: 0; expected: 1; statement executed: HikariProxyPreparedStatement@2007595039 wrapping sql : '/* update com.tocktix.model.entities.TicketGroupEntity */ update ticket_group set updated_at=?, version=?, service_type=? where id=? and version=?', parameters : [null,null,null,null,null]], SQL: /* update com.tocktix.model.entities.TicketGroupEntity */ update ticket_group set updated_at=?, version=?, service_type=? where id=? and version=?
#Caused by: javax.persistence.RollbackException: Error while committing the transaction
#  at org.hibernate.internal.ExceptionConverterImpl.convertCommitException(ExceptionConverterImpl.java:81)
#Caused by: javax.persistence.OptimisticLockException: Batch update returned unexpected row count from update [0]; actual row count: 0; expected: 1; statement executed: HikariProxyPreparedStatement@2007595039 wrapping sql : '/* update com.tocktix.model.entities.TicketGroupEntity */ update ticket_group set updated_at=?, version=?, service_type=? where id=? and version=?', parameters : [null,null,null,null,null]
./run_importer.sh -e prod -b 15152 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:106}"

#03:24:48.098 [main] INFO  com.tocktix.dataimport.ImportHelper  - Inserting Chunk 115/169 with 1000 guests, 1020 reservations, 0 waitlists, for businessId 15152
#03:24:54.292 [main] ERROR org.hibernate.engine.jdbc.batch.internal.BatchingBatch  - HHH000315: Exception executing batch [java.sql.BatchUpdateException: (conn=129249) Deadlock found when trying to get lock; try restarting transaction], SQL: /* update com.tocktix.model.entities.VisitEntity */ update visit set updated_at=?, version=?, table_name=? where id=? and version=?
#03:24:54.292 [main] WARN  org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - SQL Error: 1213, SQLState: 40001
#03:24:54.292 [main] ERROR org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - (conn=129249) Deadlock found when trying to get lock; try restarting transaction
./run_importer.sh -e prod -b 15152 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:115}"
#03:33:12.435 [main] INFO  com.tocktix.dataimport.ImportHelper  - Inserting Chunk 152/169 with 1000 guests, 900 reservations, 0 waitlists, for businessId 15152
#03:33:18.163 [main] ERROR org.hibernate.engine.jdbc.batch.internal.BatchingBatch  - HHH000315: Exception executing batch [java.sql.BatchUpdateException: (conn=129448) Deadlock found when trying to get lock; try restarting transaction], SQL: /* update com.tocktix.model.entities.PurchaseEntity */ update purchase set updated_at=?, version=?, original_purchase_id=? where id=? and version=?
#03:33:18.163 [main] WARN  org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - SQL Error: 1213, SQLState: 40001
#03:33:18.164 [main] ERROR org.hibernate.engine.jdbc.spi.SqlExceptionHelper  - (conn=129448) Deadlock found when trying to get lock; try restarting transaction
./run_importer.sh -e prod -b 15152 -g ../../osteria_resos_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false, resumeFromChunkId:152}"


./run_importer.sh -e prod -b 15152 -g ../../osteria_guests_demo.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER_GUESTS_ONLY,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: M_D_YY, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------------------------------------------

# LUCA
update business set is_importing=1 where id=14076;
select * from business where id=14076;

./run_importer.sh -e prod -b 14076 -g ../../luca_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------------------------------------------

# MIZUNA
update business set is_importing=1 where id=14782;
select * from business where id=14782;

./run_importer.sh -e prod -b 14782 -g ../../mizuna_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------------------------------------------

# RUSSELS
update business set is_importing=1 where id=15161;
select * from business where id=15161;

./run_importer.sh -e prod -b 15161 -g ../../russels_prod.csv -r ../../empty.txt -c "{formatVersion:OPENTABLE_GUESTCENTER,separator:',', resoDateFormat:YYYY_M_D_DASH,resoTimeFormat:H_M_A, guestDateFormat: YYYY_M_D_DASH, quoteDetectionEnabled: false, smsReminderEnabled: false}"

# ------------------------------------------------------------------------------------

update business set is_importing=0 where business_group_id=9953;
select * from business where business_group_id=9953;

# ------------------------------------------------------------------------------------
