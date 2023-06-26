# Fast-API

## Benefits

* Swagger-UI (REST-Documentation out of the box)
* Pydantic (data validation and settings management by type annotations)
* Starlett (ASGI server)
* Dependency injection

## Setup

```bash
mkdir my_project
cd my_project
pyhthon -m venv venv
echo ".env" > .gitignore
source .env/bin/activate
pip install "fastapi[all]" "uvicorn[standard]"
pip freeze > requirements.txt
mkdir source
touch source/main.py
```

## Create application

```python
cat > source/main.py <<DELIM
from fastapi import FastAPI

application = FastAPI()

#@ is a decorator - we are decorating the application class
@application.get("/")
async def hello():
    return {"message": "hello world"}
```

## Run your application

```bash
cd source
uvicorn main::application --reload
#open http://127.0.0.1:8000 for your application
#open http://127.0.0.1:8000/docs for the api documentation
#open http://127.0.0.1:8000/redoc for another api documentation
```

## Example shop application

```python
cat source/main.py <<DELIM
from fastapi import FastAPI
from pydantic import BaseModel, Field
from enum import Enum
from typing import Optional

items = [
    {"name": "Computer", "price": 2000, "type": "hardware"},
    {"name": "Monitor", "price": 400, "type": "hardware"},
    {"name": "Quake 3 Arena", "price": 80, "type": "software"},
    {"name": "Arch Linux", "price": 80, "type": "software"}
]

# class Type inherits from class Enum
class Type(Enum):
  hardware = "hardware"
  software = "software"

class Item(BaseModel):
  name: str
  price: int = Field(100, gt=0, lt=4000) #default value is 100 but price must be greater than 0 and less than 4000
  type: Type    #now we only allow types with value "hardware" or "software"

#by this model, we can remove sensitive data from the response
class ResponseItem(BaseModel):
  name: str
  type: Type

application = FastAPI()

@application.get("/items/")
async def read_items(q: Optional[string] = None):    #q stands for query, it is optional with default value None
    if q:   #None results in that if is not triggered
        data = []
        for item in items:
            if item.get("type") == q:
                data.append(item)
        return data
    return items

@application.get("/items/{id}")
#see typhinting in action
async def read_item(id: int):
    return items[id]

@application.post("/items/", reponse_model=ResponseItem)
#see pydantic in action, we define that data is from class Item
async def create_item(data: Item):
    items.append(data)
    return data

@application.put("/items/{id}")
async def update_item(id: int, item: Item)
    items[item_id] = item
    return item

@application.delete("/items/{id}")
async def delete_item(id: int):
    #fetch item to be able to return it
    item = items[id]
    #remove item
    items.pop(id)
    return {"deleted": item}

DELIM
```

## Example login endpoint

```python
cat source/main.py <<DELIM
from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm, OAuth2PasswordBearer    #RequestForm is used to enable the option to send a username and password in the request, Bearer is used to define a schema
from pydantic import BaseModel, Field
from jose import jwt    #json webtoken
from enum import Enum

application = FastAPI()

oatuh2_schema = OAuth2PasswordBearer(tokenurl="login")  #login is our get url '/login'

@application.post("/login")
async def login(data: OAuth2PasswordRequestForm = Depends()):
    if data.username == "test" and data.password = "test":
        access_token = jwt.encode({"user": data.username}, key="secret")    #never return sensitive informations like password
        return {"access_token": access_token, "token_type": "bearer"}
    raise HTTPException(
        status_code=status.HTTP_401_UNAUTHORIZED,
        detail="Incorrect username or password",
        headers={"WWW-Authenticate": "Bearer"}
    )

#see dependeny in action
#by using this, you are only allowed to see this if you are authorized
@application.get("/sensitive-data", dependencies=[Depends(oatuh2_schema)])
async def hello():
    return {"hello": "world"}

#if you need to work with the token
@application.get("/another-sensitive-endpoint")
async def world(token: str = Depends(oatuh2_schema)):
    jwt.decode(token)
    return {"world": "hello"}
```

## Example Database

