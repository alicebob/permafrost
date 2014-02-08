.PHONY: pool
pool:
	./update_pool

.PHONY: urls
urls:
	curl -s https://developers.google.com/speed/libraries/devguide | ./generate_urls  > urls 
