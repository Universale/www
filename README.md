# Universale Download WWW

TODO: Write a description here

## Installation

Install postgresql and postgresql-dev and set a database.
Install crystal and crystal shards.
Then, use micrate and run the server :
```sh
# use your credentials
crystal deps install
PG_URL="postgres://root:toor@localhost/universale" ./bin/micrate up
PG_URL="postgres://root:toor@localhost/universale" ./src/universale.cr
```


## Usage

### Routes

- ``/`` : index
- ``/assets`` : ``/assets/js`` and ``/assets/css``
- ``/categories`` : list the categories names and link to ``/categories/:name/records``
- ``/categories/:name/records`` : list 100 records associated to the category. Take optional ``query parameter "offset"``


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
