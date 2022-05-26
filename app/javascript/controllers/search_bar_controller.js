import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {
  static targets = [ "input", "icon" ]

  connect() {
    console.log('connected to search bar')
    console.log(this.iconTarget)
  }

  expand() {
    alert('expand me')
  }

  clearInput = () => {
    this.inputTarget.value = ""
  }
}
