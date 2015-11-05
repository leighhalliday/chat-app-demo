defmodule ChatApp.Commander do

  def build_response("/giphy "<>term) do
    Giphy.Api.lookup term
  end
  def build_response(msg) do
    msg
    |> Earmark.to_html
  end

end