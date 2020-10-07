let bk = ./package.dhall

let main = "master"

in  [ bk.steps.Command
        bk.Command::{ name = ":scala:", commands = [ "echo yay" ] }
    , bk.steps.Wait bk.Wait.default
    , bk.steps.Command
        bk.Command::{
        , name = ":shipit:"
        , commands = [ "echo yay" ]
        , branches = Some main
        }
    ]
