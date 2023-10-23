
library(DataQualityDashboard)

connectionDetails <- createConnectionDetails(
  dbms = "postgresql",
  server = "localhost/postgres",
  user = "postgres",
  password = "mypass",
  pathToDriver = "~/OHDSI/" 
)

#Setting up the variable

library(DataQualityDashboard)
cdmDatabaseSchema <- "cdm_aphrc_covid" 
resultsDatabaseSchema <- "results_aphrc_covid" 
cdmSourceName <- "CDM APHRC Nairobi Urban HDSS" 
numThreads <- 1 # on Redshift, 3 seems to work well
sqlOnly <- FALSE # set to TRUE if you just want to get the SQL scripts and not actually run the queries
outputFolder <- "output"
verboseMode <- TRUE # set to TRUE if you want to see activity written to the console
writeToTable <- TRUE # set to FALSE if you want to skip writing to results table
checkLevels <- c("TABLE", "FIELD", "CONCEPT")
checkNames <- c() #Names can be found in inst/csv/OMOP_CDM_v5.3.1_Check_Desciptions.csv




# Running the actual DQD
DataQualityDashboard::executeDqChecks(connectionDetails = connectionDetails, 
                                      cdmDatabaseSchema = cdmDatabaseSchema, 
                                      resultsDatabaseSchema = resultsDatabaseSchema,
                                      cdmSourceName = cdmSourceName, 
                                      numThreads = numThreads,
                                      sqlOnly = sqlOnly, 
                                      outputFolder = outputFolder, 
                                      verboseMode = verboseMode,
                                      writeToTable = writeToTable,
                                      checkLevels = checkLevels,
                                      checkNames = checkNames)


ParallelLogger::launchLogViewer(logFileName = file.path(outputFolder, cdmSourceName, 
                                                        sprintf('log_DqDashboard_Synthea synthetic health database.txt', cdmSourceName)))


DataQualityDashboard::viewDqDashboard(file.path("~/OHDSI/Broadsea/output/aphrc_nuhdss_v1-20231012170847.json"))


