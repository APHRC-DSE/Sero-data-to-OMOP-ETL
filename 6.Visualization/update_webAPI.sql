#INSERT A POINTER TO THE OMOP DATABASE INSTANCE


INSERT INTO webapi.source (source_id, source_name, source_key, source_connection, source_dialect,is_cache_enabled) 
SELECT nextval('webapi.source_sequence'), 'CDM APHRC Nairobi Urban HDSS', 'APHRC_NUHDSS_V1', ' jdbc:postgresql://broadsea-atlasdb:5432/postgres?user=postgres&password=mypass ', 'postgresql',
true;


# LINK THE OMOP CDM, VOCABULARY AND RESULTS SCHEMAS TO ATLAS THROUGH WEBAPI 


INSERT INTO webapi.source_daimon (source_daimon_id, source_id, daimon_type, table_qualifier, priority) 
SELECT nextval('webapi.source_daimon_sequence'), source_id, 0, 'cdm', 0
FROM webapi.source
WHERE source_key = 'APHRC_NUHDSS_V1' 

INSERT INTO webapi.source_daimon (source_daimon_id, source_id, daimon_type, table_qualifier, priority)
SELECT nextval('webapi.source_daimon_sequence'), source_id, 1, 'vocab', 10
FROM webapi.source
WHERE source_key = 'APHRC_NUHDSS_V1'

INSERT INTO webapi.source_daimon (source_daimon_id, source_id, daimon_type, table_qualifier, priority)
SELECT nextval('webapi.source_daimon_sequence'), source_id, 2, 'results', 0
FROM webapi.source
WHERE source_key = 'APHRC_NUHDSS_V1'


# http://127.0.0.1/WebAPI/source/refresh
