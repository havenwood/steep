# CHANGELOG

## master

## 0.5.1 (2018-08-11)

* Relax dependency requirements (#49, #50)

## 0.5.0 (2018-08-11)

* Support *lambda* `->` (#47)
* Introduce *incompatible* method (#45)
* Add type alias (#44)
* Steep is MIT license (#43)
* Improved block parameter typing (#41) 
* Support optional block
* Support attributes in module
* Support `:xstr` node
* Allow missing method definition with `steep check` without `--strict`

## 0.4.0 (2018-06-14)

* Add *tuple* type (#40)
* Add `bool` and `nil` types (#39)
* Add *literal type* (#37)

## 0.3.0 (2018-05-31)

* Add `interface` command to print interface built for given type
* Add `--strict` option for `check` command
* Fix `scaffold` command for empty class/modules
* Type check method definition with empty body
* Add `STDOUT` and `StringIO` minimal definition
* Fix validate command to load stdlib
* Fix parsing keyword argument type

## 0.2.0 (2018-05-30)

* Add `attr_reader` and `attr_accessor` syntax to signature (#33)
* Fix parsing on union with `any`
