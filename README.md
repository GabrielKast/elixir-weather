# Meteo

Simple service made as an exercice :
call a weather service and display it in the console
Done with :
 * HTTPoison for http call
 * Poison to parse a JSON result
 * A call to a great and simple service online : http://www.prevision-meteo.ch/services/json/
 

## Installation in an applicatio

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `meteo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:meteo, "~> 0.1.0"}]
end
```

## Installation in console
```bash
$ mix escript.build
Compiling 1 file (.ex)
Generated meteo app
Generated escript meteo with MIX_ENV=dev
$ ./meteo Vincennes
Meteo for Vincennes (France)
Actuellement : Neige faible
Demain : Eclaircies
:ok
$ ./meteo Bagdad
Erreur dans les resultats : Please specify a valid city or a coordinate. Available cities are listed here : http://www.prevision-meteo.ch/services/json/list-cities

00:31:23.439 [info]  [result_with_errors: %{"errors" => [%{"code" => "11", "description" => "Please specify a valid city or a coordinate. Available cities are listed here : http://www.prevision-meteo.ch/services/json/list-cities", "text" => "City or coordinate not found"}]}]

```


Create 
