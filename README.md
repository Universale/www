# Universale Download WWW

TODO: Write a description here

## Installation

Install postgresql and postgresql-dev and set a database.
Install crystal and crystal shards.
Then, use micrate and run the server :
```sh
crystal deps install
 # use your credentials
echo "PG_URL=postgres://root:toor@localhost/universale" > .env
./bin/micrate up
./src/universale.cr
```


## Usage

### Notes

- respond to ``application/json`` with json objects

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
