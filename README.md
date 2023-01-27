# mermerd-docker

This Docker image is used to run the [mermerd](https://github.com/KarnerTh/mermerd) command-line tool, which can
transform database schemas into Mermaid diagrams. The image expects the user to mount their own mermerd configuration
file and a file to write the output Mermaid diagram to. When run, the container expects the user to provide a connection
string to connect to a database.

## Usage

**Create mermerd config**

Example: [mermerd.yaml](mermerd.yaml)

```shell
touch mermerd.yaml
```

**Create result file**

```shell
touch result.mmd
```

**Start mermerd interactively**

```shell
docker run --rm -it --net host --name mermerd \
    --mount type=bind,source="${PWD}"/mermerd.yaml,target=/root/.mermerd \
    --mount type=bind,source="${PWD}"/result.mmd,target=/root/result.mmd \
    ghcr.io/nedix/mermerd-docker \
    --connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"
```

## Development

1. Clone this repo
2. Execute the `make setup` command
3. Execute the `make run` command
