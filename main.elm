module Main exposing (..)

import Html.Attributes exposing (id, type_, value, class)
import Html.Events exposing (..)
import Html exposing (h1, text, textarea, button, input, label)
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
  { username : String
  , password : String
  , login : String
  , logout : String
  , message : String
  , reply : String
  , filter : String
  , send  : String
  }

model : Model
model = 
  { username = ""
  , password = ""
  , login = ""
  , logout =  ""
  , message = ""
  , reply = ""
  , filter = ""
  , send = ""
  }

init : ( Model, Cmd Msg)
init = 
  ( model, Cmd.none)



-- Update
 
type Msg
    = Username  String
    | Password  String
    | Login  
    | Logout 
    | Message String
    | Reply String
    | Filter String
    | Send String


type alias User =
   { usrename : String 
   , password : String
   }

users : [ user1, user2, user3]


user1 : User
user1 = 
  { username = "user1"
  , password = "1234"
  }

user2 : User
user2 =
  { username = "user2"
  , password = "5678"
  }

user3 : Username
user3 =
  { username = "user3"
  , password = "2468"
  }


user : Model -> Html Msg
user model =
      


update : Msg -> Model -> (Model, Cmd msg)
update msg model  =
  case msg of
    Username ->
      (model, Cmd.none)

    Password ->
      (model, Cmd.none)
    
    Login ->
      (model, Cmd.none)

    Logout ->
      (model, Cmd.none)

    Message ->
      (model, Cmd.none)

    Reply -> 
      (model, Cmd.none)

    Filter ->
      (model, Cmd.none)

    Send ->
      (model, Cmd.nones)
    


loginPage : Model -> Html Msg
loginPage model =
   let    
       if (color, message) = 
          (model.username == "user1" && model.password == "123")
          ("green", "OK")

         else 
          ("red", "Invalid login details.")
       
      ({ model | message = message}, Cmd.none)
   in


messagePage : Model -> Html Msg
messagePage model =
    div [ id "message" ]
        [ h1 ] [] [ text "Message" ]
                  [ textarea [ text "type your message/comment" ]
                  , button  [ onClick ( Filter "filter"), value "Filter" ] [ text "filter"]
                  , button  [ onClick ( Reply "delivered"), value "Reply" ] [ text "reply"]
                  , button  [ onClick ( Send "sent"), value "Send" ] [ text "send"]
                  ]
                  []       
           
-- View

view : Model -> Html Msg
view model =
  form [ id "login-form" ] 
       [ h1 [] [ text "Login Form" ]
       , label []
               [ text "username" ]
       , input [ id "username-filed"
               , type_ "text"
               , value model.username 
               ] 
               []
       , label [] 
               [ text "password: " ]
       , input [ id "password-field"
               , type_ "password"
               , value model.password              
               ]
               []
       , button [ onClick Login ] [ text "Login" ]
       , button [ onClick Logout ] [ text "Logout" ]
       ]




-- Subscriptions

subscriptions : Model -> Sub Msg
subscriptions model =
 Sub.none