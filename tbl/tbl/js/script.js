

// Hàm chuyển đổi giữa các chủ đề tin nhắn
function selectTopic(topic) {
    selectedTopic = topic;
    document.querySelector('.chat-title').innerText = `# ${topic.charAt(0).toUpperCase() + topic.slice(1)}`;
    showMessages(topic);
}

function reloadMessages() {
    setTimeout(function () {
        loadMessages();
        reloadMessages();
    }, 2000);
}

window.onload = function () {
    reloadMessages();
};



