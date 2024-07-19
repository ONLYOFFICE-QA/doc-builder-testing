#!/bin/bash

onlyoffice-documentbuilder -v
cd /doc-builder-testing
rake rspec_critical
