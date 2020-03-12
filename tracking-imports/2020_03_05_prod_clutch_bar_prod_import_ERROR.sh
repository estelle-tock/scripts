robinanil@crawl-server:~/importer/server$ ./import_configuration.sh prod 8717 3159.demo.proto
+ set -e
+ echo 'prod 8717 3159.demo.proto'
prod 8717 3159.demo.proto
+ env=prod
+ businessId=8717
+ cp prod.env.flags prod.publish.env.flags
+ echo --publish_entity_changes=true
+ java -Xmx2G -Dlog4j.configuration=logging-dev.properties -Dsun.net.inetaddr.ttl=60 -jar build/libs/cron.jar @prod.publish.env.flags com.tocktix.cron.dataimport.ImportConfiguration --businessId=8717 --input_file=/home/robinanil/config/3159.demo.proto --import_tables=true --import_services=true --import_hours=true
19:58:32.713 [main] INFO  com.tocktix.process.ProcessLauncher  - --braintree_environment=PRODUCTION
19:58:32.715 [main] INFO  com.tocktix.process.ProcessLauncher  - --braintree_merchant_id=5qyd3bththznxwf2
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --db_host=db-prod-primary-0,db-prod-primary-1,db-prod-primary-2
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --db_schema=tock_prod
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --db_user=tock_cron5
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --events_db_schema=tock_events_prod
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --events_db_user=tock_cron4
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --db_slave_host=db-prod-secondary-0
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --kafka_broker_list=kafka-prod-1:9092,kafka-prod-2:9092,kafka-prod-0:9092
19:58:32.716 [main] INFO  com.tocktix.process.ProcessLauncher  - --kafka_exchange_log_topic_suffix=_ex_logs
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --restrict_emails_to_tock=false
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --salesforce_username=reports@tockhq.com
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --salesforce_auth_endpoint=https://login.salesforce.com/services/Soap/u/41.0
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --salesforce_service_endpoint=https://login.salesforce.com/services/Soap/u/41.0
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --salesforce_partner_auth_endpoint=https://login.salesforce.com/services/Soap/u/41.0
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --salesforce_partner_service_endpoint=https://login.salesforce.com/services/Soap/u/41.0
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --send_emails=true
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --send_kafka_exchange_logs=true
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --server_env=PROD
19:58:32.717 [main] INFO  com.tocktix.process.ProcessLauncher  - --num_async_threads=32
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --index_entities=false
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --entity_index_name=prod-entity-index
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --elasticsearch_hosts=elastic-prod-0,elastic-prod-1,elastic-prod-2,elastic-prod-3,elastic-prod-4
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --logs_elasticsearch_hosts=es-logs-58lm,es-logs-6wmf,es-logs-rj1n
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --github_username=eng-tock
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --payout_sftp_hostname=sftp.tradinggrid.gxs.com
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --restrict_texting=NO_RESTRICTION
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --paytronix_client_id=MD3co37mM4f_I3JCSwN2JKIvARehxmRAxWyrYaytbK
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --paytronix_environment=PRODUCTION
19:58:32.718 [main] INFO  com.tocktix.process.ProcessLauncher  - --paytronix_merchant_id=235
19:58:32.719 [main] INFO  com.tocktix.process.ProcessLauncher  - --publish_entity_changes=true
19:58:33.189 [main] INFO  com.tocktix.process.ProcessLauncher  - No additional modules specified, com.tocktix.cron.dataimport.ImportConfiguration.getModules(com.tocktix.environment.EnvironmentOptions), skipping...
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by com.google.inject.internal.cglib.core.$ReflectUtils$1 (file:/home/robinanil/importer/server/build/libs/apiserver-all.jar) to method java.lang.ClassLoader.defineClass(java.lang.String,byte[],int,int,java.security.ProtectionDomain)
WARNING: Please consider reporting this to the maintainers of com.google.inject.internal.cglib.core.$ReflectUtils$1
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
19:58:33.946 [main] INFO  com.tocktix.util.ClassPaths  - ClassPaths scanned in 448ms
19:58:37.784 [main] INFO  com.tocktix.proto.ProtoUtils  - Protos initialized in 4288ms
19:58:40.098 [pool-5-thread-3] INFO  org.hibernate.jpa.internal.util.LogHelper  - HHH000204: Processing PersistenceUnitInfo [name: com.tocktix.jpa.entities]
19:58:40.105 [pool-5-thread-1] INFO  org.hibernate.jpa.internal.util.LogHelper  - HHH000204: Processing PersistenceUnitInfo [name: com.tocktix.jpa.events]
19:58:40.105 [pool-5-thread-2] INFO  org.hibernate.jpa.internal.util.LogHelper  - HHH000204: Processing PersistenceUnitInfo [name: com.tocktix.jpa.entities]
19:58:40.262 [pool-5-thread-2] INFO  org.hibernate.Version  - HHH000412: Hibernate ORM core version Local
19:58:40.463 [pool-5-thread-2] INFO  org.hibernate.annotations.common.Version  - HCANN000001: Hibernate Commons Annotations {5.1.0.Final}
19:59:00.734 [pool-5-thread-1] INFO  org.hibernate.dialect.Dialect  - HHH000400: Using dialect: org.hibernate.dialect.MySQLDialect
19:59:00.827 [pool-5-thread-3] INFO  org.hibernate.dialect.Dialect  - HHH000400: Using dialect: org.hibernate.dialect.MySQLDialect
19:59:00.830 [pool-5-thread-2] INFO  org.hibernate.dialect.Dialect  - HHH000400: Using dialect: org.hibernate.dialect.MySQLDialect
19:59:08.791 [pool-5-thread-1] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTicketTypeTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.792 [pool-5-thread-3] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTicketTypeTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.794 [pool-5-thread-2] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTicketTypeTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.808 [pool-5-thread-3] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchaseEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.808 [pool-5-thread-1] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchaseEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.808 [pool-5-thread-2] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchaseEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.865 [pool-5-thread-1] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronDestinationIds; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.866 [pool-5-thread-1] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronHospitalityPreferences; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.866 [pool-5-thread-1] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronCuisines; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.866 [pool-5-thread-1] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronDietaryRestrictions; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.869 [pool-5-thread-3] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronCuisines; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.869 [pool-5-thread-3] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronDietaryRestrictions; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.869 [pool-5-thread-3] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronDestinationIds; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.869 [pool-5-thread-3] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronHospitalityPreferences; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.912 [pool-5-thread-2] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronDestinationIds; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.918 [pool-5-thread-2] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronDietaryRestrictions; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.918 [pool-5-thread-2] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronHospitalityPreferences; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.918 [pool-5-thread-2] ERROR org.hibernate.metamodel.internal.MetadataContext  - HHH015007: Illegal argument on static metamodel field injection : com.tocktix.model.entities.PatronProfileEntity_Generated_#patronCuisines; expected type :  org.hibernate.metamodel.model.domain.internal.SingularAttributeImpl; encountered type : javax.persistence.metamodel.ListAttribute
19:59:08.931 [pool-5-thread-2] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTicketOptionTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.931 [pool-5-thread-3] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTicketOptionTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.931 [pool-5-thread-1] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTicketOptionTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.942 [pool-5-thread-2] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.BusinessTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.943 [pool-5-thread-3] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.BusinessTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.952 [pool-5-thread-2] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.BusinessDetailsEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.954 [pool-5-thread-3] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.BusinessDetailsEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.954 [pool-5-thread-1] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.BusinessTaxEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.955 [pool-5-thread-1] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.BusinessDetailsEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.957 [pool-5-thread-3] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTaxLineItemEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.957 [pool-5-thread-1] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTaxLineItemEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.961 [pool-5-thread-2] WARN  org.hibernate.metamodel.internal.MetadataContext  - HHH015011: Unable to locate static metamodel field : com.tocktix.model.entities.PurchasedTaxLineItemEntity_Generated_#taxPercent; this may or may not indicate a problem with the static metamodel
19:59:08.978 [pool-5-thread-1] INFO  org.hibernate.engine.jdbc.connections.internal.ConnectionProviderInitiator  - HHH000130: Instantiating explicit connection provider: org.hibernate.hikaricp.internal.HikariCPConnectionProvider
19:59:08.979 [pool-5-thread-2] INFO  org.hibernate.engine.jdbc.connections.internal.ConnectionProviderInitiator  - HHH000130: Instantiating explicit connection provider: org.hibernate.hikaricp.internal.HikariCPConnectionProvider
19:59:08.979 [pool-5-thread-3] INFO  org.hibernate.engine.jdbc.connections.internal.ConnectionProviderInitiator  - HHH000130: Instantiating explicit connection provider: org.hibernate.hikaricp.internal.HikariCPConnectionProvider
19:59:08.991 [pool-5-thread-3] INFO  com.zaxxer.hikari.HikariDataSource  - slave-reporting - Starting...
19:59:08.995 [pool-5-thread-2] INFO  com.zaxxer.hikari.HikariDataSource  - entities - Starting...
19:59:08.995 [pool-5-thread-1] INFO  com.zaxxer.hikari.HikariDataSource  - events - Starting...
19:59:09.121 [pool-5-thread-2] INFO  com.zaxxer.hikari.HikariDataSource  - entities - Start completed.
19:59:09.122 [pool-5-thread-3] INFO  com.zaxxer.hikari.HikariDataSource  - slave-reporting - Start completed.
19:59:09.121 [pool-5-thread-1] INFO  com.zaxxer.hikari.HikariDataSource  - events - Start completed.
19:59:09.137 [pool-5-thread-3] INFO  org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator  - HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
19:59:09.149 [pool-5-thread-1] INFO  org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator  - HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
19:59:09.150 [pool-5-thread-2] INFO  org.hibernate.engine.transaction.jta.platform.internal.JtaPlatformInitiator  - HHH000490: Using JtaPlatform implementation: [org.hibernate.engine.transaction.jta.platform.internal.NoJtaPlatform]
19:59:10.387 [main] INFO  com.tocktix.process.ProcessLauncher  - Launching com.tocktix.cron.dataimport.ImportConfiguration
19:59:10.578 [main] INFO  com.tocktix.cron.dataimport.ImportConfiguration  - Import configuration from /home/robinanil/config/3159.demo.proto to business with id: 8717 and name: Clutch Bar in environment: DEMO
19:59:11.087 [main] INFO  com.tocktix.process.ProcessLauncher  - Took 0s
19:59:11.088 [main] INFO  com.tocktix.process.ProcessLauncher  - Nothing to shut down com.tocktix.cron.dataimport.ImportConfiguration.shutdown(com.google.inject.Injector,com.tocktix.environment.EnvironmentOptions), skipping...
19:59:11.089 [main] INFO  com.tocktix.process.ProcessLauncher  - Waiting for executor tasks to finish...
19:59:11.099 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.107 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.112 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
    at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.119 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.127 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.139 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.157 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.185 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.230 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.300 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.412 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.592 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:11.883 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:12.352 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:13.108 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:14.331 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:16.308 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:19.504 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:24.674 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
