<h3 align="center">
  B2W API PLANETS
</h3>

## :rocket: About the challenge

This is a Star Wars planets REST API, in which must show how many times a planet has appeared in Star Wars movies, integrating with the public Star Wars API: https://swapi.dev/about. 
API proposed by B2W Digital as a challenge for the position of back-end developer.

### Testing specification

- **`should be able to create a new planet`**: application must allow a planet to be created and return a json with the created project.

- **`should be able to list the planet`**: application should allow an array of all the planets that have been created so far to be returned.

- **`should be able to find planets by id`**: application should allow searches with planets id and return a json.

- **`should be able generate errors when trying to search for an unregistered planet by id'`**: application should not allow searches with id of planets that do not exist.

- **`should be able to find planets by name'`**: application should allow searches with planets name and return a json.

- **`should be able generate errors when trying to search for an unregistered planet by name'`**: application should not allow searches with name of planets that do not exist.

- **`should be able to delete the planet'`**: Application must allow the delete route to delete a planet, and when deleting, it returns an empty response, with status 204.

### Local use


* Install the gem

```sh
bundle install
```

* Start service from MongoDB

```sh
sudo service mongod start
```

* Raise application

```sh
rails s
```

* Run the tests

```sh
rspec spec
```
