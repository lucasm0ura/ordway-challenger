# README
Welcome to my repository about ordway-challenge-api

## Requirements

- Ruby 2.7.1
- PostgreSQL 11 or upper
- Postman or similar

## Steps

To generate database and tables:

```
$ bin/setup
```

To execute tests:

```
$ bundle exec rspec
```

To start the server - Port 3000:

```
$ bundle exec rails server
```

# Endpoints!

  - IMPORT DATA - METHOD -> POST
```
    localhost:3000/api/v1/venues/import

   {
    "venue": {
        "layout": {
            "rows": 10,
            "columns": 50
        }
    },
    "seats": {
        "a1": {
            "id": "a1",
            "row": "a",
            "column": 1,
            "status": "AVAILABLE"
        },
        "b5": {
            "id": "b5",
            "row": "b",
            "column": 5,
            "status": "AVAILABLE"
        },
        "h7": {
            "id": "h7",
            "row": "h",
            "column": 7,
            "status": "AVAILABLE"
        }
    }
}
  ```
  - LIST ALL SEATS WITH THE BEST SEAT - METHOD -> GET
  ```
    localhost:3000/api/v1/seats/  

  ```
  - THE BEST GROUP OF SEATS - METHOD -> POST
  ```
    localhost:3000/users/1/

    {
	    "amount_of_seats": 3
    }    
  ```

### Thanks
So, Firstly I want to thank the oportunity to send me this challenge I liked a lot !
