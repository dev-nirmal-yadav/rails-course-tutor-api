require 'rails_helper'

RSpec.describe Tutor, type: :model do
  describe 'Associations' do
    it { is_expected.to belong_to(:course) }
  end

  subject { build(:tutor) }

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }

    it { should allow_value('John').for(:first_name) }
    it { should allow_value('Doe').for(:last_name) }

    it { should_not allow_value('123').for(:first_name) }
    it { should_not allow_value('123').for(:last_name) }

    it { is_expected.to validate_presence_of(:email) }

    it { is_expected.to allow_value('test2@example.com').for(:email) }

    it { is_expected.to_not allow_value('invalid_email').for(:email) }

    it { expect(subject).to validate_uniqueness_of(:email).with_message(/'#{subject.email}' has already been taken/) }
  end
end
