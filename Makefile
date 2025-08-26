default: dockerized

dockercmd := docker run --rm -v $(shell pwd):/workspace -w /workspace
image := quay.io/helmpack/chart-releaser:v1.7.0
cr_gh_flags := --owner chr0n1x --git-repo pinchflat-helm-chart --token $(GITHUB_TOKEN) --remote origin-https


prep-git:
	git config --global --add safe.directory /workspace
	git remote add origin-https https://github.com/chr0n1x/pinchflat-helm-chart || :
	git fetch origin-https || :

package:
	cr package . --package-path docs

index:
	@cr index $(cr_gh_flags) --index-path docs --package-path docs

upload:
	@cr upload $(cr_gh_flags) --skip-existing --package-path docs

dockerized:
	$(dockercmd) \
		-e GITHUB_TOKEN \
		--entrypoint sh $(image) -c 'apk add make && make prep-git package upload index'
	# Im just dumb lul
	sudo chown -R $(USER):$(USER) .
	git add . && git commit -m 'chore: bump version'
	git push origin HEAD
