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
## 🧠 Langflow Setup (Chatbot Logic)
🧠 Run Langflow
```bash
langflow run
```
- Drag and drop components to design your flow.
- Use models like:
    Mistral via Ollama
    nomic-embed-text for embedding

- RAG for retrieval and generation
- Export the JSON file (e.g., Esahay Chatbot.json).

## 📱 Flutter Frontend Setup
### 📦 Prerequisites
- Flutter SDK
- Android Studio / VS Code with emulator or physical device

### 📲 Run the App
Open the Flutter project (chatbot.dart).
Ensure backend IP is accessible (e.g., use 10.0.2.2 for Android Emulator):
Run the app:
``` bash
flutter run
```

The chatbot interface is designed to send user queries to Flask backend and receive generated replies.

## 🖼️ Features
🔍 Query government schemes by natural language

🧠 Powered by Ollama models (Mistral) with Langflow visual logic

📱 Mobile-friendly UI via Flutter

🔄 Backend communication through REST API

📂 Modular architecture with RAG-based retrieval

## 📸 Screenshots
## 📊 Langflow Screens

<img src="https://github.com/user-attachments/assets/cad15bf9-1853-49da-872b-3830b778983a" alt="Langflow Flow 1" width="700" height="500" />
<br/>
<img src="https://github.com/user-attachments/assets/5a04619d-37c1-49b3-8489-c3221725ad79" alt="Langflow Flow 2" width="700" height="500" />

---

## 📱 Flutter App Screens

<img src="https://github.com/user-attachments/assets/30357b8d-851b-4daf-ac2e-62fcff801285" alt="Flutter App Screen 1" width="300" />
<br/>
<img src="https://github.com/user-attachments/assets/be1091a1-e282-404a-8478-823a6cae6b88" alt="Flutter App Screen 2" width="300"  />
<br/>
<img src="https://github.com/user-attachments/assets/96b5a03e-db72-4141-b413-185cea643583" alt="Flutter App Screen 3" width="300"  />
