defmodule Meteo do
  @moduledoc """
  Meteo module
  fetch meteo by town
  """

  require Logger

  
  @doc """
  main function called at startup.
  Call it with one string in an array
  """
  def main(args) do
    args
    |> parse_args
    |> create_meteo_url
    |> call_meteo
    |> check_result
    |> parse_result
    |> display_result
  end

  def parse_args args do
    cond do
      is_binary(args)  ->
	case String.length args do
	  n when n<2 ->
	    raise "The name mus t be valid"
	  _ ->
	    args
	end
      length(args)==0 ->
	raise "Give the name of a city. eg : ./meteo auxerre"
      length(args)>1 ->
	raise "Give the name of a city. eg : ./meteo auxerre"
      is_list(args) ->
	hd(args)
    end
  end

  def create_meteo_url(city) when is_binary(city) do
    "http://www.prevision-meteo.ch/services/json/" <> URI.encode(city)
  end
  def create_meteo_url(p) do
	raise "create_meteo_url : The parameter must be a string (was: #{p})"
  end
  def call_meteo url do
    HTTPoison.get! url
  end

  def check_result %HTTPoison.Response{status_code: 200, body: body} do
    body
  end
  def check_result %HTTPoison.Response{}=ko_response do
    Logger.error "Error retrieving information from meteo", ko_response
  end
  def check_result Else do
    Logger.error "Fail to get the information from meteo", Else
  end

  def parse_result body do
    Poison.decode! body
  end
  
  def display_result %{"errors" => [%{"description" => description}]} = result do
    IO.puts "Erreur dans les resultats : #{description}"
    Logger.info inspect(result_with_errors: result)
  end
  def display_result result do
    Logger.debug inspect(result: result)
    IO.puts "Meteo for #{result["city_info"]["name"]} (#{result["city_info"]["country"]})"
    IO.puts "Actuellement : #{result["current_condition"]["condition"]}"
    IO.puts "Demain : #{result["fcst_day_0"]["condition"]}"
  end
  
end
