# HotelBooking System

This is a simple hotel booking system built using Flask, MySQL, and HTML templates. It allows users to sign up, log in, search for hotels, view hotel details, save hotels to their profile, and book hotels.

## Installation and Configuration

### 1. Clone the Repository

Clone this repository to your local machine.

```bash
git clone https://github.com/tosinxt/kammy.git
```

### 2. Install Dependencies

Install the required dependencies using pip.

```bash
pip install -r requirements.txt
```

### 3. Database Configuration

Set up your MySQL database and configure the connection details in `app.py`.

```python
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'your_password'
app.config['MYSQL_DB'] = 'hotpy'
```

Replace `'localhost'` with your MySQL host, `'root'` with your MySQL username, `'your_password'` with your MySQL password, and `'hotpy'` with your MySQL database name.

### 4. Run the Application

Start the Flask application.

```bash
python app.py
```

### 5. Access the Application

Open your web browser and navigate to `http://localhost:5000` to access the hotel booking system.

## Directory Structure

- `app.py`: Contains the Flask application code including routes and database configurations.
- `templates/`: Contains HTML templates for different pages like login, signup, profile, hotel details, etc.
- `static/`: Contains static files like CSS, JavaScript, and images.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.
