# Explore Rails API

1. Devise JWT
2. Kaminari Pagination
3. Rack Attack (rails rate limiter)

## Database Design
![devise-jwt](https://github.com/user-attachments/assets/7d086d98-f409-4345-bd60-4770ce1ce41c)

## Endpoint
### Sign Up
``` POST api/v1/signup ```
```
body = {
    "user": {
        "email": "example@mail.com",
        "role": 0,
        "password": "password"
    }
}
```

### Sign In
``` POST api/v1/signin ```
```
body = {
    "user": {
        "email": "example@mail.com",
        "password": "password"
    }
}
```

### Books
- create
  ``` POST api/v1/books ```
  ```
  header = 'Authorization: ••••••'
  body = {
    "book": {
        "title": "Solo Leveling",
        "description": "Wage War"
    }
  }
  ```
- update
  ``` PUT api/v1/books/:id ```
  ```
  header = 'Authorization: ••••••'
  body = {
    "book": {
        "title": "Solo Leveling: Origin",
        "description": "Wage War"
    }
  }
  ```
- get all
  ``` GET api/v1/books ```
  ```
  header = 'Authorization: ••••••'
  ```
- get by id
  ``` GET api/v1/books/:id ```
  ```
  header = 'Authorization: ••••••'
  ```
- delete
  ``` DELETE api/v1/books/:id ```
  ```
  header = 'Authorization: ••••••'
  ```


  
