// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'
import './src/application.scss'
import Turbolinks from 'turbolinks'
Turbolinks.start()
import Sortable from 'sortablejs'

document.addEventListener('turbolinks:load', () => {
  $('[data-toggle="tooltip"]').tooltip()
  addSorting()
})

function addSorting() {
  const sortableTable = document.getElementById('sortable')
  if(sortableTable) Sortable.create(sortableTable, { onEnd: reorderRows })

  function reorderRows(event) {
    if(event.oldIndex === event.newIndex) return

    const newPosition = event.newIndex + 1
    const itemId = event.item.id
    const csrfToken = document.querySelector("[name='csrf-token']").content
    writeNotice('Reordering list...')

    fetch(itemId, {
      method: 'PATCH',
      headers: {
        'X-CSRF-Token': csrfToken,
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ insert_at: newPosition })
    }).then(() => writeNotice('Successfully reordered.'))
      .catch(() => writeNotice('Failed to reorder'))
      .finally(() => setTimeout(() => writeNotice(''), 5000))
  }

  function writeNotice(message) {
    const notice = document.getElementById('notice')
    if(notice) notice.innerText = message
  }
}
