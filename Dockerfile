FROM python:3.8-bullseye

#RUN apk add --no-cache --update \
#    python3 python3-dev gcc \
#    gfortran musl-dev \
#    libffi-dev openssl-dev

RUN pip install --upgrade pip

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
# "--port=5000"
CMD [ "python3", "-m", "flask", "run", "--host=0.0.0.0" ] 