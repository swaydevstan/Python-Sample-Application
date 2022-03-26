FROM python:latest

RUN mkdir /build
WORKDIR /build

COPY Python-Sample-Application /build

COPY Python-Sample-Application/requirements.txt /build

RUN pip install -r requirements.txt

EXPOSE 5000

CMD [ "python", "app.py" ]