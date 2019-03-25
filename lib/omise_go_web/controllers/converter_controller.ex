defmodule OmiseGoWeb.ConverterController do
  use OmiseGoWeb, :controller

  action_fallback OmiseGoWeb.FallbackController

  alias OmiseGo.JsonSort

  def index(conn, params) do
    response = JsonSort.execute(params) 
    json(conn, response) 
  end

end
