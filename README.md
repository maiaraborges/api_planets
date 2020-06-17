<h3 align="center">
  B2W API PLANETS
</h3>

## :rocket: About the challenge

This is a Star Wars planets REST API, in which must show how many times a planet has appeared in Star Wars movies, integrating with the public Star Wars API: https://swapi.dev/about. 
API proposed by B2W Digital as a challenge for the position of back-end developer.

### Stack

* Ruby 2.6.5
* Rails 5.2.4

## Planets Resource

List of required environment vars

### Planets entity

|Field|Type|Description|Rules|Default|
|:---|:--:|:----------|:---:|:-----:|
|`id`|int|ID of a event|unique,   read only|-|
|`name`|str|Name of a planet|required|-|
|`climate`|int|Climate of a planet|optional|-|
|`terrain`|int|Terrain of a planet|optional|-|
|`films`|list|Films URL where planet appears in Star Wars franchise|read only|-|
|`quantity_movies`|int|Number appearances in films|read only|-|

### Planets Actions

|Path|Method|Status Code|Description|
|:---|:----:|:---------:|:----------|
|`/planets`|`GET`|200|List all planets|
|`/planets`|`POST`|201|Create a planet|
|`/planets/:id`|`GET`|200|Get an object from the planet by id|
|`/planets/name/:name`|`GET`|200|Get an object from the planet by name|
|`/planets/:id`|`DELETE`|204|Delete a planet|

#### POST `/events` 

Create an issue event

**Request:**
> POST /events

**Response:**

> 201 Created
```javascript
  {
    "_id": "5eea8827e05d0c21e4b6323a",
    "climate": "temperate",
    "name": "Alderaan",
    "terrain": "grasslands, mountains"
  }
```

#### GET `/planets`

List all planets

**Request:**
> GET /planets

**Response:**

> 200 OK
```javascript
[
  {
    "_id": "5eea8827e05d0c21e4b6323a",
    "climate": "temperate",
    "name": "Alderaan",
    "terrain": "grasslands, mountains"
  }
]
```

#### GET `/planets/:id`

Get all planets of an issue by id

**Request:**
> GET /planets/5eea8827e05d0c21e4b6323a

**Response:**

> 200 OK
```javascript
{
  "_id": "5eea8827e05d0c21e4b6323a",
  "climate": "temperate",
  "name": "Alderaan",
  "terrain": "grasslands, mountains"
}
```

#### GET `/planets/name/:name`

Get all planets of an issue by name

**Request:**
> GET /planets/name/Alderaan

**Response:**

> 200 OK
```javascript
{
  "_id": "5eea8827e05d0c21e4b6323a",
  "name": "Alderaan",
  "climate": "temperate",
  "terrain": "grasslands, mountains",
  "films": [
    "http://swapi.dev/api/films/1/",
    "http://swapi.dev/api/films/6/"
  ],
  "quantity_movies": 2
}
```

#### DELETE `/planets/:id`

Delete planets

**Request:**
> GET /planets/5eea8827e05d0c21e4b6323a

**Response:**

> 204 No Content
```javascript
  HTTP/1.1 204 No Content
```

## Testing specification

- **`should be able to create a new planet`**: application must allow a planet to be created and return a json with the created project.

- **`should be able to list the planet`**: application should allow an array of all the planets that have been created so far to be returned.

- **`should be able to find planets by id`**: application should allow searches with planets id and return a json.

- **`should be able generate errors when trying to search for an unregistered planet by id`**: application should not allow searches with id of planets that do not exist.

- **`should be able to find planets by name`**: application should allow searches with planets name and return a json.

- **`should be able generate errors when trying to search for an unregistered planet by name`**: application should not allow searches with name of planets that do not exist.

- **`should be able to delete the planet`**: Application must allow the delete route to delete a planet, and when deleting, it returns an empty response, with status 204.

## Local use

* Install the gem

```sh
bundle install
```

* Start service from MongoDB

```sh
sudo service mongod start
```

* Upload application

```sh
rails s
```

* Run the tests

```sh
rspec spec
```