^C19:59:25.093 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - Shutting down...
19:59:25.093 [Thread-1] INFO  com.tocktix.process.ProcessLauncher  - Waiting for executor tasks to finish...
19:59:25.099 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 34 kafka-producer-network-thread | producer-1 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.kafka.common.network.Selector.select(Selector.java:794)
    app//org.apache.kafka.common.network.Selector.poll(Selector.java:467)
    app//org.apache.kafka.clients.NetworkClient.poll(NetworkClient.java:539)
    app//org.apache.kafka.clients.producer.internals.Sender.runOnce(Sender.java:335)
    app//org.apache.kafka.clients.producer.internals.Sender.run(Sender.java:244)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 45 SIGINT handler WAITING
    java.base@12/java.lang.Object.wait(Native Method)
    java.base@12/java.lang.Thread.join(Thread.java:1308)
    java.base@12/java.lang.Thread.join(Thread.java:1375)
    java.base@12/java.lang.ApplicationShutdownHooks.runHooks(ApplicationShutdownHooks.java:107)
    java.base@12/java.lang.ApplicationShutdownHooks$1.run(ApplicationShutdownHooks.java:46)
    java.base@12/java.lang.Shutdown.runHooks(Shutdown.java:130)
    java.base@12/java.lang.Shutdown.exit(Shutdown.java:174)
    java.base@12/java.lang.Terminator$1.handle(Terminator.java:51)
    java.base@12/jdk.internal.misc.Signal$1.run(Signal.java:220)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 26 I/O dispatcher 13 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 13 pool-3-thread-1 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor.execute(AbstractMultiworkerIOReactor.java:343)
    app//org.apache.http.impl.nio.conn.PoolingNHttpClientConnectionManager.execute(PoolingNHttpClientConnectionManager.java:221)
    app//org.apache.http.impl.nio.client.CloseableHttpAsyncClientBase$1.run(CloseableHttpAsyncClientBase.java:64)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 1 main TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(AbstractQueuedSynchronizer.java:2123)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.awaitTermination(ThreadPoolExecutor.java:1454)
    app//com.codahale.metrics.InstrumentedExecutorService.awaitTermination(InstrumentedExecutorService.java:163)
    app//com.tocktix.process.ProcessLauncher.shutdownInjector(ProcessLauncher.java:195)
    app//com.tocktix.process.ProcessLauncher.runWithEnvironmentArgs(ProcessLauncher.java:166)
    app//com.tocktix.process.ProcessLauncher.runFromCommandLineOptions(ProcessLauncher.java:130)
    app//com.tocktix.process.ProcessLauncher.main(ProcessLauncher.java:74)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 15 I/O dispatcher 2 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 23 I/O dispatcher 10 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.100 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 12 Connection evictor TIMED_WAITING
    java.base@12/java.lang.Thread.sleep(Native Method)
    app//org.apache.http.impl.client.IdleConnectionEvictor$1.run(IdleConnectionEvictor.java:66)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 35 events housekeeper TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(AbstractQueuedSynchronizer.java:2123)
    java.base@12/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:1182)
    java.base@12/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:899)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1054)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1114)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 37 entities housekeeper TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(AbstractQueuedSynchronizer.java:2123)
    java.base@12/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:1182)
    java.base@12/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:899)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1054)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1114)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 22 I/O dispatcher 9 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 2 Reference Handler RUNNABLE
    java.base@12/java.lang.ref.Reference.waitForReferencePendingList(Native Method)
    java.base@12/java.lang.ref.Reference.processPendingReferences(Reference.java:241)
    java.base@12/java.lang.ref.Reference$ReferenceHandler.run(Reference.java:213)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 21 I/O dispatcher 8 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 32 pool-5-thread-2 TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.SynchronousQueue$TransferStack.awaitFulfill(SynchronousQueue.java:462)
    java.base@12/java.util.concurrent.SynchronousQueue$TransferStack.transfer(SynchronousQueue.java:361)
    java.base@12/java.util.concurrent.SynchronousQueue.poll(SynchronousQueue.java:937)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1053)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1114)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 4 Signal Dispatcher RUNNABLE
    
