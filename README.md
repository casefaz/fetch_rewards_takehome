# README

## API Documentation

### Point Balances Endpoint

#### Description

A summation all points grouped by payers

#### get '/api/v1/point_balances'

request_body :{}
response_body {
  payer<string>: points<int>
}

example 
```
{"UNILEVER":200, "DANNON":800}
```
