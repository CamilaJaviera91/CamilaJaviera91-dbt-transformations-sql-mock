# dbt transformations: sql mock data

## ✅ How would you do it step by step?

1. Create a new repository

- In this case we name it:

```
dbt-transformations-sql-mock
```

- And we created it directly on GitHub.

2. Clone it to your PC

```
git clone git@github.com:YOUR-USER/dbt-transformations-sql-mock-data.git
cd your/user/path/dbt-transformations-sql-mock
```

3. Initialize the DBT project

```
dbt init transformations
```

- To run dbt init transformations, you need to have Python and DBT properly installed.

    1. Install Python and pip (if you don't have them)
    - DBT runs on Python. Fedora already includes Python, but make sure you have pip installed:

    ```
    sudo dnf install python3-pip
    ```

    - Verify it's working:

    ```
    python3 --version
    pip3 --version
    ```

    2. (Optional but recommended) Create a virtual environment. This helps keep your environment clean:

    ```
    python3 -m venv venv
    source venv/bin/activate
    ```

    3. Install DBT

    - For BigQuery:
    ```
    pip install dbt-bigquery
    ```

    - For PostgreSQL:
    ```
    pip install dbt-postgres
    ```