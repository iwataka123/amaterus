import consumer from "channels/consumer"
// 「const appRoom =」を追記
const appRoom = consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const messages = document.getElementById('messages');
  messages.insertAdjacentHTML('beforeend', data['message']);
  },

  speak: function(message) {
    return this.perform('speak', {message: message});
  }
});

window.addEventListener("keypress", function(e) {
  if (e.key === 'Enter') {
    appRoom.speak(e.target.value);
    e.target.value = '';
    e.preventDefault();
  }
})