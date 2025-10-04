import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  static classes = ["currentUser", "otherUser"]
  static values = { userId: String }

  connect() {
    let currentUserId = document.querySelector("meta[name='current-user-id']").content 

    if (this.userIdValue == currentUserId) {
      this.element.classList.add(...this.currentUserClasses)
    } else {
      this.element.classList.add(...this.otherUserClasses)
    }
  }
}
