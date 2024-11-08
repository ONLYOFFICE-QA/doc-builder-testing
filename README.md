# docbuilder-testing

Framework for QA of `onlyoffice-documentbuilder`

## Configuration

`WEB_BUILDER_URL` - Set via Environmental Variables.
  Used to changed default url of Web Document Builder

## Conversion test coverage matrix

| Input format | Output format |       |      |      |      |      |     |      |     |     |     |      |     |     |
|--------------|---------------|-------|------|------|------|------|-----|------|-----|-----|-----|------|-----|-----|
|              | docx          | docxf | docm | dotm | dotx | epub | fb2 | html | odt | ott | pdf | pdfa | rtf | txt |
| docx         | *             | *     | *    | *    | *    | *    | *   | *    | *   | *   | *   | *    | *   | *   |

## Project Information

[Official website](https://www.onlyoffice.com)

[Code repository](https://github.com/ONLYOFFICE/doc-builder-testing "https://github.com/ONLYOFFICE/doc-builder-testing")

[SaaS version](https://www.onlyoffice.com)

## License

docbuilder-testing is released under an GNU AGPL v3.0 license.
See the LICENSE file for more information.

## install via windows

* Install desktop builder to `C:\`

* Install dependencies

```shell
  bundle install
```

* Run test

```shell
  rake run_test_on_win
```
