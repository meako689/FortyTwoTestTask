python manage.py migrate --noinput
python manage.py createcachetable
supervisord -c /etc/supervisord.conf
