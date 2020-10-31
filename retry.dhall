let ManualRetry =
      { manual :
          { allowed : Optional Bool
          , permit_on_passed : Optional Bool
          , reason : Optional Text
          }
      }

let AutoRetryConfig =
      { exit_status : Optional Integer, limit : Optional Natural }

let AutoRetry = { automatic : List AutoRetryConfig }

let Retry = < Manual : ManualRetry | Auto : AutoRetry >

in  Retry
