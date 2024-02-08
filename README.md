# Y42 Extended Demo Template

This repository contains the extended template space for the Space Fuel Shop demo. You can clone the repository to set up a new demo space.

This space is maintained to be usable for everyone with an @y42.com email account. You can browse around, but you might not have access to all of the secrets and features included here. You can use [the regular demo-template](https://github.com/y42-demo-path/demo-template) if you would like to fully set up the space yourself.

## Secrets

Because the secrets are not included in the Git repo, you must manually configure these to ensure the space can connect to its sources.

- `Postgres Space Fuel Shop`
  - **Host IP:** `35.198.165.208`
  - **Port:** `5432` (default)
  - **Database name:** `y42-demo-data`
  - **User:** `public_reader`
  - **Password:** `dontpanic`
- Custom secrets:
  - `exoplanet_user`: dummy secret, enter anything
  - `exoplanet_pass`: dummy secret, enter anything
- CData Google Sheets:
  - **Name:** `Customer loyalty`
  - Only select the `Customer loyalty` sheet, don't select the `Backup` sheet
  - [URL to Sheet](https://docs.google.com/spreadsheets/d/1aKd1Y39el2zxfsC0-dxGAhx_RZA3t6Lodh0WcdT_osk/edit#gid=956295739)

## Further documentation

- [Dataset design](https://www.notion.so/y42/Dataset-design-1f04d6f6e4e342ba99297fddca02bc38)
- [Golden Sales Pitch](https://www.notion.so/y42/Golden-Sales-Pitch-08cf79883ec442feacaa1bbdcddea612)
