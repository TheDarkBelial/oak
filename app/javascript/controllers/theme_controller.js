import { Controller } from "@hotwired/stimulus"

export default class ThemeController extends Controller {
  static values = {
    token: String
  }

  connect() {
    this.#updateHtmlTheme()
  }

  tokenValueChanged() {
    this.#updateHtmlTheme()
  }

  #updateHtmlTheme() {
    document.documentElement.dataset.theme = this.tokenValue
  }
}
