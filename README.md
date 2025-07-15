# 🤖 e-Sahay – Government Scheme Chatbot

**e-Sahay** is an AI-powered chatbot that simplifies how citizens in Gujarat access and understand government welfare schemes. Built with advanced NLP models using **Langflow**, **Ollama**, and a seamless **Flutter-based interface**, this project ensures inclusive, accessible public service delivery.

---

## 🎯 Project Objective

To create an intelligent, citizen-facing chatbot that:
- Provides accurate, real-time info about government schemes like loans, insurance, and welfare programs.
- Supports natural language queries via a user-friendly mobile app.
- Reduces complexity in understanding public services using NLP.

---

## 🧱 Technology Stack

| Layer           | Technology                                 |
|----------------|---------------------------------------------|
| Chatbot Engine  | [Langflow](https://github.com/logspace-ai/langflow), Ollama (Mistral, nomic-embed-text), RAG |
| Backend API     | Python + Flask + Langflow JSON Loader      |
| Frontend        | Flutter                                     |
| NLP Models      | Mistral (via Ollama), Chroma DB, Embeddings|
| Data Source     | Trusted government scheme documents         |

---
## 🔌 Backend Setup

### 🧰 Prerequisites
- Python 3.9+
- Virtual environment recommended
- Langflow installed with Ollama models

```bash
# Clone the repo
git clone https://github.com/Princee99/GovernmentSchemechatbot-Esahay.git
cd GovernmentSchemechatbot-Esahay/backend

# Create virtual environment
python -m venv venv
venv\Scripts\activate   # On Windows

# Install required packages
pip install -r requirements.txt

# Run the Flask backend
python app.py


```


