defmodule OmiseGoWeb.ConverterControllerTest do
  use OmiseGoWeb.ConnCase

  describe "/api/converter" do

    test "arrange json input based on parent-child", %{conn: conn} do
      
      {:ok, input} = File.read("test/files/input.json")

      conn = 
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> post("/api/converter", input)

      body = Jason.decode!(conn.resp_body)

      {:ok, output} = File.read("test/files/output.json")
      result = Jason.decode!(output)

      assert body == result

    end  

    test "handles empty request", %{conn: conn} do

      conn = 
        build_conn()
        |> put_req_header("content-type", "application/json")
        |> post("/api/converter")

      body = Jason.decode!(conn.resp_body)

      assert body == []

    end

  end
  
end