```python
#bo: database.py
#sqlmodel is needed
##uses pydantic and sqlmodel
from sqlmodel import Session, SQLModel, create_engine

from pathlib import Path #needed to get the current working directory

from os

#constant
SQLModel_DATABASE_URL = "sqlite:///./sql_application.db" #./ - place the file >>sql_application<< in the current folder

#engine is more like a connection
engine = create_engine(SQLITE_DATABASE_URL, connect_args={"check_same_thread": false}

def get_database():
    with Session(engine) as session:
        yield session

def create_database_and_tables():
    SQLModel.metadata.create_all(engine)

def shutdown():
    cwd = Path.cwd().resolve()  #create currenty working directory
    database_file_path = [file for file in os.listdir() if file.endswith(".db")][0] #list all entries in current path and return the first entry that ends with ".db"
    os.remove(os.path.join(cwd, database_file_path))    #delete first *.db file in current working directory
#eo: database.py

#bo: models_and_schemas.py
from sqlmodel import SQLModel, Field
from pydantic import EmailStr
from enmum import Enum
from typing import Optional

class Roles(str, Enum):
    administrator = "administrator"
    user = "user"

#no password since we have to deal with the password based on the situation
class BaseUser(table=True):
    email: EmailStr
    username: str
    role: Roles
    is_active: bool = False #False is the default value

class DatabaseUser(BaseUser, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)   #if no value is provided, a new value will be created
    hashed_password: str

class UserSchema(BaseUser):
    password: str
#eo: models_and_schemas.py

#bo: crud.py
from sqlmodel import Session

from . import models_and_schemas, auth    #import from current path (>>.<<) the file >>models_and_schemas<< (>>.py<< is automatically added)

def create_user(db: Session, user: models_and_schemas.User.Schema):
    hashed_password = auth.create_password_hash(user.password)
    new_database_user = models_and_schemas.DatabaseUser(
        email = user.email,
        username = user.username,
        role = user.role,
        hashed_password = hashed_password
    )
    db.add(new_database_user)
    db.commit()
    db.refresh(new_database_user)   #with this line of code, we update the current object with the values from the database, like the id

    return new_database_user

def get_users(db: Session)
    users = db.query(models_and_schemas.DatabaseUser).all()
    return users

def get_user_by_username(db: Session, username: str)
    first_user = db.query(models_and_schemas.DatabaseUser).filter(models_and_schemas.DatabaseUser.username == username).first()
    return first_user

#eo: crud.py

#bo: main.py
#Depends is our dependeny container to inject dependencies
from fastapi import FastAPI, Depends, HTTPException
from fastapi.responses import HTMLResponse
from fastapi.security import OAuth2PasswordRequestForm
from sqlmodel import Session
from . import database, models_and_schemas, crud, auth

app = FastAPI()

@app.on_event("startup") #create a database on server startup
def startup_event():
    database.create_database_and_tables()

@app.on_event("shutdown")
def shutdown_event():
    database.shutdown()

@app.post("/register")
def register_user(user: models_and_schemas.UserSchema, db: Session = Depends(database.get_database))
    database_user = crud.create_user(db=db, user=user)
    return database_user

@app.get("/users")
def get_all_users(db: Session = Depends(database.get_database))
    users = crud.get_users(db=db)
    return users

@app.get("/secured-endpoint")
def get_all_users(db: Session = Depends(database.get_database), claims: dict = Depends(auth.check_is_active))    #this is working since we raise an HTTPException in the check_is_active method, strange but thats the example. Furthermore, since auth.check_is_active needs a token, we've chained the dependency injection. Sad thing, we've dissimulated the fact that this endpoint is secured by an token
    users = crud.get_users(db=db)
    return users

@app.get("/administrative-endpoint", deoendencies=[Depends(auth.check_is_administrator)])   #this would work for the "/secured-endpoint" to. The rule of thumb is, if you are not working with the returned data (like the returned claims), put the dependeny at this place
def get_all_users(db: Session = Depends(database.get_database))
    users = crud.get_users(db=db)
    return users

#endpoint when user clicked on an email link
@app.get("/verify/{token}", response_class=HTMLResponse)    #switches from default json response to an html response
def verify_user(token: str, db: Session = Depends(database.get_database)):
    claims = auth.decode_access_token(token)
    if claims
        username = claims.get("sub")
        database_user = crud.get_user_by_username(db, username)
        database_user.is_active = True
        crud.commit()
        crud.refresh(database_user)
        return f"""
        <html>
            <head><title>Bestätigung der Registrierung</title></head>
            <body><h2>Aktivierung von >>{username}<< erfolgreich</h2></body>
        </html>
        """
    raise HTTPException(status_code=404, detail="Token was invalid")

@app.post("/login")
def login(db: Session = Depends(database.get_database), form_data = OAuth2PasswordRequestForm = Depends()): #OAuth2PasswordRequestForm takes care of all heavy lifting for username and password
    database_user_or_null = crud.get_user_by_username(db=db, username=form_data.username)
    if not database_user_or_null:
        raise HTTPException(status_code=401, detail="Username or password incorrect")
    if auth.verify_password(form_data.password, database_user_or_null.hashed_password):
        token = auth.create_access_token(user=database_user_or_null)
        return {"access_token": token, "token_type": "Bearer"}
    raise HTTPException(status_code=401, detail="Username or password incorrect")

#eo: main.py

#bo: auth.py
from fastapi import Depends, HTTPException
from fastapi.security import OAuth2PasswordBearer
from passlib.context import CryptContext
from jose import jwt
from datetime import datetime, timedelta
from . import models_and_schemas

JWT_SECRET = "super_secret_key" #right would be to create an environment file (.env) and fetch this by os.getenv("jwt_secret"), or python-dotenv and load_dotenv(find_dotenv())
JWT_ALGORITHM = HS256

password_context = CryptContext(schemes=["bcrypt"])
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="login")    #login is url that generates our token

def create_password_hash(password: str):
    return password_context.hash(password)

def verify_password(plain_password: str, hashed_password: str)
    return password_context.verify(plain_password, hashed_password)

def create_access_token(user: models_and_schemas.DatabaseUser):
    claims = {
        "sub": user.username,
        "email": user.email,
        "role": user.role,
        "is_active": user.is_active,
        "exp": datetime.utcnow() + timedelta(minutes=120)   #expiration
    }
    return jwt.encode(claims=claims, key=JWT_SECRET, algorithm=JWT_ALGORITHM) #data could contain username, role etc.

def decode_access_token(token: str)
    claims = jwt.decode(token, key=JWT_SECRET)
    return claims

def check_is_active(token: str = Depends(oauth2_scheme))    #the name of this function does not indicate that it returns a dict
    claims = decode_access_token(token)
    if claims.get("is_active")
        return true
    raise HTTPException(status_code=401, detail="User not activated", headers={"WWW-Authenticate": "Bearer"})

def check_is_administrator(claims: dict = Depends(check_is_active))
    role = claims.get("role")
    if role != "administrator"
        raise HTTPException(status_code=403, detail="Insufficiant rights", headers={"WWW-Authenticate": "Bearer"})
    return claims   #we are returning the calims to be in sync with the check_is_active

#eo: auth.py
```

