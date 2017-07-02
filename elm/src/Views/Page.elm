module Views.Page exposing (ActivePage(..), bodyId, frame)

import Data.User as User exposing (User)
import Html exposing (Html, div, footer, header, text)
import Html.Lazy exposing (lazy2)
import Route exposing (Route)
import Util exposing ((=>))


type ActivePage
    = Other
    | Home


frame : Bool -> Maybe User -> ActivePage -> Html msg -> Html msg
frame isLoading user page content =
    div []
        [ viewHeader page user isLoading
        , content
        , viewFooter
        ]


viewHeader : ActivePage -> Maybe User -> Bool -> Html msg
viewHeader page user isLoading =
    header [] [ text "Header" ]


viewFooter : Html msg
viewFooter =
    footer [] [ text "Footer" ]


{-| This id comes from index.html.
The Feed uses it to scroll to the top of the page (by ID) when switching pages
in the pagination sense.
-}
bodyId : String
bodyId =
    "page-body"
