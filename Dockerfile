FROM python:3.6-slim
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/

RUN if [ "$ENV" = "" ] ; then EXPOSE 8000 ; else EXPOSE $PORT ; fi
CMD python3 manage.py runserver 0.0.0.0:$PORT
