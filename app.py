from flask import Flask
from flask_mysqldb import MySQL
from flask import *
from flask import Flask, request

from flask import Flask, session

# Set the secret key for session management


# Rest of your code...x


app = Flask(__name__)
app.secret_key = 'e42a08672dbec86b5f8b7e6a9d33a50f1a5f49b04e108d38bc5d59d9b9fcbf9e'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Alli2554'
app.config['MYSQL_DB'] = 'hotpy'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)


# Route for the home page
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form['username']
        email = request.form['email']
        password = request.form['password']
        cur = mysql.connection.cursor()
        cur.execute("INSERT INTO users (username, email, password) VALUES (%s, %s, %s)", (username, email, password))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for('login'))
    return render_template('signup.html')

# Route for login page
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE email = %s AND password = %s", (email, password))
        user = cur.fetchone()
        cur.close()
        if user:
            # Store user ID in session
            session['user_id'] = user['user_id']  # Accessing the 'user_id' key directly
            # Redirect to profile page after successful login
            return redirect(url_for('profile'))
        else:
            return 'Invalid email or password'
    return render_template('login.html')

# Route for profile page
@app.route('/profile')
def profile():
    hotel_id = 1  # Replace with the actual hotel_id
    # Check if user ID is stored in session
    if 'user_id' in session:
        user_id = session['user_id']
        # Retrieve user data from the database using user ID
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE user_id = %s", (user_id,))
        user = cur.fetchone()
        cur.close()
        
        if user:
            return render_template('profile.html', user=user, hotel_id=hotel_id)
    # If user is not logged in, redirect to login page
    return redirect(url_for('login'))

@app.route('/saved')
def saved():
    # You can add logic to fetch profile data from the database here
    hotel_id = 1  # Replace with the actual hotel_id
    return render_template('saved.html', hotel_id=hotel_id)


@app.route('/search')
def search():
    # You can add logic to fetch profile data from the database here
    hotel_id = 1  # Replace with the actual hotel_id
    return render_template('search.html', hotel_id=hotel_id)


@app.route('/hotel_details/<int:hotel_id>')
def hotel_details(hotel_id):
    # Fetch hotel details from the database using hotel_id
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM hotels WHERE hotel_id = %s", (hotel_id,))
    hotel_details = cur.fetchone()
    cur.close()

    if hotel_details:
        # Retrieve amenities and handle the case where it's not present
        amenities = hotel_details.get('amenities', '').split(',')

        # Create a dictionary for hotel details
        hotel_dict = {
            'hotel_id': hotel_details['hotel_id'],
            'name': hotel_details['name'],
            'location': hotel_details['location'],
            'check_in_date': hotel_details['check_in_date'],
            'check_out_date': hotel_details['check_out_date'],
            'adults': hotel_details['adults'],
            'kids': hotel_details['kids'],
            'rooms': hotel_details['rooms'],
            'amenities': amenities,
            'price': hotel_details['price']
        }

        # Pass hotel details to the template along with hotel_id
        return render_template('hotel_details.html', hotel=hotel_dict, hotel_id=hotel_id)
    else:
        # Hotel not found, render a specific template for handling this case
        return render_template('hotel_not_found.html')




@app.route('/search_hotels', methods=['GET', 'POST'])
def search_hotels():
    if request.method == 'POST':
        location = request.form['location']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        adults = request.form['adults']
        kids = request.form['kids']
        rooms = request.form['rooms']

        # Here, you need to define or fetch the hotel_id
        hotel_id = 1  # Replace this with your logic to determine the hotel_id

        # Fetch hotel details based on search criteria
        cur = mysql.connection.cursor()
        query = "SELECT * FROM hotels WHERE location = %s"
        cur.execute(query, (location,))
        hotels = cur.fetchall()
        cur.close()

        # Pass the hotel details to hotel.html for rendering
        return render_template('hotel.html', hotels=hotels, hotel_id=hotel_id, location=location, checkin=checkin, checkout=checkout)

    return render_template('search.html')



@app.route('/save_hotel/<int:hotel_id>', methods=['POST'])
def save_hotel(hotel_id):
    # Logic to save the hotel to the user's saved list
    cur = mysql.connection.cursor()
    cur.execute("UPDATE hotels SET saved = TRUE WHERE hotel_id = %s", (hotel_id,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('search_hotels'))

@app.route('/remove_hotel/<int:hotel_id>', methods=['POST'])
def remove_hotel(hotel_id):
    # Logic to remove the hotel from the user's saved list
    cur = mysql.connection.cursor()
    cur.execute("UPDATE hotels SET saved = FALSE WHERE hotel_id = %s", (hotel_id,))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('search_hotels'))

from flask import render_template

@app.route('/booking/<int:hotel_id>')
def booking(hotel_id):
    # Connect to the database
    cur = mysql.connection.cursor()

    # Execute the query to fetch hotel details
    cur.execute("SELECT * FROM hotels WHERE hotel_id = %s", (hotel_id,))
    hotel_details = cur.fetchone()

    # Check if hotel details were found
    if hotel_details:
        # Render the booking template with the hotel details
        return render_template('hotel_details.html', hotel=hotel_details, hotel_id=hotel_id)
    else:
        # Handle case where no hotel details were found
        return render_template('hotel_not_found.html', message='Hotel not found')


@app.route('/hotel')
def hotel():
    # This function will render the hotel details page
    return render_template('hotel.html')

@app.route('/book_hotel/<int:hotel_id>', methods=['POST'])
def book_hotel(hotel_id):
    if request.method == 'POST':
        check_in_date = request.form['check_in_date']
        check_out_date = request.form['check_out_date']
        adults = request.form['adults']
        kids = request.form['kids']
        rooms = request.form['rooms']

        # Get user ID from session
        user_id = session.get('user_id')

        try:
            # Start a transaction
            with mysql.connection.cursor() as cur:
                # Insert reservation details into the database
                cur.execute("INSERT INTO reservations (user_id, hotel_id, check_in_date, check_out_date, adults, kids, rooms) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                            (user_id, hotel_id, check_in_date, check_out_date, adults, kids, rooms))
                # Commit the transaction
                mysql.connection.commit()
        except Exception as e:
            # Rollback the transaction in case of any exception
            mysql.connection.rollback()
            # Log the exception or handle it appropriately
            print("Error:", e)
            # Redirect the user to an error page or display an error message
            return render_template('error.html', message="An error occurred while booking the hotel. Please try again later.")

        # Redirect the user to the thank you page upon successful booking
        return redirect(url_for('thank_you'))

# Route for logout
@app.route('/logout')
def logout():
    # Remove user ID from session
    session.pop('user_id', None)
    return redirect(url_for('login'))

@app.route('/thank_you')
def thank_you():
    return render_template('thank_you.html')


if __name__ == '__main__':
    app.run(debug=True)
