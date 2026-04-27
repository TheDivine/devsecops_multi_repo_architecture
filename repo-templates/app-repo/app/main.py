from fastapi import FastAPI

app = FastAPI(title="Starter App")

@app.get("/health")
def health():
    return {"status": "ok"}
