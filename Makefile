.PHONY: pool
pool:
	./update_pool

.PHONY: zip
zip:
	zip -r extension.zip manifest.json background.js pool/
