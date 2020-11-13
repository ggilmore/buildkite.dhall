# buildkite.dhall

[![Build status](https://badge.buildkite.com/5dc8c0958e280733d589ff14946e2fbdd301c053b08ac02da5.svg)](https://buildkite.com/jcouyang/buildkite-dot-dhall)

Compat to `dhall-to-json 1.6.4`

## Get Started
make sure buildkite agent has `dhall-to-json 1.6.4`(if not download it [here](https://github.com/dhall-lang/dhall-haskell/releases/tag/1.32.0)) then config your buildkite pipeline to:
```
dhall-to-yaml <  .buildkite/pipeline.dhall | buildkite-agent pipeline upload
```

The [pipeline.dhall](./.buildkite/pipeline.dhall) itself is test and example

essentially you may need remote import the package in your `.buildkite/pipeline.dhall`

```dhall
let bk = https://raw.githubusercontent.com/jcouyang/buildkite.dhall/0.1.0/package.dhall
```
