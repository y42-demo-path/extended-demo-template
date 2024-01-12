import requests
import pandas as pd
from io import StringIO
import logging 

from y42.v1.decorators import data_loader

@data_loader
def exoplanets() -> pd.DataFrame:
    file_exoplanets = "https://raw.githubusercontent.com/OpenExoplanetCatalogue/oec_tables/master/comma_separated/open_exoplanet_catalogue.txt"
    
    r = requests.get(file_exoplanets, auth=('user', 'pass'))
    if r.status_code == 200:
        data = StringIO(r.content.decode('utf-8'))
        df = pd.read_csv(data)
    else: 
        logging.error(f"An error occurred. Error status_code: {r.status_code}")
    
    return df