## FastAPI and Docker

```bash
Create your fastapi application (main.py), e.g. the hello world application.

mkdir application
touch application/main.py
touch application/__init__.py

#install your dependencies
pip freeze > requirements.txt

cat > Dockerfile <<DELIM
FROM python:3.9

WORKDIR /fastapi

COPY ./requirements.txt /fastapi/requirements.txt
COPY ./application /fastapi/application

RUN pip install --no-cache-dir -r requirements.txt

CMD ["uvicorn", "application.main:app", "--host", "0.0.0.0", "--port", "5000"]
DELIM

#build image
docker build -t fastapi-application .

#start image
docker run -p "5000:5000" fastapi-application
```

## FastAPI and Docker-Compose

```bash
#use the application from above
#create a Dockerfile
#create a requirements.txt
#create a sub directory like "fastapi"
#move application, Dockerfile and requirements.txt into the new directory
#inside the application, you have to replace the DATABASE_URL with os.environ.get("DATABASE_URL")
#create a directory called >>data<< where you put the docker-compose.yml

cat > docker-compose.yml <<DELIM
version: "3.8"

services:
  database_service:
    image: postgres:14.1-alpine
    expose: 
      - "5432:5432"
    environment: 
      - POSTGRES_USER=test
      - POSTGRES_PASSWORD=test
      - POSTGRES_DB=db
    volumes: 
      - postgres_data:/var/lib/postgresql/data/ #postgres_data is the locally mounted path

  fastapi:
    build: ./fastapi    #a Dockerfile is searched in this path
    command: |
      bash -c 'gunicorn application.main:app --workers 4 --worker-class uvicorn.workers.UvironWorker --bind 0.0.0.0:5000' #this is overwriting the CMD from the Dockerfile
    ports:
      - "5000:5000"
    environment:
      - DATABASE_URL=postgresql://test:test@database_service/db
    depends_on:
      - database
    restart:
      - always  #always restart this container on an error

volumes:
  postgres_data:

DELIM
```

## Perform load test

```bash
pip install locust

cat > locusttest.py <<DELIM
from locust import HttpUser, task, between

class Quickstart(HttpUser):
    host = "http://127.0.0.1:5000"
    wait_time = between(3, 10)  #time in seconds

    @task(1)    #this test weights 1
    def test_get_root(self):
        self.client("/")

    @task(5)    #this test weights 5
    def test_get_hello(self):
        self.client("/hello")

DELIM

#if you want to play around
locust -f locusttest.py #open the provided url
#edit the test settings
#click on >>start swarming<<

#if you want to do it by command line
pip install invokust

cat > load_test.py <<DELIM
import invokust

settings = invokust.create_settings(
    locustfile="locusttest.py"
    host="http://127.0.0.1:5000"
    num_users=1000,
    spawn_rate=50,
    run_time="1m"
)

loadtest = invokust.LocustLoadTest(settings=settings)
loadtest.run()
loadtest.stats()    #optional
DELIM

#execute it
python .\load_test.py

```

## Links

* [Build apis with fastapi in python all essentials you need to get started: gitconnected.com](https://levelup.gitconnected.com/build-apis-with-fastapi-in-python-all-essentials-you-need-to-get-started-6bf9fa90c6b8) - 20230511
* [List of FastAPI packages](https://libraries.io/search?q=fastapi) - 20230327
* [Pypi.org: FastAPI](https://pypi.org/project/fastapi/) - 20230220
* [Tag-youre-it-backend: Example project using fastapi](https://github.com/nickatnight/tag-youre-it-backend) - 20230227
* [Youtube.de: FastAPI Crashkurs 2022 | REST-API mit dem beliebsten Python Framework](https://www.youtube.com/watch?v=KXCvIV3yr7c&list=PL-lCrD3QqynX2a2sgXZlvxEGssGg9ZTCa) - 20230218
  * [Github.com: Project page](https://github.com/Coding-Crashkurse/FastAPI-Auth) - 20230219


