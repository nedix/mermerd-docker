# [mermerd-container](https://github.com/nedix/mermerd-container)

Create [Mermaid] ERD diagrams from live databases.

## Usage

#### 1. Create an output file

```shell
touch output.mmd
```

#### 1. (Optional) Create a mermerd configuration file

See 
[documentation](https://github.com/KarnerTh/mermerd?tab=readme-ov-file#global-configuration-file)
and
[examples/mermerd-config.yaml](https://github.com/nedix/mermerd-container/blob/main/examples/mermerd-config.yaml)
.

#### 2. Run the mermerd command-line interface

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
