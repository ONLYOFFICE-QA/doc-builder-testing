# Change log

## master (unreleased)

### New Features

* Add support of `markdownlint` in CI
* Add CI task to check code 100% documented
* Add Dockerfile for next release version and CI test for it
* Add `GitHub Action` task to push image to Docker Hub
* Add ability to make report for memory and time usage
* Ability to set Web Builder url via `WEB_BUILDER_URL`
* Add `yamllint` check in CI
* Add `dependabot` check for `GitHub Actions`
* Use `ruby-3.4` as project base
* Add portable version with license to secret
* Add ShellCheck linting in CI

### Changes

* Fix new warnings from `rubocop-performance` v1.8.0 update
* Skip pdf-related tests on Windows
* Split long spec files in smaller one
* Use `dependabot` config instead of old direct integration
* Changes from `rubocop` v1.4.0
* Fix compatibility with new color structure scheme in v6.3.0
* Remove `centos-8` checks because of it's EOL
* Actualize `pending` and `skip` state for different tests
* Remove `codeclimate` support since we don't use it any more
* Check `dependabot` at 8:00 Moscow time daily
* Changes from `rubocop-rspec` update to 2.9.0
* Fix `rubocop-1.28.1` code issues
* Actualize `debian-next-release` docker for version v7.2.0
* Move docker images from `onlyofficeqa` org to `onlyoffice`
* Add `gcc-c++` to `centos-7` dockerfile to fix compatibility with `rmagick-v5.4.1`
* Add script build arguments to `build_and_parse` method
* Change default builder location to '/usr/bin/onlyoffice-documentbuilder'

### Fixes

* Fix centos 8 dockerfile
* Run `rubocop` in CI through `bundle exec`
* Fix license checker warnings
* Fix issue where echo breaks XML formatting
* Fix using secrets in Debian environment
* Fix force overwrite of builder in portable installation
* Fix secret storage location to use $HOME/secret
* Fix spell checker in bash scripts
* Fix linting configuration to run on every push
* Fix rspec_critical command typo
