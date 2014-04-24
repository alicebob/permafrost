.PHONY: default
default: sitemap mirror pool

.PHONY: sitemap
sitemap:
	./make_sitemap > sitemap

.PHONY: mirror
mirror:
	#wget --mirror --no-verbose --input-file=sitemap
	for u in $$(cat sitemap); do wget --no-verbose --mirror $$u; sleep 0.5; done

.PHONY: pool
pool:
	rm -rf pool/
	cp -r ajax.googleapis.com/ajax/libs/ pool/
	hardlink -t pool/

.PHONY: zip
zip:
	zip -r extension.zip manifest.json background.js pool/

