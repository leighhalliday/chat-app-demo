defmodule Giphy.Api do

  def lookup(term) do
    "http://api.giphy.com/v1/gifs/search?q=#{term}&api_key=dc6zaTOxFJmzC&limit=1"
    |> HTTPotion.get
    |> process_response
  end

  defp process_response(response) do
    Map.get(response, :body)
    |> Poison.decode
    |> process_decoded
  end

  defp process_decoded({:ok, data}) do
    data
    |> Map.get("data")
    |> List.first
    |> Map.get("images")
    |> Map.get("downsized")
    |> Map.get("url")
    |> construct_img_tag
  end
  defp process_decoded(error) do
    IO.inspect error
    "Sorry... error while fetching GIF"
  end

  defp construct_img_tag(url) do
    "<img src=\"#{url}\">"
  end

end