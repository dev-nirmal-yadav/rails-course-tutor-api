require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        {
          course: {
            name: 'Test Course',
            description: 'Test Description',
            start_date: '2024-04-01',
            end_date: '2024-04-10',
            tutors_attributes: [
              { first_name: 'John', last_name: 'Doe', email: 'john@example.com' }
            ]
          }
        }
      end

      let(:create_course_response) {
        {
          'id' => Course.last.id,
          'name' => 'Test Course',
          'description' => 'Test Description',
          'start_date' => '2024-04-01',
          'end_date' => '2024-04-10',
          'tutors' => [
            { 'id' => Tutor.last.id, 'first_name' => 'John', 'last_name' => 'Doe', 'email' => 'john@example.com' }
          ]
        }
      }

      it 'creates a new course' do
        expect {
          post :create, params: valid_params
        }.to change(Course, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end

      it 'returns the created course with its tutors' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)

        expect(JSON.parse(response.body)).to include(create_course_response)
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          course: {
            description: 'Test Description',
            start_date: '2024-04-01',
            end_date: '2024-04-10',
            tutors_attributes: [
              { first_name: 'John', last_name: 'Doe', email: 'invalid_email' }
            ]
          }
        }
      end

      it 'does not create a new course' do
        expect {
          post :create, params: invalid_params
        }.to_not change(Course, :count)
      end

      it 'returns error message with unprocessable_entity response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)

        courses_response = JSON.parse(response.body)
        expect(courses_response['error']).to include('Invalid request')
        expect(courses_response['message']).to include('Tutors email is invalid')
      end

      it 'returns 400 if required parameters missing' do
        post :create, params: invalid_params.delete(:course)
        expect(response).to have_http_status(:bad_request)

        courses_response = JSON.parse(response.body)
        expect(courses_response['error']).to include('Invalid Parameters')
        expect(courses_response['message']).to include('param is missing or the value is empty: course')
      end
    end
  end

  describe 'GET #index' do
    it 'renders a JSON response with courses including tutors' do
      course = create(:course)
      tutor = course.tutors.last

      get :index
      expect(response).to have_http_status(:success)

      courses_response = JSON.parse(response.body)
      expect(courses_response.size).to eq(1)
      expect(courses_response[0]['tutors']).not_to be_empty

      expect(courses_response[0]).to include(
        'id' => course.id,
        'name' => course.name,
        'description' => course.description,
      )
      expect(courses_response.dig(0, 'tutors', 0)).to include(
        'id' => tutor.id,
        'first_name' => tutor.first_name,
        'last_name' => tutor.last_name,
        'email' => tutor.email
      )
    end
  end
end
