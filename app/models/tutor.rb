class Tutor < ApplicationRecord
  VALID_NAME_REGEX = /\A[a-z ,.'-]+\z/i.freeze

  belongs_to :course

  validates :first_name, :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :email, presence: true,
    uniqueness: { message: ->(object, data) { "'#{data[:value]}' has already been taken" }},
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
