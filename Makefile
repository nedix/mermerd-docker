setup:
	@docker build -f Containerfile -t mermerd .

run:
	@touch output.mmd
	@docker run --rm -it --net host \
		--mount type=bind,source="$(CURDIR)"/examples/mermerd-config.yaml,target=/root/.mermerd \
		--mount type=bind,source="$(CURDIR)"/output.mmd,target=/root/result.mmd \
		mermerd \
		--runConfig "/root/.mermerd" \
		--connectionString "mysql://root:@tcp(host.docker.internal:3306)/mysql"

test:
	@$(MAKE) setup
	@tests/index.sh
