let Command = ./command.dhall

let Wait = ./wait.dhall

let Block = ./block.dhall

let Trigger = ./trigger.dhall

let steps =
      < Wait : Wait.Type
      | Block : Block.Type
      | Command : Command.Type
      | Trigger : Trigger.Type
      >

in  { steps, Wait, Block, Command, Trigger }
