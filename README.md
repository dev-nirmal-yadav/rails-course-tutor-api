# Rails Course Tutor API

This Rails project implements APIs to manage courses and their associated tutors.
1. Common POST API to create a course & its tutors
2. GET API to list all the courses along with their tutors

### Installation

Clone the repository:

```bash
git clone https://github.com/dev-nirmal-yadav/rails-course-tutor-api.git
cd rails-course-tutor-api.git
```

### Requirements

  * Ruby **3.1.2**

### Configuration

**Create a `.env` file**: In the root directory of your Rails application, create a file named `.env` and define below environment variables inside it.

```
DATABASE_USERNAME=db_user_name
DATABASE_PASSWORD=db_password
```

### Running local instructions

**Database creation**

To create the database, run the following commands:

  `rails db:create`

**Database initialization**

To initialize the database and run migrations, use the following command:

  `rails db:migrate`

**How to run the test suite**

To run the RSpec test suite, execute the following command:

  `rspec`

### Usage

**Common POST API to create a course & its tutors**

- URL: `localhost:3000/courses`
- Method: `POST`
- Description: Creates a new course along with its associated tutors.
- Request (cURL):

```bash
curl --location 'localhost:3000/courses' \
--header 'Content-Type: application/json' \
--data-raw '{
  "course": {
    "name": "Course Name",
    "description": "Course Description",
    "start_date": "2024-04-21",
    "end_date": "2024-05-21",
    "tutors_attributes": [
      {
        "first_name": "First Name",
        "last_name": "Last Name",
        "email": "tutor@example.com"
      },
      {
        "first_name": "First Name",
        "last_name": "Last Name",
        "email": "tutor@example.com"
      }
    ]
  }
}'
```

- Response:

```json
{
  "id": 1,
  "name": "Course Name",
  "description": "Course Description",
  "start_date": "2024-04-21",
  "end_date": "2024-05-21",
  "tutors":[
    {
      "id": 1,
      "first_name": "First Name",
      "last_name": "Last Name",
      "email": "tutor@example.com"
    },
    {
      "id": 2,
      "first_name": "First Name",
      "last_name": "Last Name",
      "email":"tutor@example.com"
    }
  ]
}
```


**GET API to list all the courses along with their tutors**

- URL: `localhost:3000/courses`
- Method: `GET`
- Description: Retrieves a list of all courses along with their associated tutors.
- Request (cURL):

```bash
curl --location 'localhost:3000/courses'
```

- Response:

```json
[
  {
    "id": 1,
    "name": "Course Name",
    "description": "Course Description",
    "start_date": "2024-04-21",
    "end_date": "2024-05-21",
    "tutors":[
      {
        "id": 1,
        "first_name": "First Name",
        "last_name": "Last Name",
        "email": "tutor@example.com"
      },
      {
        "id": 2,
        "first_name": "First Name",
        "last_name": "Last Name",
        "email":"tutor@example.com"
      }
    ]
  }
]
```