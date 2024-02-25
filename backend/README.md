
## Table of Contents

1.  - [How to Use](#how-to-use)
     - [Setting Up Locally](#setting-up-locally)
     - [Running the Django API](#running-the-django-api)



### How to Use

Integrate these API endpoints into your application to manage and track user scores dynamically. Retrieve existing scores, add new scores, and update category scores based on user interactions. Follow the steps outlined in each API section for a smooth integration process.

#### Setting Up Locally

Follow these steps to set up the Django API locally:

1. Clone the repository:

   ```bash
   git clone https://github.com/naderite/SolutionChallengeBackend.git
   ```

2. Navigate to the project directory:

   ```bash
   cd SolutionChallengeBackend
   ```

3. Create a virtual environment if you don't already have one named "venv".

4. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

#### Running the API

Run the file `./start_env.bat` to start the servers.

Copy the Django API tunnel link (forwarded to localhost:8000) and paste it in the `ALLOWED_HOSTS` and `CSRF_TRUSTED_ORIGINS` in the Django project `settings.py`.
