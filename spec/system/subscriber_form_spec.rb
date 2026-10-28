
require "rails_helper"

RSpec.describe "Subscriber form", type: :system do
  it "disables submission when the email is empty" do
    visit root_path

    expect(page).to have_button(
                    "JOIN THE WAITING LIST",
                    disabled: true
                    )
  end

  it "shows an error when an email without @ is entered" do
    visit root_path

    email_field = find_field("Your email")
    email_field.fill_in(with: "invalid-email")

    expect(page).to have_text(
                    "Please the email must have an @ character"
                    )

    expect(page).to have_button(
                    "JOIN THE WAITING LIST",
                    disabled: true
                    )
  end

  it "enables submission when the email contains @" do
    visit root_path

    email_field = find_field("Your email")
    email_field.fill_in(with: "gabriel@example.com")

    expect(page).to have_button(
                    "JOIN THE WAITING LIST",
                    disabled: false
                    )
  end

  it "submits a valid email and displays the thank-you page" do
    visit root_path

    find_field("Your email").fill_in(
    with: "gabriel@example.com"
    )

    find_field("Your name").fill_in(with: "Gabriel")

    click_button "JOIN THE WAITING LIST"

    expect(page).to have_text("Thank you!")
    expect(Subscriber.count).to eq(1)
  end
end
