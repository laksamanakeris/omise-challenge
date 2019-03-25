defmodule OmiseGo.GithubSearch do

  @base_url_live "https://api.github.com/search/repositories"

  @max_results 1000

  def query_page(query, page \\ 1, per_page \\ 100) do
    url = "#{@base_url_live}?q=#{query}&page=#{page}&per_page=#{per_page}"
    IO.inspect url
    response = HTTPoison.get(url)

    IO.inspect response
    case response do
      {:ok, %{status_code: 200, body: body, headers: headers}} ->
        body = process_response_body(body)

        case body.total_count do
          0 -> {:error, "We couldn’t find any repositories matching '#{query}'"}
          _-> construct_result(body, query, page, per_page )
        end        
        # headers =  process_request_headers(headers)
        # links = headers["Link"]
        # paginations = extract_paginations(links)

      {:ok, %{body: body}}->
        body = process_response_body(body)
        {:error, body[:message]}
      _ ->
        {:error, :bad_network}
    end
  end

  def extract_paginations(string_list) do
    pagination_string = String.split(string_list, ", ")
  end

  def process_request_headers(headers) do
    headers = headers |> Map.new
  end

  def process_response_body(body) do
    body = body |> Jason.decode!(keys: :atoms)
  end

  def construct_result(body, query, page_num, per_page) do
    list = body.items
    total_entries = body.total_count

    total_count = 
      if total_entries > @max_results do
        total_count = @max_results
      else
        total_entries
      end

    count = total_count/per_page

    total_pages =  Float.ceil(count) |> round

    # response = %{list: list, total_entries: total_entries, total_pages: total_pages, page_number: page_num}
    page = %Scrivener.Page{entries: list, page_number: page_num, page_size: per_page, total_entries: total_entries, total_pages: total_pages}
    {:ok, page}
  end
  
end