module Page.Errored exposing (PageLoadError, pageLoadError, view)

import Data.Session as Session exposing (Session)
import Html exposing (Html, h1, main_, p, text)
import Views.Page as Page exposing (ActivePage)


-- MODEL --


type PageLoadError
    = PageLoadError Model


type alias Model =
    { activePage : ActivePage
    , errorMessage : String
    }


pageLoadError : ActivePage -> String -> PageLoadError
pageLoadError activePage errorMessage =
    PageLoadError { activePage = activePage, errorMessage = errorMessage }



-- VIEW --


view : Session -> PageLoadError -> Html msg
view session (PageLoadError model) =
    main_ []
        [ h1 [] [ text "Error Loading Page" ]
        , p [] [ text model.errorMessage ]
        ]
