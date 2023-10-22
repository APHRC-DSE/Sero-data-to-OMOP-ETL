# Sero-data-to-OMOP-ETL


This repository contains code, data and information to pipeline data from APHRC microdata source to an OMOP database

**STEPS FOLLOWED**

1. Profiling and Exploratory data analysis:

White Rabbit and R used to profile and generate scan report and EDA.
Check the link for the EDA
https://docs.google.com/spreadsheets/d/1h6A-uOf4lrWZMCKhoNzSkktMv10lhgM7SH-CcmCHgZo/edit#gid=0

2. Mapping and Implementation Guides:

Rabbit in a hat, Athena and Usagi tools were used to create mappings from source data to OMOP terminologies

3. Extract Transform Load :

We used PostgreSQL as OMOP instance database. Penataho and SQL scripts for transforming source codes to OMOP terminologies.

4. Data Quality Assurance:

OHDSI library for quality assurance of the CDM 'DataQualityDashboard' was installed and run against the OMOP database resulting in 98% score 

5. Generating Aggregated (Results tables) data for Atlas using Achilles R library by OHDSI for data characterization tool.

6. Visualization in Atlas :

Aggregated data(results tables), OMOP tables and vocabulary tables were integrated with Atlas and webAPI.

https://github.com/OHDSI/WebAPI/wiki/CDM-Configuration

7. Migration to OHDSIonAWS:

Aggregated data migrated to AWS simple storage service (S3) and then to AWS Redshift database and later linked to AWS Atlas for wider audience based on access level. 
