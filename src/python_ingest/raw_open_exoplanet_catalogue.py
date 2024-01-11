import requests
import pandas as pd
import json

from y42.v1.decorators import data_loader

@data_loader
def exoplanets() -> pd.DataFrame:
    file_exoplanets = "https://raw.githubusercontent.com/OpenExoplanetCatalogue/oec_tables/master/comma_separated/open_exoplanet_catalogue.txt"
    df = pd.read_csv(file_exoplanets)
    df.fillna('', inplace=True)

    return df
