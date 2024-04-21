# Rails Course Tutor API

This Rails project implements APIs to manage courses and their associated tutors.
1. Common POST API to create a course & its tutors
2. GET API to list all the courses along with their tutors

## Installation
Clone the repository:
```bash
git clone https://github.com/dev-nirmal-yadav/rails-course-tutor-api.git
cd rails-course-tutor-api.git
```

## Ruby version

Ruby (version 3.1.2)

## Configuration
Before running the application, make sure to configure your database settings in config/database.yml.

export ENV variable `RAILS_COURSE_TUTOR_API_DATABASE_PASSWORD` from bash to set the DB password.

`export RAILS_COURSE_TUTOR_API_DATABASE_PASSWORD='password'`


## Running local instructions

* Database creation

To create the database, run the following commands:

  `rails db:create`

* Database initialization

To initialize the database and run migrations, use the following command:

  `rails db:migrate`

* How to run the test suite

To run the RSpec test suite, execute the following command:

  `rspec`

## Usage

* Common POST API to create a course & its tutors

URL: `/courses`
Method: `POST`
Description: Creates a new course along with its associated tutors.
Request Body:

```json
{
  "course": {
    "name": "Course Name",
    "description": "Course Description",
    "start_date": "YYYY-MM-DD",
    "end_date": "YYYY-MM-DD",
    "tutors_attributes": [
      {
        "first_name": "Tutor1 First Name",
        "last_name": "Tutor1 Last Name",
        "email": "tutor@example.com"
      },
      {
        "first_name": "Tutor2 First Name",
        "last_name": "Tutor2 Last Name",
        "email": "tutor@example.com"
      }
    ]
  }
}
```

Response:

```json
{
    "id": 1,
    "name": "Course Name",
    "description": "Course Description",
    "start_date": "YYYY-MM-DD",
    "end_date": "YYYY-MM-DD",
    "tutors": [
        {
          "id": 1,
          "first_name": "Tutor1 First Name",
          "last_name": "Tutor1 Last Name",
          "email": "tutor@example.com"
        },
        {
          "id": 2,
          "first_name": "Tutor2 First Name",
          "last_name": "Tutor2 Last Name",
          "email": "tutor@example.com"
        }
    ]
}
```


2. GET API to list all the courses along with their tutors

URL: `/courses`
Method: `GET`
Description: Retrieves a list of all courses along with their associated tutors.
Response:

```json
[
  {
    "id": 1,
    "name": "Course Name",
    "description": "Course Description",
    "start_date": "YYYY-MM-DD",
    "end_date": "YYYY-MM-DD",
    "tutors": [
        {
          "id": 1,
          "first_name": "Tutor1 First Name",
          "last_name": "Tutor1 Last Name",
          "email": "tutor@example.com"
        },
        {
          "id": 2,
          "first_name": "Tutor2 First Name",
          "last_name": "Tutor2 Last Name",
          "email": "tutor@example.com"
        }
    ]
  }
]
```