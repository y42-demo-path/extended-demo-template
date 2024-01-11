import pandas as pd

file_exoplanets = "https://raw.githubusercontent.com/OpenExoplanetCatalogue/oec_tables/master/comma_separated/open_exoplanet_catalogue.txt"
df_planets = pd.read_csv(file_exoplanets)
