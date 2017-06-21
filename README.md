# Universale Download WWW

TODO: Write a description here

## Installation

Install postgresql and postgresql-dev and set a database.
Install crystal and crystal shards.
Then, use micrate and run the server :
```sh
crystal deps install
# use your credentials
echo "DATABASE_URL=postgres://root:toor@localhost/universale" > .env
psql -U postgres postgres -c "CREATE DATABASE universale"
psql -U postgres postgres -c "CREATE USER root WITH PASSWORD 'toor' SUPERUSER;"
./bin/micrate up
./db/seed.cr
./src/universale.cr
```


## Usage

### Notes

- respond to ``application/json`` with json objects

### Routes

- GET ``/`` : index
- GET ``/assets`` : ``/assets/js`` and ``/assets/css``
- GET ``/categories`` : list the categories names and link to ``/categories/:name/records``
- GET ``/categories/:name/records`` : list 100 records associated to the category. Take optional ``query parameter "offset"``
- GET ``/records/:id`` : get informations about one specific record
- POST ``/records`` : create a new record (required parameters: ``title``,``data``,``description``,``category_id``)

## Development

TODO: Write development instructions here


## Contributing

1. Fork it ( https://github.com/Universale/www/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [pouleta](https://github.com/Nephos) Arthur Poulet - creator, maintainer
