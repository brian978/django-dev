FROM python:3.7

RUN apt-get update && apt-get install -y vim unixodbc-dev

RUN mkdir /usr/src/app
RUN mkdir /usr/src/app-scripts

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY startup.py /usr/src/app-scripts/run.py
RUN chmod 775 /usr/src/app-scripts/run.py

EXPOSE 8000
CMD ["python", "/usr/src/app-scripts/run.py"]
