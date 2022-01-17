# Change log

## master (unreleased)

### New Features

* Add support of `markdownlint` in CI
* Add CI task to check code 100% documented
* Add Dockerfile for next release version and CI test for it
* Add `GitHub Action` task to push image to Docker Hub
* Add ability to make report for memory and time usage
* Ability to set Web Builder url via `WEB_BUILDER_URL`

### Changes

* Fix new warnings from `rubocop-performance` v1.8.0 update
* Skip pdf-related tests on Windows
* Split long spec files in smaller one
* Use `dependabot` config instead of old direct integration
* Changes from `rubocop` v1.4.0
* Fix compatibility with new color structure scheme in v6.3.0
* Remove `centos-8` checks because of it's EOL
* Actualize `pending` and `skip` state for different tests

### Fixes

* Fix centos 8 dockerfile
