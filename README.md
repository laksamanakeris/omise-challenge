# OmiseGO Backend Challenge - Elixir

A Phoenix application that consists of two parts:

* JSON converter API endpoint
* Endpoint that use the [GitHub Search API](https://developer.github.com/v3/guides/traversing-with-pagination/) with pagination to find all the repositories that match the query `elixir`.

## Installing / Getting started

To run this project, you will need to install the following dependencies on your system:

* [Elixir](https://elixir-lang.org/install.html)
* [Phoenix](https://hexdocs.pm/phoenix/installation.html)

To get started, run the following commands in your project folder:

```shell
mix deps.get  # installs the dependencies
mix phx.server  # run the application.
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Tests

To run the tests for this project, simply run in your terminal:

```shell
mix test
```


### Part 1

Endpoint: 

    /api/converter

Example usage:

```
curl --location --request POST "http://localhost:4000/api/converter" \
  --header "Content-Type: application/json" \
  --data "{\"0\":
  [{\"id\": 10,
    \"title\": \"House\",
    \"level\": 0,
    \"children\": [],
    \"parent_id\": null}],
 \"1\":
  [{\"id\": 12,
    \"title\": \"Red Roof\",
    \"level\": 1,
    \"children\": [],
    \"parent_id\": 10},
   {\"id\": 18,
    \"title\": \"Blue Roof\",
    \"level\": 1,
    \"children\": [],
    \"parent_id\": 10},
   {\"id\": 13,
    \"title\": \"Wall\",
    \"level\": 1,
    \"children\": [],
    \"parent_id\": 10}],
 \"2\":
  [{\"id\": 17,
    \"title\": \"Blue Window\",
    \"level\": 2,
    \"children\": [],
    \"parent_id\": 12},
   {\"id\": 16,
    \"title\": \"Door\",
    \"level\": 2,
    \"children\": [],
    \"parent_id\": 13},
   {\"id\": 15,
    \"title\": \"Red Window\",
    \"level\": 2,
    \"children\": [],
    \"parent_id\": 12}]}"
```
   

### Part 2

Github search:

    /github-search/:query
    /github-search/:query?page=1
    /github-search/:query?per_page=100&page=1

 
Example usage:

  [`/github-search/elixir`](http://localhost:4000/github-search/elixir)
  
  [`/github-search/elixir?page=1`](http://localhost:4000/github-search/elixir?page=1)  
  
  [`/github-search/elixir?per_page=100&page=1`](http://localhost:4000/github-search/elixir?per_page=100&page=1)

