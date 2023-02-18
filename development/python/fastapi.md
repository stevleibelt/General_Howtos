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

## Links

* [Youtube: FastAPI Crashkurs 2022 | REST-API mit dem beliebsten Python Framework](https://www.youtube.com/watch?v=KXCvIV3yr7c&list=PL-lCrD3QqynX2a2sgXZlvxEGssGg9ZTCa) - 20230218


