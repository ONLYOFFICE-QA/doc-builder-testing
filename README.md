# docbuilder-testing

[![check](https://github.com/ONLYOFFICE-QA/doc-builder-testing/actions/workflows/check.yml/badge.svg)](https://github.com/ONLYOFFICE-QA/doc-builder-testing/actions/workflows/check.yml)

Framework for QA of `onlyoffice-documentbuilder`

## Configuration

`WEB_BUILDER_URL` - Set via Environmental Variables.
  Used to changed default url of Web Document Builder

## Windows

* Install native docbuilder to `C:\`

```shell
  bundle install
  rake run_test_on_win
```

## Project Information

[Official website](https://www.onlyoffice.com)

[Code repository](https://github.com/ONLYOFFICE/doc-builder-testing "https://github.com/ONLYOFFICE/doc-builder-testing")

[SaaS version](https://www.onlyoffice.com)

## License

### Running Tests with License

1. **Local testing:**

   Create environment variable with absolute path to license file:

   ```bash
     ONLYOFFICE_BUILDER_LICENSE=abs_path_to_licence.xml
   ```

2. **Docker testing:**

   Mount license file as a volume:

   ```bash
    docker run --rm \
      -v "$(pwd)/license/license.xml:/secrets/license.xml:ro" \
      doc-builder-testing
   ```