19:59:25.101 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 27 I/O dispatcher 14 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.102 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 28 I/O dispatcher 15 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.102 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 44 requests-async-pool-2 TIMED_WAITING
    java.base@12/java.lang.Thread.sleep(Native Method)
    app//com.github.rholder.retry.BlockStrategies$ThreadSleepStrategy.block(BlockStrategies.java:46)
    app//com.github.rholder.retry.Retryer.call(Retryer.java:178)
    app//com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
    app//com.tocktix.integration.redis.RedisModule$$Lambda$554/0x0000000801e4b440.call(Unknown Source)
    app//com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
    app//com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
    app//com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
    app//com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.102 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 20 I/O dispatcher 7 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.103 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 24 I/O dispatcher 11 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.103 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 14 I/O dispatcher 1 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.103 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 33 pool-5-thread-3 TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.SynchronousQueue$TransferStack.awaitFulfill(SynchronousQueue.java:462)
    java.base@12/java.util.concurrent.SynchronousQueue$TransferStack.transfer(SynchronousQueue.java:361)
    java.base@12/java.util.concurrent.SynchronousQueue.poll(SynchronousQueue.java:937)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1053)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1114)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.103 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 36 slave-reporting housekeeper TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(AbstractQueuedSynchronizer.java:2123)
    java.base@12/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:1182)
    java.base@12/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(ScheduledThreadPoolExecutor.java:899)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1054)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1114)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.103 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 3 Finalizer WAITING
    java.base@12/java.lang.Object.wait(Native Method)
    java.base@12/java.lang.ref.ReferenceQueue.remove(ReferenceQueue.java:155)
    java.base@12/java.lang.ref.ReferenceQueue.remove(ReferenceQueue.java:176)
    java.base@12/java.lang.ref.Finalizer$FinalizerThread.run(Finalizer.java:170)
