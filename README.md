# Flutter Project Readme

Welcome to Education'All

## Table of Contents

1. [Frontend](#frontend)
   - [Getting Started](#getting-started)
   - [Prerequisites](#prerequisites)
   - [Configuration](#configuration)
   - [Installing](#installing)
   - [Running the App](#running-the-app)
   - [Note](#note)
   - [Authors](#authors)

2. [Backend](#backend)
   - [How to Use](#how-to-use)
     - [Setting Up Locally](#setting-up-locally)
     - [Running the Django API](#running-the-django-api)

## Frontend

These instructions will help you set up and run the Flutter app on your local machine for development and testing purposes.

### Getting Started

#### Prerequisites

Make sure you have Flutter and Dart installed on your machine. If not, you can follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install).

#### Configuration

There are some configurations in the `Frontend/lib/api_urls.dart` file. Depending on your environment, follow the instructions below:

1. If you are using a web browser:
   - Set `baseUrl` variable to `'http://10.0.2.2:8000'`
   - Set `baseUrlAi` variable to `'http://10.0.2.2:8001'`

2. If you are using an emulator:
   - Set `baseUrl` variable to `'http://127.0.0.1:8000'`
   - Set `baseUrlAi` variable to `'http://127.0.0.1:8001'`

#### Installing

1. Clone the repository to your local machine.

```bash
git clone https://github.com/Aminebht/Solution-Challenge.git
```

2. Navigate to the project directory.

```bash
cd Frontend
```

3. Install dependencies.

```bash
flutter pub get
```

#### Running the App

Now you can run the app on an emulator or a connected device.

```bash
flutter run
```

This command will build and run the app. If everything is set up correctly, you should see the app running on your emulator or device.

#### Note

Please be aware that the app's backend functionality is optimized for Android devices. Certain features may not work as expected in web browsers.


#### Authors

- Amine Belhadj Taher
- Ayyoub Mkadmi
- Nader Ben Salah


## Backend

Integrate these API endpoints into your application to manage and track user scores dynamically. Retrieve existing scores, add new scores, and update category scores based on user interactions. Follow the steps outlined in each API section for a smooth integration process.

### How to Use

#### Setting Up Locally

Follow these steps to set up the Django API locally:

1. Clone the repository:

   ```bash
   git clone https://github.com/Aminebht/Solution-Challenge.git
   ```

2. Navigate to the project directory:

   ```bash
   cd backend
   ```

3. Create a virtual environment if you don't already have one named "venv".

4. Install dependencies:

   ```bash
   pip install -r requirements.txt
   ```

#### Running the API

Run the file `./start_env.bat` to start the servers.

Copy the Django API tunnel link (forwarded to localhost:8000) and paste it in the `ALLOWED_HOSTS` and `CSRF_TRUSTED_ORIGINS` in the Django project `settings.py`.