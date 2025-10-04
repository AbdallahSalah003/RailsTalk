import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="auto-scroll"
export default class extends Controller {
  static targets = ["scroll"]
  connect() {
    this.scrollToBottom()
  }
  scrollToBottom() {
    this.element.scrollTop = this.element.scrollHeight
  }

  scrollTargetConnected() {
    this.scrollToBottom()
  }
}
