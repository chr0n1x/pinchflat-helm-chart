# pinchflat-helm-chart

VERY simple helm chart for installing pinchflat.

I use the default image for pinchflat. For more information, check out [the repo/docs](https://github.com/kieraneglin/pinchflat)

# TODO

- actually use `helm` default values like `.Chart.Name` for various fields.
- probably a lot more; general things required for productionization.
- migrate towards using `StatefulSet`s
- ~~actually use github actions properly. I currently run `make` locally and it "just works" <sup>tm</sup>~~ ✅
- ~~create a config map for configurations~~ ✅ supporting both `/downloads` and `/config` as of `0.2.4`

# Help Needed/Welcome via PRs

- ~~I have no idea how to use github actions to update/push charts and run `make` locally (see `Makefile` for the build process). This runs the helm release plugin and pushes the chart tar files up, which then triggers the gh-pages build. That being said, this would ideally be completely replaced via GitHub actions, but I currently don't have time. Would love a PR implementing this 😍 I understand that having the build process public is important for trust/auditing, so apologies for not having this in place!~~
- I highly dislike helm so never got around to learning "best-practices", especially around things like `.Chart.Name` built-in vars. Would love help with standardizing some things, without over-complicating the chart itself.

# FAQ

- **What's the long term plan for this repo?** I personally use this chart in my home k8s cluster so I will update it based on my own use cases. I _do_ get GitHub notifications through a variety of means/ways so PRs/contributions are welcome!
- **Why this repo? Where's the official chart?** [per @kieraneglin here](https://github.com/kieraneglin/pinchflat/issues/653), an official helm chart is _not_ in the works. That being said, this tool is great so I'm happy to provide support in my spare time!
