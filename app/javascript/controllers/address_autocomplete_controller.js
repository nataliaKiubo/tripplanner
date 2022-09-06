import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="address-autocomplete"
export default class extends Controller {
  static values = { apiKey: String }

  static targets = ["address"]

  connect() {

    const suggestions = document.querySelectorAll(".suggestions-wrapper")

    suggestions.forEach((wrapper) => {
      window.addEventListener("load", (event) => {
        wrapper.classList.add("d-none")
      })
    })

    const addressField = document.querySelectorAll(".mapboxgl-ctrl")

    addressField.forEach((field) => {
      field.addEventListener("keyup", (event) => {

        suggestions.forEach((suggestion) => {
          suggestion.classList.remove("d-none")
        })

      })
    })

    this.geocoder = new MapboxGeocoder({
      accessToken: this.apiKeyValue,
      types: "country,region,place,postcode,locality,neighborhood,address"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    this.geocoder.query(this.addressTarget.value);
  }

  #setInputValue(event) {
    this.addressTarget.value = event.result["place_name"]
  }

  #clearInputValue() {
    this.addressTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }
}
