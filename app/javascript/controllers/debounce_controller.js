import { Controller } from "@hotwired/stimulus"

export default class DebounceController extends Controller {
  static WAIT = 250

  connect() {
    this.timeout = null
  }

  submit() {
    if (this.timeout) clearTimeout(this.timeout)

    this.timeout = setTimeout(() => this.#requestSubmit(), DebounceController.WAIT)
  }

  #requestSubmit() {
    this.element.requestSubmit();
  }
}
