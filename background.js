function onBeforeRequestHandler(details) {
    var match = details.url.match(/ajax.googleapis.com\/ajax\/libs\/(.*)/);
    if (! match) {
        // Not for us.
        return { "cancel": false };
    }
    var url = chrome.extension.getURL("/pool/" + match[1]);
    // console.log("Permafrost serving: ", details.url);
    return { "redirectUrl": url };

}

chrome.webRequest.onBeforeRequest.addListener(
    onBeforeRequestHandler,
    {
        "urls": [
            "*://ajax.googleapis.com/ajax/libs/*"
        ]
    },
    [ "blocking" ]
);
