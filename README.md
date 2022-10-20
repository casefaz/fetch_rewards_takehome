# README

## API Documentation

### Point Balances Endpoint

#### Description

A summation all points grouped by payers

#### get '/api/v1/point_balances'

request_body: {}
response_body {
  payer<string>: points<int>
}

example 
```
{"UNILEVER":200, "DANNON":800}
```

### Spend Points Endpoint

#### Description

What happens when a user spends thier points?

#### post '/api/v1/user/:id/spend'

request_body: {"points": 5000<int>}
response_body [
  {payer: name<string>, points: points<int>(difference)}
]

example
```
[
{ "payer": "DANNON", "points": -100 },
{ "payer": "UNILEVER", "points": -200 },
{ "payer": "MILLER COORS", "points": -4,700 }
]
```