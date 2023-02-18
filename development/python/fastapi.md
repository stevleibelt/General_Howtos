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
pyhthon -m venv .env
echo ".env" > .gitignore
source .env/bin/activate
pip install "fastapi[all]" "uvicorn[standard]"
pip freeze > requirements.txt
mkdir source
touch source/main.py
```

## Create application

```bash
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
```

## Example shop application

```bash
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

```bash
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

## Links

* [Youtube: FastAPI Crashkurs 2022 | REST-API mit dem beliebsten Python Framework](https://www.youtube.com/watch?v=KXCvIV3yr7c&list=PL-lCrD3QqynX2a2sgXZlvxEGssGg9ZTCa) - 20230218


