import { Application } from "stimulus";
import "chartkick/chart.js";
import "@hotwired/turbo-rails";
import "./controllers";
import "./channels";

const application = Application.start();

console.log("こんにちは世界!");

document.addEventListener("turbo:load", function () {
  // Bootstrap のドロップダウンを初期化
  var dropdownElementList = [].slice.call(
    document.querySelectorAll(".dropdown-toggle")
  );
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl);
  });
});
