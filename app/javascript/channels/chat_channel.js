import consumer from "./consumer";

const chatChannel = consumer.subscriptions.create("ChatChannel", {
  connected() {
    console.log("Connected to ChatChannel");
  },

  disconnected() {
    console.log("Disconnected from ChatChannel");
  },

  received(data) {
    console.log("Received data:", data);
    if (data.message) {
      const messagesContainer = document.getElementById("messages");
      messagesContainer.insertAdjacentHTML("beforeend", data.message);
    } else if (data.error) {
      console.error("Error:", data.error);
    }
  },
});

document.addEventListener("turbo:load", () => {
  const form = document.getElementById("chat-form");
  const input = document.getElementById("chat-input");

  if (form) {
    form.addEventListener("submit", (e) => {
      e.preventDefault();
      const message = input.value.trim();
      if (message.length > 0) {
        chatChannel.perform("receive", { message: message });
        input.value = "";
      }
    });
  }
});
