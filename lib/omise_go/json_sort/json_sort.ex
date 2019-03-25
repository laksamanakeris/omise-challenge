defmodule OmiseGo.JsonSort do

  def execute(input) do
    input
    |> flat_maps
    |> arrange([], nil)
  end

  def flat_maps(val) do
    Enum.reduce(val, [], fn item, acc ->  
      {_num, maps} = item
      acc ++ maps
    end)
  end


  def arrange(source, target, id) do
    data = 
      Enum.filter(source, fn item ->  
        item["parent_id"] == id
      end)

    if Enum.count(data) > 0 do
      map = 
        Enum.map(data, fn(item) ->
          # iterate on children maps
          Map.put(item, "children", arrange(source, [], item["id"]))
        end)
      target ++ map
    else
      target
    end

  end
  
end