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

in  Trigger
