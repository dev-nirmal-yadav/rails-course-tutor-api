class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :start_date, :end_date
  has_many :tutors
end