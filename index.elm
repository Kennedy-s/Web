module Index exposing (..)

import Html exposing (form, text, h1, label, input, button,  textarea, div)
import Html.Attributes exposing (onClick)
import Html.Events exposing (..)
import Http


main =
  { init = init 
 	, view = view
 	, update = update
 	, subscriptions = subscriptions
  }


-- Model
  
type alias Model
   
