# Backend Challenge

## Libs/technologies used
- Ruby 3.2
- dry struct - Initial idea was to use ruby new Data classes but dry struct also provide some type safety and coercions
- protobuf
- zeitwerk - code loader(also used in rails) - to avoid require_relative sprinkled all over the project

## Protobuf
to compile use command
```
protoc -I ./lib/ad_parameters/definitions/ --ruby_out ./lib/fyber/userconfiguration/ lib/ad_parameters/definitions/**/*.proto
```

## How to run

Install required gems with `bundle install`

ruby lib/ad_parameters example.xml


## Task description
Find original task description in backend_challenge.pdf - beware the quotations are wrong in pdf file.(Change them to `""` after copy-pasting)
