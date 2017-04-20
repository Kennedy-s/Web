module Index exposing (..)

import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html exposing (..)
import Http 


main =
  Html.program
  { init = init 
  , view = view
  , update = update
  , subscriptions = subscriptions
  }


-- Model
  
type alias Model = 
  { inboxPage : String
  , sentPage : String
  , draftPage : String
  , filterPage : String
  , messagePage : String
  , send : String
  , reply : String
  }

model : Model
model = 
  { inboxPage =  ""
  , sentPage = ""
  , draftPage = ""
  , filterPage = ""
  , mailPage = ""
  , reply = ""
  , send = ""
  } 

init : ( Model, Cmd Msg)
init = 
  ( model, Cmd.none)



-- Update 

type Msg
   = InboxPAge String
   | SentPage String
   | DraftPage String
   | FilterPage String
   | MesssagePage String
   | Send String
   | Reply String


update : Msg -> Model -> (Model, Cmd msg)
update msg model  =
  case msg of
    Inbox inbox ->

      { model | inbox = inbox }
    
    Sent sent ->

     { model | sent = sent }

    Draft draft ->

      { model | draft = draft }

    Filter filter ->
    
      { model | filter = filter }



inboxPage : Model -> Html Msg
inboxPage model = 
    div [ id "message" ]
        [ h1 [] [ text "inbox" ]
        , text model.message
        ]

sentPage : Model -> Html Msg
sentPage model = 
    div [ id "message" ]
        [ h1 [] [ text "sent" ]
        , text model.message
        ]

draftPage : Model -> Html Msg
draftPage model =
     div [ id "message" ]
         [ h1 [] [ text "draft" ]
         , text model.message
         ]


filterPage : Model -> Html Msg
filterPage model =
      div [ id "message" ]
          [ h1 [] [ text "filter" ]
          , text model.message
          ]

mailPage : Model -> Html Msg
mailPage model =
  div  [ id "mail" ] 
       [ h1 [] [ text "mailPage" ]
       , div [] [text model.message]
       []
       , button [ onClick Send ] [ text "send" ]
       , button [ onClick Reply ] [ text "reply" ]
       , button [ onClick Filter ] [ text "filter" ]
       ]

--View

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", mailPage ] [ text "mailPage" ]
    , input [ type_ "text", sentPage ] [ text "sentPage" ]
    ]
  
viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if model.sent == model.sent then
        ("tick", "OK")
      else
        ("red", "do not sent!")
  in
    div [ style [("color", color)] ] [ text message ]



--Subscriptions 

subscriptions : Model -> Sub Msg
subscriptions model=
 Sub.none

