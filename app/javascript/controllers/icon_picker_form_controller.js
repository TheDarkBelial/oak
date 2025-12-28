import { Controller } from "@hotwired/stimulus"

export default class IconPickerFormController extends Controller {
  static targets = ["preview", "input", "modal"]

  showModal() {
    this.modalTarget.showModal()
  }

  closeModal() {
    this.modalTarget.close()
  }

  select(event) {
    let icon = event.currentTarget.querySelector(".icon")
    this.inputTarget.value = event.currentTarget.dataset.id
    this.previewTarget.innerHTML = icon.innerHTML
    this.modalTarget.close()
  }
}
