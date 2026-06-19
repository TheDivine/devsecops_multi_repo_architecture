from fastapi import FastAPI

app = FastAPI(title="Starter App", version="0.1.0")


@app.get("/health")
def health():
    return {"status": "ok"}


@app.get("/ready")
def ready():
    return {"status": "ready"}
