FROM python:3.7

RUN apt-get update && apt-get install -y vim unixodbc-dev

RUN mkdir /usr/src/app
RUN mkdir /usr/src/app-scripts

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY init.py /usr/src/app-scripts/bootstrap.py
RUN chmod 775 /usr/src/app-scripts/bootstrap.py

CMD ["python", "/usr/src/app-scripts/bootstrap.py"]

EXPOSE 8000
CMD ["python", "/usr/src/app/manage.py", "runserver", "0.0.0.0:8000"]
