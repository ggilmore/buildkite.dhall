let Retry = { manual : { permit_on_passed : Bool } }

let Command =
      { Type =
          { name : Text
          , commands : List Text
          , agents : { queue : Text }
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

let Wait = { Type = { wait : Text }, default.wait = "~" }

let Block =
      { Type = { block : Text, branches : Optional Text }
      , default.branches = None Text
      }

let Trigger =
      { Type =
          { trigger : Text
          , label : Text
          , branches : Optional Text
          , build :
              { message : Text
              , commit : Text
              , branch : Text
              , env :
                  { BUILDKITE_PULL_REQUEST : Text
                  , BUILDKITE_PULL_REQUEST_BASE_BRANCH : Text
                  , BUILDKITE_PULL_REQUEST_REPO : Text
                  }
              }
          }
      , default =
        { branches = None Text
        , build =
          { message = "\${BUILDKITE_MESSAGE}"
          , commit = "\${BUILDKITE_COMMIT}"
          , branch = "\${BUILDKITE_BRANCH}"
          , env =
            { BUILDKITE_PULL_REQUEST = "\${BUILDKITE_PULL_REQUEST}"
            , BUILDKITE_PULL_REQUEST_BASE_BRANCH =
                "\${BUILDKITE_PULL_REQUEST_BASE_BRANCH}"
            , BUILDKITE_PULL_REQUEST_REPO = "\${BUILDKITE_PULL_REQUEST_REPO}"
            }
          }
        }
      }

let steps =
      < Wait : Wait.Type
      | Block : Block.Type
      | Command : Command.Type
      | Trigger : Trigger.Type
      >

in  { steps, Wait, Block, Command, Trigger }
