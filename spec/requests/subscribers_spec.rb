
require "rails_helper"

RSpec.describe "Subscribers", type: :request do
  describe "POST /subscribers" do
    let(:valid_attributes) do
      {
      subscriber: {
      name: "Gabriel",
      email: "gabriel@example.com"
      }
      }
    end

    it "creates a subscriber and redirects to the thank-you page" do
      expect {
        post subscribers_path, params: valid_attributes
      }.to change(Subscriber, :count).by(1)

      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to(thank_you_path)
    end

    it "does not create a subscriber when the email is missing" do
      expect {
        post subscribers_path,
             params: {
             subscriber: {
             name: "Gabriel",
             email: ""
             }
             }
      }.not_to change(Subscriber, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "does not create a subscriber when the email has no @" do
      expect {
        post subscribers_path,
             params: {
             subscriber: {
             name: "Gabriel",
             email: "invalid-email"
             }
             }
      }.not_to change(Subscriber, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end

    it "redirects to thank-you without creating a duplicate" do
      Subscriber.create!(email: "gabriel@example.com")

      expect {
        post subscribers_path,
             params: {
             subscriber: {
             name: "Another Name",
             email: "  GABRIEL@example.com  "
             }
             }
      }.not_to change(Subscriber, :count)

      expect(response).to have_http_status(:see_other)
      expect(response).to redirect_to(thank_you_path)
    end
  end

  describe "GET /subscribers/new" do
    it "renders the subscription form" do
      get new_subscriber_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe "GET /thank_you" do
    it "renders the thank-you page" do
      get thank_you_path

      expect(response).to have_http_status(:ok)
    end
  end
end
