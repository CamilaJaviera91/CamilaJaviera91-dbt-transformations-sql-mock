# DBT Transformations: SQL Mock Data

## ✅ Step-by-Step Setup

### 1. Create a New Repository

Create a new GitHub repository. For this guide, we'll name it:

```
dbt-transformations-sql-mock
```

__💡 You can create it directly on GitHub.__

### 2. Clone the Repository Locally

```
git clone git@github.com:YOUR-USER/dbt-transformations-sql-mock-data.git
cd path/to/dbt-transformations-sql-mock-data
```

### 3. Initialize the DBT Project

```
dbt init transformations
```

- **⚠️ Make sure Python and DBT are installed before running this command.**

    #### I. Install Python and pip (if you don't have them)

    - DBT runs on Python. Fedora already includes Python, but make sure you have pip installed:

    <br>

    ```
    sudo dnf install python3-pip
    ```

    - Verify it's working:

    <br>

    ```
    python3 --version
    pip3 --version
    ```

    #### II. (Optional but recommended) Create a virtual environment. This helps keep your environment clean:

    ```
    python3 -m venv venv
    source venv/bin/activate
    ```

    #### III. Install DBT

    - For BigQuery:

    <br>
    
    ```
    pip install dbt-bigquery
    ```

    - For PostgreSQL:

    <br>
    
    ```
    pip install dbt-postgres
    ```

    #### IV. Initialize your project
    
    ```
    dbt init transformations
    ```

    - DBT will ask you a few questions:

        - project name: (you can keep transformations)

        - profile: use the default one, or configure it later

    - This will create a transformations/ folder with all the base files.

    #### V. Verify everything is working

    - Go into the project folder:

    <br>

    ```
    cd transformations
    ```

    - Then test your setup:

    <br>

    ```
    dbt debug
    ```

    - This will check if everything is ready to use DBT.

### 4. Recommended Project Structure

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

### 5. Connect to Your Data

If your other repo (sql-mock-data) contains scripts that load data into BigQuery or PostgreSQL, make sure this DBT project connects to the same data source.

    - Use the same service account or connection parameters.

    - Use the same dataset or schema, like raw_data.

- **✅ Example: If you're using PostgreSQL with Docker, confirm the profiles.yml matches the container's IP and credentials.**

### 6. Push Your Changes

```
git add .
git commit -m "Initialize DBT project for transforming and documenting data"
git push origin main
```

---

## ▶️ Using the Starter Project

Try running the following commands:

```
dbt run
dbt test
```

### 📚 Resources
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) - Q&A and community discussions
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
