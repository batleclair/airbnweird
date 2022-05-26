import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello World!")
  }

  static targets = ["startDate", "endDate", "totalPrice"]

  price() {
    endDate = this.endDateTarget.value
    startDate = this.startDateTarget.value
    if (endDate && startDate) {
      this.priceTarget.innerHtml = endDate - startDate
    }
  }
}
