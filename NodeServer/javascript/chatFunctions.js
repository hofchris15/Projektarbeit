/**
 * local Storage for chat
 */

window.addEventListener("load", loadStorage, false);
window.attachEvent && window.attachEvent("onload", loadStorage);

function loadStorage() {
    if (typeof(Storage) !== "undefind") {
        if (localStorage.chatHistory) {
            var history = localStorage.chatHistory;
            var msgs = history.split(";");
            for (var i = 0; i < msgs.length; ++i) {
                $('#messages').append(msgs[i]);
                updateScroll();
            }
        } else {
            console.log("no history found, not necessary to do anything");
        }
    }
}

function storeChat() {
    if (typeof(Storage) !== "undefind") {
        updateScroll();
        var items = document.getElementById("messageField").getElementsByTagName("li");
        var history ="";
        for (var j = 0; j < items.length; ++j) {
            history += items[j].outerHTML;
            localStorage.chatHistory = history;
        }
    }
}

function updateScroll(){
    var element = document.getElementById("messageField");
    element.scrollTop = element.scrollHeight;
}