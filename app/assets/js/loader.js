window.onload = sendRequest;
var request = null;

function sendRequest() {
    boundEvent();
    request = new XMLHttpRequest();
    request.open("post", "https://andruxnet-random-famous-quotes.p.mashape.com/?cat=famous", true);
    request.setRequestHeader("X-Mashape-Key", "cUxrtRmWlomshMDWsSwxurBLEMwyp12g3ZXjsnHYDn96wizhCD");
    request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    request.setRequestHeader("Accept", "application/json")
    request.send();
    request.onreadystatechange = getResponse;
}

function getResponse() {
    if (request.readyState === 4) {
        var data = JSON.parse(request.response);

        var card = document.getElementsByClassName('card-title')[0];
        var quote = data.quote;
        var author = data.author;
        card.innerHTML = quote;

        card = document.getElementsByClassName('right');
        card[0].innerHTML = '-' + author;

        //var lin = document.getElementsByClassName('right')[1];
        card[1].href = 'https://twitter.com/home/?status' + quote;
        card[1].target = "_blank";
    }

    var b = document.getElementsByTagName('body')[0];
    b.className = "loaded indigo lighten-3";
    return false;
}

function boundEvent() {
    var btn = document.getElementsByClassName('btn')[0];
    btn.onclick = sendRequest;
}