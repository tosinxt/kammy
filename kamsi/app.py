from flask import *
from flask_mysqldb import MySQL

app = Flask(__name__)

app.secret_key = 'your_secret_key'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'tosin'
app.config['MYSQL_DB'] = 'hotpy'
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
            session['user_id'] = user[0]  # Accessing the first element of the tuple
            # Redirect to profile page after successful login
            return redirect(url_for('profile'))
        else:
            return 'Invalid email or password'
    return render_template('login.html')

# Route for profile page
@app.route('/profile')
def profile():
    # Check if user ID is stored in session
    if 'user_id' in session:
        user_id = session['user_id']
        # Retrieve user data from the database using user ID
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM users WHERE user_id = %s", (user_id,))
        user = cur.fetchone()
        cur.close()
        if user:
            return render_template('profile.html', user=user)
    # If user is not logged in, redirect to login page
    return redirect(url_for('login'))

@app.route('/saved')
def saved():
    # You can add logic to fetch profile data from the database here
    return render_template('saved.html')

@app.route('/search')
def search():
    # You can add logic to fetch profile data from the database here
    return render_template('search.html')


@app.route('/booking')
def booking():
    # You can add logic to fetch profile data from the database here
    return render_template('hotel_details.html')



@app.route('/search_hotels', methods=['GET', 'POST'])
def search_hotels():
    if request.method == 'POST':
        location = request.form['location']
        checkin = request.form['checkin']
        checkout = request.form['checkout']
        adults = request.form['adults']
        kids = request.form['kids']
        rooms = request.form['rooms']

        # Fetch hotels from the database based on location
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM hotels WHERE location = %s", (location,))
        hotels = cur.fetchall()
        cur.close()

        # Pass hotel data to the template
        return render_template('hotel.html', hotels=hotels, location=location, checkin=checkin)

    return render_template('search.html')


# Route for logout
@app.route('/logout')
def logout():
    # Remove user ID from session
    session.pop('user_id', None)
    return redirect(url_for('login'))

if __name__ == '__main__':
    app.run(debug=True)
