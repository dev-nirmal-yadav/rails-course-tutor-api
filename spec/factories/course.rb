FactoryBot.define do
  factory :course do
    name { Faker::Educator.course_name }
    description { Faker::Lorem.sentence }
    start_date { Faker::Date.between(from: Date.today, to: 1.year.from_now) }
    end_date { Faker::Date.between(from: start_date + 1, to: start_date + 1.year) }

    after(:build) do |course|
      course.tutors << build(:tutor, course: course)
    end
  end
end