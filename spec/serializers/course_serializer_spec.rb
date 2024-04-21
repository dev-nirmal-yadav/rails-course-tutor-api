require 'rails_helper'

RSpec.describe CourseSerializer, type: :serializer do
  let(:course) { create(:course) }
  let(:serializer) { described_class.new(course) }

  subject { ActiveModelSerializers::Adapter.create(serializer).as_json }

  it 'includes the expected attributes' do
    expect(subject.keys).to match_array([:id, :name, :description, :start_date, :end_date, :tutors])
  end

  it 'serializes the course attributes correctly' do
    expect(subject[:id]).to eq(course.id)
    expect(subject[:name]).to eq(course.name)
    expect(subject[:description]).to eq(course.description)
    expect(subject[:start_date]).to eq(course.start_date)
    expect(subject[:end_date]).to eq(course.end_date)
  end

  it 'includes tutors association' do
    expect(subject[:tutors]).to be_present
    expect(subject[:tutors].size).to eq(course.tutors.size)
  end
end