19:59:25.103 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 25 I/O dispatcher 12 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 10 Common-Cleaner TIMED_WAITING
    java.base@12/java.lang.Object.wait(Native Method)
    java.base@12/java.lang.ref.ReferenceQueue.remove(ReferenceQueue.java:155)
    java.base@12/jdk.internal.ref.CleanerImpl.run(CleanerImpl.java:148)
    java.base@12/java.lang.Thread.run(Thread.java:835)
    java.base@12/jdk.internal.misc.InnocuousThread.run(InnocuousThread.java:134)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 16 I/O dispatcher 3 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 41 Thread-0 RUNNABLE
    java.base@12/java.lang.Thread.dumpThreads(Native Method)
    java.base@12/java.lang.Thread.getAllStackTraces(Thread.java:1653)
    app//com.tocktix.process.ProcessUtils.shutdown(ProcessUtils.java:16)
    app//com.tocktix.process.ProcessLauncher$$Lambda$483/0x0000000801b9d040.run(Unknown Source)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 31 pool-5-thread-1 TIMED_WAITING
    java.base@12/jdk.internal.misc.Unsafe.park(Native Method)
    java.base@12/java.util.concurrent.locks.LockSupport.parkNanos(LockSupport.java:235)
    java.base@12/java.util.concurrent.SynchronousQueue$TransferStack.awaitFulfill(SynchronousQueue.java:462)
    java.base@12/java.util.concurrent.SynchronousQueue$TransferStack.transfer(SynchronousQueue.java:361)
    java.base@12/java.util.concurrent.SynchronousQueue.poll(SynchronousQueue.java:937)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.getTask(ThreadPoolExecutor.java:1053)
    java.base@12/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1114)
    java.base@12/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 18 I/O dispatcher 5 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 19 I/O dispatcher 6 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.104 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 29 I/O dispatcher 16 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.105 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 42 Thread-1 TIMED_WAITING
    app//org.apache.log4j.Category.callAppenders(Category.java:208)
    app//org.apache.log4j.Category.forcedLog(Category.java:391)
    app//org.apache.log4j.Category.log(Category.java:856)
    app//org.slf4j.log4j12.Log4jLoggerAdapter.info(Log4jLoggerAdapter.java:305)
    app//com.tocktix.process.ProcessLauncher.shutdownInjector(ProcessLauncher.java:185)
    app//com.tocktix.process.ProcessLauncher.lambda$runWithEnvironmentArgs$2(ProcessLauncher.java:157)
    app//com.tocktix.process.ProcessLauncher$$Lambda$484/0x0000000801b9d840.run(Unknown Source)
    java.base@12/java.lang.Thread.run(Thread.java:835)
