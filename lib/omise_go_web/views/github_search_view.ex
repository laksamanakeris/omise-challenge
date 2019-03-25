defmodule OmiseGoWeb.GithubSearchView do
  use OmiseGoWeb, :view
  import Scrivener.HTML
  
  # Generate grid using table 
  def generate_result_table(content, column_count \\ 10) do
    content_chunked = Enum.chunk_every(content, column_count)
    content_tag(:table, populate_rows(content_chunked), class: "")
  end

  def populate_rows(content) do
    Enum.map(content, fn(item) ->
      content_tag(:tr, populate_columns(item), class: "")
    end)
  end

  def populate_columns(content) do
    Enum.map(content, fn(item) ->
      content_tag(:td, render_item(item), class: "td-git")
    end)
  end

  def render_item(item) do
    render("item.html", item: item)
  end
end
