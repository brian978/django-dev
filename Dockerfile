FROM python:3.8

ARG DEBIAN_FRONTEND=noninteractive

# Prequisites
RUN apt-get update && apt-get install -y apt-transport-https apt-utils locales

# Add the required windows packages
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/debian/9/prod.list > /etc/apt/sources.list.d/mssql-release.list

# Install the MSSQL required drivers
RUN apt-get update \
    && ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools \
    && apt-get install -y vim unixodbc-dev

# Setup the image env and scripts
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
