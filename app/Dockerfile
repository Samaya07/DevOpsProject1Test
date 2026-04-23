# Using an official lightweight Python image
FROM python:3.11-slim AS base

# Expose port 5001 for Flask
EXPOSE 5001

# Set the working directory
WORKDIR /srv/app


##### DEV Image ###############################

FROM base AS development

ENV ENVIRONMENT=development

COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install -r requirements.txt

CMD ["flask", "run", "--host", "0.0.0.0", "--debug"]


######### PROD Image ######################

FROM base AS production

ENV ENVIRONMENT=production

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY app.py app.py

CMD ["flask", "run", "--host", "0.0.0.0"]





# Command to run the app
#CMD ["flask", "run", "--host", "0.0.0.0", "--debug"]