# mermerd-docker

## Setup

- Execute the `make setup` command

## Usage

**Create mermerd config**

```shell
touch mermerd.yaml
```

**Create result file to mount**

```shell
touch result.mmd
```

**Start mermerd interactively**

```shell
docker run --rm -it --net host \
    -v ${CURDIR}/mermerd.yaml:/root/.mermerd:ro \
    --mount type=bind,source="${PWD}"/result.mmd,target=/root/result.mmd \
    mermerd \
    --connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"
```
