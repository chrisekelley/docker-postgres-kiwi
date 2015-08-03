 -- createuser --no-superuser --createdb --no-createrole kiwiprints
CREATE USER kiwiprints NOSUPERUSER CREATEDB;
CREATE DATABASE kiwiprints OWNER kiwiprints; 
\c kiwiprints kiwiprints;
CREATE TABLE since_checkpoints
    (
      pgtable text NOT NULL,
      since numeric DEFAULT 0,
      enabled boolean DEFAULT false, --not used in the simple client example
      CONSTRAINT since_checkpoint_pkey PRIMARY KEY (pgtable)
    );

    CREATE TABLE couchdocs
    (
      id text NOT NULL,
      doc jsonb,
      CONSTRAINT couchdocs_pkey PRIMARY KEY (id)
    );
-- Create logs table:

    CREATE TABLE logs (_id text, _rev text, uuid text, error text, model text, cordova text, message text, version text, 
    platform text, timestamp text, collection text);

   -- Create indiv_reg table - note I had to change user to savedBy - user is a reserved word in postgres.

    CREATE TABLE indiv_reg (_id text, _rev text, District text, Gender text, DOB text, registrationLocation text, 
    previouslyRegisterredNowOffline text, question text, collection text, createdAt timestamp, lastModifiedAt timestamp, 
    complete text, currentDistrict text, savedBy text,
    CONSTRAINT indiv_reg_pkey PRIMARY KEY (_id));
    
   -- Create trichiasis table - note I had to change user to savedBy - user is a reserved word in postgres.

    CREATE TABLE trichiasis (_id text,_rev text,question text,collection text,createdAt timestamp,lastModifiedAt timestamp,serviceLocation text,
    DateOfVisit text,TimeOfVisit text,RefusedSurgeryL text,ProvidedEpilationConsultationL text,visualAcuityL text,
    countLashesTouchingEyeballL text,evidenceOfEpilationL text,photographPreOpL text,cataractL text,cornealOpacityL text,
    acceptedSurgeryL text,TypeofOperationL text,ClampusedL text,SutureTypeL text,ExcessbleedingL text,MarginfragmantseveredL text,
    GlobePunctureL text,ComplicationsReferralL text,ReferralHospitalL text,RefusedSurgeryR text,ProvidedEpilationConsultationR text,
    visualAcuityR text,countLashesTouchingEyeballR text,evidenceOfEpilationR text,photographPreOpR text,cataractR text,
    cornealOpacityR text,acceptedSurgeryR text,TypeofOperationR text,ClampusedR text,SutureTypeR text,ExcessbleedingR text,
    MarginfragmantseveredR text,GlobePunctureR text,ComplicationsReferralR text,ReferralHospitalR text,complete text,
    currentDistrict text,savedBy text,clientId text,latitude double precision,longitude double precision, gps_timestamp timestamp,
    CONSTRAINT trichiasis_pkey PRIMARY KEY (_id));
    
   -- Create Post-Operative Followup

    CREATE TABLE post_operative_followup (_id text,_rev text,question text,collection text,createdAt timestamp,lastModifiedAt timestamp,serviceLocation text,
    DateOfVisit text,TimeOfVisit text,CompletedTreatment boolean, ComplicationsReferralR  boolean, Complicationsrefertoclinichospital  boolean,
    Continuemonitoring boolean, Followupdate text,Nameofprocedurebeingfollowed text,Recurrence boolean,
    ReferralHospitalR text,complete  boolean, currentDistrict text,savedBy text,clientId text,latitude double precision,longitude double precision, 
    gps_timestamp timestamp,
    CONSTRAINT post_operative_followup_pkey PRIMARY KEY (_id));
    
   -- Create Post-Operative Epilation

    CREATE TABLE post_operative_epilation (_id text,_rev text,question text,collection text,createdAt timestamp,lastModifiedAt timestamp,serviceLocation text,
    DateOfVisit text,TimeOfVisit text,
    adviceForSurgeryL text,adviceForSurgeryR text,cornealOpacityL text,cornealOpacityR text,countLashesTouchingEyeballL text,countLashesTouchingEyeballR text,
            Observations text,visualAcuityL text,visualAcuityR text,
    complete  boolean, currentDistrict text,savedBy text,clientId text,latitude double precision,longitude double precision, 
    gps_timestamp timestamp,
    CONSTRAINT post_operative_epilation_pkey PRIMARY KEY (_id));
    
   -- Create Post-Operative Followup 1 day

    CREATE TABLE post_operative_followup_1day (_id text,_rev text,question text,collection text,createdAt timestamp,lastModifiedAt timestamp,serviceLocation text,
    DateOfVisit text,TimeOfVisit text,
    azithromycinR boolean, tetracyclineEyeOintmentR boolean,
    complete  boolean, currentDistrict text,savedBy text,clientId text,latitude double precision,longitude double precision, 
    gps_timestamp timestamp,
    CONSTRAINT post_operative_followup_1day_pkey PRIMARY KEY (_id));
    
   -- Create Post-Operative Followup 3_6_months

    CREATE TABLE post_operative_followup_3_6_months (_id text,_rev text,question text,collection text,createdAt timestamp,lastModifiedAt timestamp,serviceLocation text,
    DateOfVisit text,TimeOfVisit text,
    countLashesTouchingEyeballL text,countLashesTouchingEyeballR text,outcomeL text,outcomeR text,patientDevelopedTrichiasisL boolean,patientDevelopedTrichiasisR boolean,
    complete boolean, currentDistrict text,savedBy text,clientId text,latitude double precision,longitude double precision, 
    gps_timestamp timestamp,
    CONSTRAINT postopefollowup_3_6months_pkey PRIMARY KEY (_id));
    
   -- Create Post-Operative Followup 7_14_days

    CREATE TABLE post_operative_followup_7_14_days (_id text,_rev text,question text,collection text,createdAt timestamp,lastModifiedAt timestamp,serviceLocation text,
    DateOfVisit text,TimeOfVisit text,
    defectsEyelidL boolean,defectsEyelidR boolean,granulomaExcisionL boolean,granulomaExcisionR boolean,
    granulomaL boolean,granulomaR boolean,infectionL boolean,infectionR boolean,numberReturnInDaysMonthsL text,numberReturnInDaysMonthsR text,
    referredToHospitalL boolean,referredToHospitalR boolean,referredToHospitalTextL text,referredToHospitalTextR text,
    removalOfSuturesL boolean,removalOfSuturesR boolean,returnForFollowupL boolean,returnForFollowupR boolean,returnInDaysMonthsL text,
    returnInDaysMonthsR text,subCorrectionL boolean,subCorrectionR boolean, 
    complete boolean, currentDistrict text,savedBy text,clientId text,latitude double precision,longitude double precision, 
    gps_timestamp timestamp,
    CONSTRAINT post_operative_followup_7_14_days_pkey PRIMARY KEY (_id));
