#Generate results tables using Achilles
library(Achilles)

connectionDetails <- createConnectionDetails(dbms="postgres", server="localhost", user="postgres",
                                             password='mypass', schema="demo_cdm", port="5439")

connectionDetails <- createConnectionDetails(dbms="postgresql", server="localhost", user="postgres",
                                             password='mypass', port="5439",schema=NULL)


connectionDetails <- createConnectionDetails(
  dbms = "postgresql",
  server = "172.21.0.6/postgres",
  user = "postgres",
  password = "mypass",
  pathToDriver = "/home/mochola/OHDSI/" 
)


Achilles::achilles(
  cdmVersion = "5.4",
  connectionDetails = connectionDetails,
  cdmDatabaseSchema = "cdm_aphrc_covid",
  resultsDatabaseSchema = "results_aphrc_covid"
)


#http://127.0.0.1/WebAPI/ddl/results?dialect=postgresql&schema=results_aphrc_covid&vocabSchema=demo_cdm&tempSchema=tmp&initConceptHierarchy=true
#https://github.com/OHDSI/WebAPI/wiki/CDM-Configuration
#https://www.rdocumentation.org/packages/Achilles/versions/1.3
#https://jdbc.postgresql.org/download/
#https://github.com/OHDSI/Tutorial-ETL/blob/master/materials/Achilles/achillesRun.R