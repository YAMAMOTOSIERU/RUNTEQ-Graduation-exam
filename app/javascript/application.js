import { Application } from "stimulus";
import "chartkick/chart.js";
import "@hotwired/turbo-rails";
import "./controllers";
import "./channels";

const application = Application.start();

console.log("こんにちは世界!");
