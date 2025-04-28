# dbt Transformations for SQL Mock Data

This repository contains the transformations and documentation for the data model generated in [sql-mock-data](https://github.com/CamilaJaviera91/sql-mock-data).

## ✅ Step-by-Step Setup

### Step 1: Create a New Repository

Create a new GitHub repository. For this guide, we'll name it.

```
dbt-transformations-sql-mock
```

- **💡 You can create it directly on GitHub.**

---

### Step 2: Clone the Repository Locally

```
git clone git@github.com:YOUR-USER/dbt-transformations-sql-mock-data.git
cd path/to/dbt-transformations-sql-mock-data
```

---

### Step 3: Initialize the DBT Project

```
dbt init transformations
```

- **⚠️ Make sure Python and DBT are installed before running this command.**

    #### Ⅰ. Install Python and pip (if you don't have them)

    - DBT runs on Python. Fedora already includes Python, but make sure you have pip installed.

    <br>

    ```
    sudo dnf install python3-pip
    ```

    - Verify it's working.

    <br>

    ```
    python3 --version
    pip3 --version
    ```

    #### Ⅱ. (Optional but recommended) Create a virtual environment. This helps keep your environment clean:

    ```
    python3 -m venv venv
    source venv/bin/activate
    ```

    #### Ⅲ. Install DBT

    - For BigQuery.

    <br>
    
    ```
    pip install dbt-bigquery
    ```

    - For PostgreSQL.

    <br>
    
    ```
    pip install dbt-postgres
    ```

    #### Ⅳ. Initialize your project
    
    ```
    dbt init transformations
    ```

    - DBT will ask you a few questions:

        - project name: (you can keep transformations)

        - profile: use the default one, or configure it later

    - This will create a transformations/ folder with all the base files.

    #### Ⅴ. Verify everything is working

    - Go into the project folder:

    <br>

    ```
    cd transformations
    ```

    - Then test your setup.

    <br>

    ```
    dbt debug
    ```

    - This will check if everything is ready to use DBT.

---

### Step 4: Recommended Project Structure

```
dbt-transformations-sql-mock-data/
├── transformations/
│   ├── dbt_project.yml
│   ├── models/
│   │   ├── staging/
│   │   └── marts/
│   ├── README.md
├── requirements.txt
└── .gitignore
```

---

### Step 5: Connect to Your Data

If your other repo (sql-mock-data) contains scripts that load data into BigQuery or PostgreSQL, make sure this DBT project connects to the same data source.

    - Use the same service account or connection parameters.

    - Use the same dataset or schema, like raw_data.

 - **💡 Here's a template for your ~/.dbt/profiles.yml with both a PostgreSQL and BigQuery example — you can keep whichever you need, or even include both under different profile names.**

#### 🐘 PostgreSQL (Docker example)

 ```
transformations:
  target: dev
  outputs:
    dev:
      type: postgres
      host: 172.17.0.1         # Replace with your container's IP
      port: 5432
      user: postgres
      password: yourpassword
      dbname: employee         # Must match the name of the database
      schema: raw_data         # Use your target schema name
      threads: 1
 ```

-  **✅ Test it with:**

```
dbt debug
```

- **💡 If you’re using localhost and pgAdmin/PostgreSQL installed outside Docker, you can try:**

```
host: localhost
```

#### ☁️ BigQuery (Service Account)

```
transformations:
  target: dev
  outputs:
    dev:
      type: bigquery
      method: service-account
      project: your-gcp-project-id
      dataset: raw_data                # Your BigQuery dataset
      threads: 1
      timeout_seconds: 300
      location: US
      keyfile: /full/path/to/keyfile.json
```

- **✅ Replace your-gcp-project-id and keyfile with your actual GCP project and the path to your service account key.**

---

### Step 6: Push Your Changes

```
git add .
git commit -m "Initialize DBT project for transforming and documenting data"
git push origin main
```

---

## ▶️ Using the Starter Project

Try running the following commands.

```
dbt run
dbt test
```

---

## 📚 Resources
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) - Q&A and community discussions
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
