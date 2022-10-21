<div align="center">
  <h1>Points Payers and Payees</h1>
  <img src="https://media3.giphy.com/media/BwP6oBTVT5oC4/giphy.gif?cid=ecf05e47ij89h6kibdx7ddbeom2gwy1zzzy4epkktuxe6cqt&rid=giphy.gif&ct=g">
</div>
<br>

Points Payers and Payees was a takehome challenge from Fetch Rewards ([prompt](https://fetch-hiring.s3.us-east-1.amazonaws.com/points.pdf)). This was done utilizing a Ruby on Rails framework, Postgresql database, and (mostly) restful endpoints. Any comments still left in the repository were left there intentionally to showcase train of thought, or denote areas of new learning in architectural design choices.

Endpoints were exposed using RESTful practices and are documented below, along with setup instructions should you wish to run this locally.

## Contents

- [Database Schema](#schema)
- [Setup](#setup)
- [API Documentation](#documentation)

## Schema

![Screen Shot 2022-10-21 at 12 04 50 PM](https://user-images.githubusercontent.com/98674727/197260746-dda8cca7-42e4-4152-80fa-d399dd27ce0a.png)

## Setup

### Languages, Frameworks and more galore!

![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Postman](https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

- Ruby 2.7.4
- Rails 5.2.8.1

### Instructions

1. After installing the appropriate languages clone this repository
2. Run `bundle install`
3. Run `rails g rspec:install`
4. Run `rails db:{create,migrate,seed}`
5. Run test suite with `bundle exec rspec`
6. To hit the endpoints run `rails s` in the console - you can now access endpoints using `http://localhost:3000` in browser or through Postman 

[To the Beginning](#contents)

## Documentation

### Add Transaction Endpoint

#### Description: Adds transactions as they are posted by user

### `post '/api/v1/transactions'`

request_body: 
```
{
  payer: 'DANNON',
  points: 1000,
  user_id: user.id,
  timestamp:  "2020-11-02T14:00:00Z"

}
```
      
#### example 
```
{
  :data=>
  {
    :id=>"1121",
    :type=>"transaction",
    :attributes=>{:payer=>"DANNON", :points=>1000, :timestamp=>"2022-10-21T17:37:31.000Z", :user_id=>402}
  }
 }
```                
#### In Postman

<img width="1218" alt="Screen Shot 2022-10-21 at 12 21 38 PM" src="https://user-images.githubusercontent.com/98674727/197263518-a3b501fc-8092-43b2-abab-da92552eefb9.png">


### Point Balances Endpoint

#### Description: A summation of all points grouped by payers

### `get '/api/v1/point_balances'`

request_body: `{}`

response_body: `{ payer: points }`

#### example 

```
{"UNILEVER":200, "DANNON":800}
```
#### In Postman

<img width="1230" alt="Screen Shot 2022-10-21 at 12 08 13 PM" src="https://user-images.githubusercontent.com/98674727/197261322-44979bcc-e47d-4ee4-ae61-5a0ad2a6268c.png">

### Users Endpoint

#### Description: What happens when a user spends thier points?

### `post '/api/v1/user/:id/spend'`

request_body: `{"points": 5000}`

response_body: 
```
[
  {payer: name<string>, points: points<int>(difference)}
]
````

#### example

```
[
  { "payer": "DANNON", "points": -100 },
  { "payer": "UNILEVER", "points": -200 },
  { "payer": "MILLER COORS", "points": -4,700 }
]
```

#### In Postman

<img width="1247" alt="Screen Shot 2022-10-21 at 12 22 24 PM" src="https://user-images.githubusercontent.com/98674727/197263660-3f29ab4e-8562-4980-ae2f-c0aed079c230.png">

[To the Beginning](#contents)

## Future Additions

Something that I would like to do more robustly in the future is add more sad path and edge casing.
