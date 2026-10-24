import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["email", "error", "submit"]
  connect() {
    this.touched = false
    this.validate()
  }

  validate() {
    const email = this.emailTarget.value.trim()

    let message = ""

    if (email.length === 0) {
      message = "Please provide an email before submitting the form"
    } else if (!email.includes("@")) {
      message = "Please the email must have an @ character"
    }

    const valid = message === ""
    const showError = this.touched && !valid

    this.submitTarget.disabled = !valid
    this.emailTarget.setAttribute("aria-invalid", String(showError))

    // Show the error once the user starts interacting with the field.
    this.errorTarget.textContent = showError ? message : ""

    this.emailTarget.classList.toggle("border-red-500", showError)

    this.emailTarget.classList.toggle("border-slate-300", !showError)

    return valid
  }

  revealError() {
    this.touched = true
    this.validate()
  }

  validateSubmit(event) {
    this.touched = true

    if (!this.validate()) {
      event.preventDefault()
      this.emailTarget.focus()
    }
  }
}
