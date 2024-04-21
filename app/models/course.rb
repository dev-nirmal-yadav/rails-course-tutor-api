class Course < ApplicationRecord
  DATE_REGEX = /\A\d{4}-\d{2}-\d{2}\z/.freeze

  has_many :tutors, dependent: :destroy

  accepts_nested_attributes_for :tutors

  validates :name, :description, :tutors, presence: true
  validates :start_date, :end_date, presence: true,
    format: { with: DATE_REGEX, message: "must be in the format yyyy-mm-dd" }
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
