FROM gcr.io/google-appengine/python

# Install depencies
ADD ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

# Add the application source code.
WORKDIR /app
ADD . /app

# Run a WSGI server to serve the application. gunicorn must be declared as a dependency in requirements.txt.
CMD gunicorn -b :$PORT main:app