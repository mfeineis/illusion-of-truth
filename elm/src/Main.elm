module Main exposing (main, reactor)

import Html exposing (Html)
import Util exposing ((=>))


type alias Provider =
    { rss : String
    }


type alias ProgramFlags =
    { providers : List Provider
    }


type alias Model =
    {}


type Msg
    = NoOp


main : Program ProgramFlags Model Msg
main =
    Html.programWithFlags
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
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


reactor : Program Never Model Msg
reactor =
    Html.program
        { init = init debugFlags
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


init : ProgramFlags -> ( Model, Cmd Msg )
init flags =
    ( {}, Cmd.none )


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    Html.text "Hello World!"
