function onBeforeRequestHandler(details) {
    local = map[details.url];
    if (! local) {
        console.log("Permafrost missing: ", details.url);
        // Don't show anything if we don't have the file.
        return { "cancel": true };
    };
    var url = chrome.extension.getURL("/pool/" + local);
    console.log("Permafrost serving: ", details.url);
    return { "redirectUrl": url };

}

chrome.webRequest.onBeforeRequest.addListener(
    onBeforeRequestHandler,
    {
        "urls": [
            "*://ajax.googleapis.com/*"
        ]
    },
    [ "blocking" ]
);
