let Retry = { manual : { permit_on_passed : Bool } }

let Command =
      { Type =
          { name : Text
          , commands : List Text
          , agents : Optional { queue : Text }
          , retry : Optional Retry
          , branches : Optional Text
          , artifact_paths : Optional (List Text)
          }
      , default =
        { retry = None Retry
        , branches = None Text
        , agents = None { queue : Text }
        , artifact_paths = None (List Text)
        }
      }

in  Command
