module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.App
import Http
import Task exposing (Task)
import Json.Decode as Decode


-- Model
type alias Model = String

init : ( Model, Cmd Msg )
init = ( "", Cmd.none )


-- Messages
type Msg
        = Fetch
        | FetchSuccess String
        | FetchError Http.Error


-- View
view : Model -> Html Msg
view model =
  div []
      [ button [ onClick Fetch ] [ text "Fetch" ]
      , text model
      ]

decode : Decode.Decoder String
decode = Decode.at [ "name" ] Decode.string

url : String
url =
  "http://swapi.co/api/planets/1/?format=json"

fetchTask : Task Http.Error String
fetchTask =
  Http.get decode url

fetchCmd : Cmd Msg
fetchCmd = Task.perform FetchError FetchSuccess fetchTask


-- Update
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Fetch ->
      ( model, fetchCmd )
    FetchSuccess name ->
      ( name, Cmd.none )
    FetchError error ->
      ( toString error, Cmd.none )


-- Main
main : Program Never
main =
  Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = (always Sub.none)
        }
