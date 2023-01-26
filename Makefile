setup:
	@docker build . -t mermerd

run:
	@touch mermerd.yaml result.mmd
	@docker run --rm -it --net host \
    	--mount type=bind,source="${CURDIR}"/mermerd.yaml,target=/root/.mermerd \
		--mount type=bind,source="${CURDIR}"/result.mmd,target=/root/result.mmd \
		mermerd \
		--connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"
