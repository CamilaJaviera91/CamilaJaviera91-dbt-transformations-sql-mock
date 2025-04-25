import pandas as pd
from google.cloud import bigquery

# Path to the CSV file
csv_path = "./csv/employees_resume.csv"

# Load the CSV using pandas
df = pd.read_csv(csv_path)

# Configure the BigQuery client
bq_credentials_path = "/home/camilajaviera/gcloud/auth.json"
bq_client = bigquery.Client.from_service_account_json(bq_credentials_path)

# Define the BigQuery destination
project_id = "thinking-star-427923-v6"
dataset_id = "employees"
table_id = "employees_resume"  # Change this if you want a different table name

table_ref = f"{project_id}.{dataset_id}.{table_id}"

# Upload the DataFrame to BigQuery
job = bq_client.load_table_from_dataframe(df, table_ref)

# Wait for the job to complete
job.result()

print(f"✅ CSV successfully uploaded to table {table_ref}!")