19:59:25.105 [Thread-0] INFO  com.tocktix.process.ProcessUtils  - 17 I/O dispatcher 4 RUNNABLE
    java.base@12/sun.nio.ch.EPoll.wait(Native Method)
    java.base@12/sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:120)
    java.base@12/sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:124)
    java.base@12/sun.nio.ch.SelectorImpl.select(SelectorImpl.java:136)
    app//org.apache.http.impl.nio.reactor.AbstractIOReactor.execute(AbstractIOReactor.java:255)
    app//org.apache.http.impl.nio.reactor.BaseIOReactor.execute(BaseIOReactor.java:104)
    app//org.apache.http.impl.nio.reactor.AbstractMultiworkerIOReactor$Worker.run(AbstractMultiworkerIOReactor.java:591)
    java.base@12/java.lang.Thread.run(Thread.java:835)
^C^C^C^C^C19:59:33.038 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
19:59:46.571 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
20:00:08.465 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
20:00:43.889 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more


^C^C^C^C^C^C^C20:01:41.205 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
20:03:13.943 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more
20:05:13.946 [requests-async-pool-2] WARN  com.tocktix.logging.RetryExceptionLogger  - Retryer exception: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
com.google.inject.ProvisionException: Unable to provision, see the following errors:

1) Error in custom provider, java.lang.NullPointerException
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:59) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating java.util.List<io.lettuce.core.RedisURI>
    for the 1st parameter of com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93)
  at com.tocktix.integration.redis.RedisModule.providePubSubConnection(RedisModule.java:93) (via modules: com.tocktix.pubsub.PubSubModule -> com.tocktix.integration.redis.RedisModule)
  while locating io.lettuce.core.pubsub.StatefulRedisPubSubConnection<java.lang.String, com.tocktix.lib.GenericMessageProto$GenericMessage>

