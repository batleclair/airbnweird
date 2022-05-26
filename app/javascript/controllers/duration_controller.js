import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["startDate", "endDate", "totalPrice", "price"]

  connect() {
    console.log("Hello World!")
  }

  price() {
    const endDate = Date.parse(this.endDateTarget.value)
    const startDate = Date.parse(this.startDateTarget.value)
    const price = parseInt(this.priceTarget.innerHTML,10)
    if (endDate && startDate) {
      const duration = (endDate - startDate) / (86400000) + 1
      this.totalPriceTarget.innerHTML = `${duration * price}€`
    }
  }
}
