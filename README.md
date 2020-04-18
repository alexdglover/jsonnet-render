# jsonnet-render

![Latest Release](https://img.shields.io/github/v/release/alexdglover/jsonnet-render?label=Latest%20Release)
![Examples](https://github.com/alexdglover/jsonnet-action/workflows/Examples/badge.svg?branch=master)

A GitHub action for executing Jsonnet. Typical usage will be to render Jsonnet files
and combine them with another GitHub action to:
* post the rendered result as a comment on a PR
* create a pull request or new commit with the rendered files

## Inputs

* `file` - specifies the Jsonnet file to be rendered. REQUIRED
* `output_file` - when set, writes the STDOUT from Jsonnet invocation to $output-file. OPTIONAL
* `output_dir` - when set, appends `-m $output_dir` to the Jsonnet invocation to render multiple output files to a single directory. OPTIONAL
* `plaintext` - when set to any value, Jsonnet is invoked with the `-S` flag to emit plaintext rather than JSON-encoded output.

## Output

This Action has no outputs.

## Usage

### Print to STDOUT

```yaml
steps:
  - id: jsonnet-render
    uses: alexdglover/jsonnet-render@v1
    with:
      file: path/to/file.jsonnet
```

### Render to file

```yaml
steps:
  - id: jsonnet-render
    uses: alexdglover/jsonnet-render@v1
    with:
      file: path/to/file.jsonnet
      output_file: output/file.json
```

### Render multiple files in a single directory

```yaml
steps:
  - id: jsonnet-render
    uses: alexdglover/jsonnet-render@v1
    with:
      file: path/to/file.jsonnet
      output_dir: output/
```
