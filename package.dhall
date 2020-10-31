let Command = ./command.dhall

let Wait = ./wait.dhall

let Block = ./block.dhall

let Trigger = ./trigger.dhall

let Steps =
      < Wait : Wait.Type
      | Block : Block.Type
      | Command : Command.Type
      | Trigger : Trigger.Type
      >

let wait = Steps.Wait Wait.default

let Retry = ./retry.dhall

in  { Steps, Wait, Block, Command, Trigger, wait, Retry }
