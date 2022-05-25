import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card"
export default class extends Controller {
  static targets = ["content"]
  connect() {
  }

  showCard() {
    this.contentTarget.classList.add("active")
    console.log('active added')
    this.contentTarget.classList.remove("disable")
    console.log('disable removed')
    this.contentTarget
  }

  hideCard() {
    this.contentTarget.classList.remove("active")
    console.log('active removed')
    this.contentTarget.classList.add("disable")
    console.log('disable added')
  }
}
