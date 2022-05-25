import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {
  static targets = ["content", "image"]
  connect() {
  }

  showCard() {
    this.contentTarget.classList.add("active")
    this.contentTarget.classList.remove("disable")
    this.imageTarget.classList.add("disable")
  }

  hideCard() {
    this.contentTarget.classList.remove("active")
    this.contentTarget.classList.add("disable")
    this.imageTarget.classList.remove("disable")
    this.imageTarget.classList.add("active")
  }
}