1 error
  at com.google.inject.internal.InternalProvisionException.toProvisionException(InternalProvisionException.java:226)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1053)
  at com.github.rholder.retry.AttemptTimeLimiters$NoAttemptTimeLimit.call(AttemptTimeLimiters.java:78)
  at com.github.rholder.retry.Retryer.call(Retryer.java:160)
  at com.tocktix.integration.redis.RedisModule.lambda$provideFutureRedisPublishingClient$3(RedisModule.java:120)
  at com.google.common.util.concurrent.TrustedListenableFutureTask$TrustedFutureInterruptibleTask.runInterruptibly(TrustedListenableFutureTask.java:125)
  at com.google.common.util.concurrent.InterruptibleTask.run(InterruptibleTask.java:69)
  at com.google.common.util.concurrent.TrustedListenableFutureTask.run(TrustedListenableFutureTask.java:78)
  at com.codahale.metrics.InstrumentedExecutorService$InstrumentedRunnable.run(InstrumentedExecutorService.java:181)
  at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
  at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
  at java.base/java.lang.Thread.run(Thread.java:835)
Caused by: java.lang.NullPointerException
  at com.google.common.base.Preconditions.checkNotNull(Preconditions.java:878)
  at com.google.common.base.Splitter.splitToList(Splitter.java:412)
  at com.tocktix.integration.redis.RedisModule.provideRedisUris(RedisModule.java:60)
  at com.tocktix.integration.redis.RedisModule$$FastClassByGuice$$a169db9f.invoke(<generated>)
  at com.google.inject.internal.ProviderMethod$FastClassProviderMethod.doProvision(ProviderMethod.java:264)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.SingleParameterInjector.inject(SingleParameterInjector.java:42)
  at com.google.inject.internal.SingleParameterInjector.getAll(SingleParameterInjector.java:65)
  at com.google.inject.internal.ProviderMethod.doProvision(ProviderMethod.java:173)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.provision(InternalProviderInstanceBindingImpl.java:185)
  at com.google.inject.internal.InternalProviderInstanceBindingImpl$CyclicFactory.get(InternalProviderInstanceBindingImpl.java:162)
  at com.google.inject.internal.InjectorImpl$1.get(InjectorImpl.java:1050)
  ... 10 more