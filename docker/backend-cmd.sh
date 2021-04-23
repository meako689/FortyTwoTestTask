python manage.py migrate --noinput
python manage.py createcachetable
gunicorn fortytwo.wsgi -b 0.0.0.0:"${PORT:-8000}" --reload
