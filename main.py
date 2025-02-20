from fastapi import FastAPI
import subprocess

app = FastAPI()

@app.get("/chat")
async def chat(prompt: str):
    """API endpoint to interact with Mixtral"""
    result = subprocess.run(["ollama", "run", "mixtral", prompt], capture_output=True, text=True)
    return {"response": result.stdout}
