import { Controller } from "@hotwired/stimulus"

export default class ThemeController extends Controller {
  static values = {
    slug: String
  }

  connect() {
    this.#updateHtmlTheme()
  }

  slugValueChanged() {
    this.#updateHtmlTheme()
  }

  #updateHtmlTheme() {
    document.documentElement.dataset.theme = this.slugValue
  }
}
