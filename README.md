# [mermerd]-container

Create [Mermaid] ERD diagrams from database schemas.

## Setup

#### Create an output file

```shell
touch output.mmd
```

#### (Optional) Create a [mermerd configuration] file

See [examples/mermerd-config.yaml](https://github.com/nedix/mermerd-container/blob/main/examples/mermerd-config.yaml)

## Usage

#### Run the [mermerd] command-line interface

This example command connects to a MySQL server running on localhost port 3306.
Replace `root:` with your `username:password` combination.

```shell
docker run --pull always --rm -it --name mermerd \
    --net host \
    --mount type=bind,source="${PWD}"/output.mmd,target=/root/result.mmd \
    --mount type=bind,source="${PWD}"/mermerd-config.yaml,target=/root/.mermerd \ # optional
    nedix/mermerd \
    --connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"
```

<hr>

## Attribution

Powered by [mermerd].

[mermaid]: https://mermaid.js.org
[mermerd]: https://github.com/KarnerTh/mermerd
[mermerd configuration]: https://github.com/KarnerTh/mermerd?tab=readme-ov-file#global-configuration-file
