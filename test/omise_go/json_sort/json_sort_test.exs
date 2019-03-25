defmodule OmiseGo.JsonSortTest do

  use ExUnit.Case, async: true

  alias OmiseGo.JsonSort

  describe "flat/1" do
    
    test "flatten map" do
      
      input = %{
        "0" => [
          %{
            "children" => [],
            "id" => 10,
            "level" => 0,
            "parent_id" => nil,
            "title" => "House"
          }
        ],
        "1" => [
          %{
            "children" => [],
            "id" => 18,
            "level" => 1,
            "parent_id" => 10,
            "title" => "Blue Roof"
          },
          %{
            "children" => [],
            "id" => 13,
            "level" => 1,
            "parent_id" => 10,
            "title" => "Wall"
          }
        ]
      }

      result = JsonSort.flat_maps(input)

      assert result ==  [
        %{
          "children" => [],
          "id" => 10,
          "level" => 0,
          "parent_id" => nil,
          "title" => "House"
        },
        %{
          "children" => [],
          "id" => 18,
          "level" => 1,
          "parent_id" => 10,
          "title" => "Blue Roof"
        },
        %{
          "children" => [],
          "id" => 13,
          "level" => 1,
          "parent_id" => 10,
          "title" => "Wall"
        }
      ]

      
    end
  end

  describe "arrange/3" do

    test "arrange map" do
      
      input=  [
        %{
          "children" => [],
          "id" => 10,
          "level" => 0,
          "parent_id" => nil,
          "title" => "House"
        },
        %{
          "children" => [],
          "id" => 18,
          "level" => 1,
          "parent_id" => 10,
          "title" => "Blue Roof"
        },
        %{
          "children" => [],
          "id" => 13,
          "level" => 1,
          "parent_id" => 10,
          "title" => "Wall"
        }
      ]

      result = JsonSort.arrange(input, [], nil)

      assert result ==  [
        %{
          "children" => [
            %{
              "children" => [],
              "id" => 18,
              "level" => 1,
              "parent_id" => 10,
              "title" => "Blue Roof"
            },
            %{
              "children" => [],
              "id" => 13,
              "level" => 1,
              "parent_id" => 10,
              "title" => "Wall"
            }
          ],
          "id" => 10,
          "level" => 0,
          "parent_id" => nil,
          "title" => "House"
        }
      ]

    end

  end


  
end