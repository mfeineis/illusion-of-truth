module Page.NotFound exposing (view)

import Data.Session as Session exposing (Session)
import Html exposing (Html, main_, text)


-- VIEW --


view : Session -> Html msg
view session =
    main_ [] [ text "Not Found content" ]
