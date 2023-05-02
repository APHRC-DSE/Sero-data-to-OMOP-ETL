# ETL for care_site and location

# simple script to insert csvs to the cdm database table
import psycopg2
import pandas as pd
from sqlalchemy import create_engine, text
# postgres or idsr_synthetic
engine = create_engine('postgresql+psycopg2://postgres:abisa1989@localhost:5432/HDSS')


def Write_csv_to_postgresDB(path_to_csv_file, tablename, engine = engine, schema = 'staging'):
    conn = engine.connect()
    df = pd.read_csv(path_to_csv_file)
    df.columns = [c.lower() for c in df.columns]
    df.to_sql(tablename, engine, index = False, schema = schema, if_exists = "append")
    return "SUCCESS"


def write_df_to_postgresDB(df,tablename,engine = engine):
    df.columns = [c.lower() for c in df.columns]
    df.to_sql(tablename, engine, index = False, schema = 'cdm6', if_exists = "append")
    return "SUCCESS"
    
    
conn = engine.connect()
path_to_csv_file = 'C:/Users/mochola/Documents/SOURCE_CDM6/MicroData ETLs/Dataset1/sero_results_data.csv'
tablename = 'serodata_staging'
Write_csv_to_postgresDB(path_to_csv_file, tablename, engine = engine, schema = 'staging')