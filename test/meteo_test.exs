defmodule MeteoTest do
  use ExUnit.Case
  doctest Meteo

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "parse_args Should parse one argument" do
    assert "Auxerre" == Meteo.parse_args ["Auxerre"]
    assert "Saint-Étienne" == Meteo.parse_args ["Saint-Étienne"]
  end

  test "parse_args should fail with no argument" do
    assert_raise RuntimeError, "Give the name of a city. eg : ./meteo auxerre",
    fn -> Meteo.parse_args [] end
  end

  test "parse_args should fail with more than one argument" do
    assert_raise RuntimeError, "Give the name of a city. eg : ./meteo auxerre",
    fn -> Meteo.parse_args ["Auxerre", "Saint-Etienne"] end
  end

  test "create_meteo_url should... create a proper URL" do
    assert "http://www.prevision-meteo.ch/services/json/Auxerre" == Meteo.create_meteo_url "Auxerre"
    assert "http://www.prevision-meteo.ch/services/json/Saint-%C3%89tienne" == Meteo.create_meteo_url "Saint-Étienne"
  end

  test "create_meteo_url should fail if the argument is not a String" do
    assert_raise RuntimeError, fn -> Meteo.create_meteo_url 12 end
  end
  
end
