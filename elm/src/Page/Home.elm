module Page.Home exposing (Model, Msg, init, update, view)

import Data.Session as Session exposing (Session)
import Html exposing (Html, div, text)
import Page.Errored as Errored exposing (PageLoadError, pageLoadError)
import Task exposing (Task)
import Views.Page as Page


type alias Model =
    { fake : Bool }


init : Session -> Task PageLoadError Model
init session =
    let
        loadFake =
            Task.succeed True

        handleLoadError _ =
            pageLoadError Page.Home "Homepage is currently unavailable."
    in
        Task.map Model loadFake
            |> Task.mapError handleLoadError



-- VIEW --


view : Session -> Model -> Html Msg
view session model =
    div [] [ text "Homepage content" ]



-- UPDATE --


type Msg
    = NoOp


update : Session -> Msg -> Model -> ( Model, Cmd Msg )
update session msg model =
    ( model, Cmd.none )
