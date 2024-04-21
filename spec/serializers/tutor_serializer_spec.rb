# spec/serializers/tutor_serializer_spec.rb
require 'rails_helper'

RSpec.describe TutorSerializer, type: :serializer do
  let(:tutor) { create(:tutor) }
  let(:serializer) { described_class.new(tutor) }

  subject { ActiveModelSerializers::Adapter.create(serializer).as_json }

  it "includes the expected attributes" do
    expect(subject.keys).to match_array([:id, :first_name, :last_name, :email, :course])
  end

  it "serializes the tutor attributes correctly" do
    expect(subject[:id]).to eq(tutor.id)
    expect(subject[:first_name]).to eq(tutor.first_name)
    expect(subject[:last_name]).to eq(tutor.last_name)
    expect(subject[:email]).to eq(tutor.email)
  end

  it "includes course association" do
    expect(subject[:course]).to be_present
    expect(subject[:course][:id]).to eq(tutor.course.id)
  end
end
