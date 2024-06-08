import { formatMessages } from "esbuild";
import consumer from "./consumer";

consumer.subscriptions.create("ChatChannel", {
  connected() {},

  disconnected() {},

  received(data) {
    const messages = document.getElementById("messages");
    messages.innerHTML += "<p>${data.message}</p>";
  },

  speak: function (message) {
    return this.perform("speak", { message: message });
  },
});

document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("message_content");
  const button = document.querySelector('input[type="submit"]');

  button.addEventListener("click", (e) => {
    e.preventDefault();
    const message = input.value;
    chatChannel.speak(message);
    input.value = "";
  });
});
