class CoursesController < ApplicationController
  def create
    course = Course.create!(course_params)
    render json: course, include: :tutors, status: :created
  end

  def index
    courses = Course.includes(:tutors)
    render json: courses, include: :tutors
  end

  private

  def course_params
    params.require(:course).permit(
      :name, :description, :start_date, :end_date,
      tutors_attributes: [:first_name, :last_name, :email]
    )
  end
end
