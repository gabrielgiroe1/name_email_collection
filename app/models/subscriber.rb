class Subscriber < ApplicationRecord
  before_validation :normalize_email

  validates :email,
            presence: {
            message: "Please provide an email before submitting the form"
            },
            format: {
            with: /@/,
            message: "Please the email must have an @ character"
            },
            uniqueness: { case_sensitive: true }


  private
  def normalize_email
    self.email = email.strip.downcase if email.present?
  end
end
