module Main exposing (main, reactor)

import Html exposing (Html)
import Navigation exposing (Location)
import Route exposing (Route)


type alias Provider =
    { rss : String
    }


type alias ProgramFlags =
    { providers : List Provider
    }



--http://www.tagesschau.de/infoservices/rssfeeds/index.html
--http://www.spiegel.de/dienste/besser-surfen-auf-spiegel-online-so-funktioniert-rss-a-1040321.html
--http://edition.cnn.com/services/rss/


debugFlags : ProgramFlags
debugFlags =
    { providers =
        [ { rss = "http://www.tagesschau.de/xml/rss2" }
        , { rss = "http://www.spiegel.de/schlagzeilen/tops/index.rss" }
        , { rss = "http://rss.cnn.com/rss/cnn_latest.rss" }
        , { rss = "http://www.aljazeera.com/xml/rss/all.xml" }
        ]
    }


type alias Model =
    { pageState : PageState
    }


type Msg
    = SetRoute (Maybe Route)


type Page
    = NotFound
    | Blank


type PageState
    = Loaded Page
    | TransitioningFrom Page


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


init : ProgramFlags -> Location -> ( Model, Cmd Msg )
init flags location =
    setRoute (Route.fromLocation location)
        { pageState = Loaded Blank
        }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    Html.text "Nothing yet..."


setRoute : Maybe Route -> Model -> ( Model, Cmd Msg )
setRoute maybeRoute model =
    case maybeRoute of
        Nothing ->
            ( { model | pageState = Loaded NotFound }, Cmd.none )

        Just Route.Home ->
            ( { model | pageState = Loaded Blank }, Cmd.none )


main : Program ProgramFlags Model Msg
main =
    Navigation.programWithFlags (Route.fromLocation >> SetRoute)
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


reactor : Program Never Model Msg
reactor =
    Navigation.program (Route.fromLocation >> SetRoute)
        { init = init debugFlags
        , subscriptions = subscriptions
        , update = update
        , view = view
        }
