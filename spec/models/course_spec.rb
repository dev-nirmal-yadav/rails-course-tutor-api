require 'rails_helper'

RSpec.describe Course, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:tutors).dependent(:destroy) }
  end

  describe 'Nested Attributes' do
    it { is_expected.to accept_nested_attributes_for(:tutors) }
  end

  describe 'Validations' do
    subject { build(:course) }

    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:description) }

    it { is_expected.to validate_presence_of(:tutors) }

    it { is_expected.to validate_presence_of(:start_date) }

    it { is_expected.to validate_presence_of(:end_date) }

    it 'validates start_date format' do
      is_expected.to allow_value('2024-04-01').for(:start_date)

      subject.start_date = 'invalid_date'
      expect(subject).to_not be_valid
    end

    it 'validates end_date format' do
      is_expected.to allow_value(subject.start_date + 1).for(:end_date)

      subject.end_date = 'invalid_date'
      expect(subject).to_not be_valid
    end

    it 'validates end_date after start_date' do
      subject.end_date = '2024-04-01'
      expect(subject).not_to be_valid
      expect(subject.errors[:end_date]).to include("must be after the start date")

      subject.end_date = subject.start_date + 1
      expect(subject).to be_valid
      expect(subject.errors[:end_date]).to be_blank
    end
  end
end
