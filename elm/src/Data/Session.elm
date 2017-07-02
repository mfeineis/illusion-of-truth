module Data.Session exposing (Session)

import Data.User exposing (User)
import Util exposing ((=>))


type alias Session =
    { user : Maybe User
    }
