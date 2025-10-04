import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = ["sidebar"]
  connect() {
    this.sidebarOpened = false 
  }
  sidebarTargetConnected() {
    this.toggleClass()
  }
  toggle(e) {
    if(!e.params.skipPrevent) {
      e.preventDefault() 
    }
    this.sidebarOpened = !this.sidebarOpened
    this.toggleClass()
  }

  toggleClass() {
    this.sidebarTargets.forEach((target) => {
      if(this.sidebarOpened) {
        target.classList.remove("hidden")
      } else {
        target.classList.add("hidden")
      }
    })
  }
}
