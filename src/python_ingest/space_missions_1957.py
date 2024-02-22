import base64
import requests
import pandas as pd
import logging
import io

from y42.v1.decorators import data_loader

@data_loader
def space_missions_1957(context) -> pd.DataFrame:
    #1: Preparing the URL.
    base_url = "https://www.kaggle.com/api/v1"
    owner_slug = "agirlcoding"
    dataset_slug = "all-space-missions-from-1957"
    dataset_version = "6"

    url = f"{base_url}/datasets/download/{owner_slug}/{dataset_slug}?datasetVersionNumber={dataset_version}"

    #2: Encoding the credentials and preparing the request header.
    username = context.secrets.get('kaggle_username')
    key = context.secrets.get('kaggle_api_token')
    creds = base64.b64encode(bytes(f"{username}:{key}", "ISO-8859-1")).decode("ascii")
    headers = {
        "Authorization": f"Basic {creds}"
    }

    #3: Sending a GET request to the URL with the encoded credentials.
    response = requests.get(url, headers=headers)

    #4: Unzip response and read into dataframe
    if response.status_code == 200:
        df = pd.read_csv(io.BytesIO(response.content), compression="zip")
        logging.info("Data fetched and DataFrame created successfully.")
    else: 
        logging.error(f"An error occurred. Error status_code: {requests.status_code}")

    return df
