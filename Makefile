.PHONY: default
default: sitemap mirror pool

.PHONY: sitemap
sitemap:
	./make_sitemap > sitemap

.PHONY: mirror
mirror:
	wget --no-cookies --mirror --no-verbose --input-file=sitemap --wait=1 --user-agent="making a mirror"
	#for u in $$(cat sitemap); do wget --no-verbose --mirror $$u; sleep 0.5; done
	cp sitemap sitemap.mirrored

.PHONY: pool
pool:
	rm -rf pool/
	cp -r ajax.googleapis.com/ajax/libs/ pool/
	hardlink -t pool/

.PHONY: zip
zip:
	zip -r extension.zip manifest.json background.js pool/

