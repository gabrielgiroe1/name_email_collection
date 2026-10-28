
require "rails_helper"

RSpec.describe Subscriber, type: :model do
  describe "validations" do
    it "requires an email" do
      subscriber = Subscriber.new(email: "")

      expect(subscriber).not_to be_valid
      expect(subscriber.errors[:email]).to include(
                                           "Please provide an email before submitting the form")
    end

    it "requires an email containing @" do
      subscriber = Subscriber.new(email: "invalid-email")

      expect(subscriber).not_to be_valid
      expect(subscriber.errors[:email]).to include(
                                           "Please the email must have an @ character")
    end

    it "accepts an email containing @" do
      subscriber = Subscriber.new(email: "gabriel@example.com")

      expect(subscriber).to be_valid
    end

    it "does not allow duplicate emails" do
      Subscriber.create!(email: "gabriel@example.com")

      duplicate = Subscriber.new(email: "gabriel@example.com")

      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:email]).to include("has already been taken")
    end
  end

  describe "email normalization" do
    it "removes surrounding whitespace and converts the email to lowercase" do
      subscriber = Subscriber.new(email: "  Gabriel@Example.COM  ")

      subscriber.valid?

      expect(subscriber.email).to eq("gabriel@example.com")
    end
  end
end
