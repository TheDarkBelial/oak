// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

/**
 * TODO: FIGURE OUT WHY IMPORTMAP IS NOT LOADING FROM THE "controllers" FOLDER.
 * THIS IS A TEMPORARY WORKAROUND.
 */
import StimulusSortable from "stimulus-sortable"
application.register('sortable', StimulusSortable)

import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"
import { patch } from "@rails/request.js"

class SortableBookmark extends Controller {
  connect() {
    this.sortable = new Sortable(this.element, {
      group: "bookmarks",
      animation: 100,
      onAdd: this.#onChange.bind(this),
      onUpdate: this.#onChange.bind(this)
    })
  }

  disconnect() {
    this.sortable.destroy()
    this.sortable = undefined
  }

  async #onChange({ item, to, newIndex }) {
    const data = new FormData()
    data.append("bookmark[position]", newIndex + 1)
    data.append("bookmark[category_id]", to.dataset.id)

    console.log(item.dataset.url)
    console.log(data)
    return await patch(item.dataset.url, { body: data, responseKind: "html" })
  }
}

application.register("sortable-bookmark", SortableBookmark)
