# cflint-action

~~Easily~~ integrate CFLint with your normal GitHub actions workflows. Source: [CFLint](https://github.com/cflint/CFLint)

## Inputs

<details>

  <summary>Scan a folder</summary>

CFLint has many options when it comes to scanning different folders/files, formatting output, and more. However, at this time our action only executes a very simple command, quietly scanning a given directory and outputting the default `cflint-result.html` in the current directory.

```bash
java -jar CFLint-1.5.0-all.jar -q -folder <folder-to-lint>
```

| name | required | description |
| :-- | :-- | :-- |
| `folder-to-lint` | `true` | The directory to scan when executing the cflint .jar. If using actions/checkout@v3 then this is simply `.` |
</details>
  
## Outputs

<details>

  <summary>cflint-result.html</summary>
  
The location of the output by default is within `/target`. However, within the GitHub actions environment, even without specifying the output file's location `cflint-result.html` is written into the current working directory. So if you use `actions/checkout` within your workflow, then your lint results file will be within `$GITHUB_WORKSPACE`. 
</details>
  
## Example usage

<details>
  
  <summary>Scan folder and email results</summary>
  
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
    - name: Send mail
      uses: dawidd6/action-send-mail@v3
      with:
        other params: here
        html_body: file://cflint-result.html
```
</details>
  
# Contributing
  
Fork and pull away! There is no clear direction for this project yet, or a contributing policy.
  
<details>
  
  <summary>Goals</summary>
  
* Clone from the source - [CFLint](https://github.com/cflint/CFLint) during build
* Get list of changed directories and files for linting rather than entire codebase or specific directory
* Improve debugging when executing with `-d` flag / general improvements (any) to stdout while linting to provide linting information w/out requiring email
  
</details>
