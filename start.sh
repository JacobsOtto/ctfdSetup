cd /home/CTFd/CTFd
service nginx start
nohup gunicorn -c gunicorn.cfg "CTFd:create_app()"&
