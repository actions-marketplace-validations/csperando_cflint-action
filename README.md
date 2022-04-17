# cflint-action

Easily integrate CFLint with your normal GitHub actions workflows. This is based on the [CFLint project]().

## Inputs

CFLint has many options when it comes to scanning folders/files and executing the linting .jar file. However, at this time our docker container only executes the .jar using the -folder tag:

```bash
java -jar CFLint-1.5.0-all.jar -folder <folder-to-lint>
```

| name | required | description |
| :-- | :-- | :-- |
| `folder-to-lint` | `true` | the directory to scan when executing the cflint .jar |

## Outputs

Within `target/` the results are compiled into `cflint-result.html`. The content of this file is then passed as an output after removing newline characters.

## Example usage

```yaml
name: Java CI with Maven

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:

  CFLint:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3

    - name: Lint Codebase
      id: lint
      uses: csperando/cflint-action@v1
      with:
        folder-to-lint: .

    # optional: email lint report
    # - name: Send mail
    #   uses: dawidd6/action-send-mail@v3
    #   with:
    #     server_address: smtp.gmail.com
    #     server_port: 465
    #     username: ${{secrets.username}}
    #     password: ${{secrets.password}}
    #     subject: CFLint Report Attached
    #     to: email@email.email
    #     from: email@email.email
    #     html_body: "${{ steps.lint.outputs.results }}"
```
