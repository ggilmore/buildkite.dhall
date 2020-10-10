let Map =
      https://prelude.dhall-lang.org/v18.0.0/Map/Type sha256:210c7a9eba71efbb0f7a66b3dcf8b9d3976ffc2bc0e907aadfb6aa29c333e8ed

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
              { message : Optional Text
              , commit : Optional Text
              , branch : Optional Text
              , env : Map Text Text
              }
          }
      , default =
        { branches = None Text
        , build =
          { message = Some "\${BUILDKITE_MESSAGE}"
          , commit = Some "\${BUILDKITE_COMMIT}"
          , branch = Some "\${BUILDKITE_BRANCH}"
          , env = toMap
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
