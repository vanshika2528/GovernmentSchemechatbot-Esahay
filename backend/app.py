from flask import Flask, request, jsonify
from flask_cors import CORS
import requests
from requests.packages.urllib3.exceptions import InsecureRequestWarning
from langflow.load import run_flow_from_json
app = Flask(__name__)
CORS(app)

# Disable SSL warnings
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

# Disable telemetry (if applicable)
import os
os.environ['POSTHOG_DISABLE'] = 'true'
TWEAKS = {
        "ChatInput-PAmdZ": {},
        "ChatOutput-aoh6p": {},
        "Prompt-wNgYB": {},
        "Chroma-dhZBE": {},
        "RecursiveCharacterTextSplitter-j3rxA": {},
        "OllamaEmbeddings-GM38l": {},
        "Chroma-iTLot": {},
        "ParseData-79J6g": {},
        "OllamaModel-Wr72L": {},
        "Directory-JRUj9": {}
    }


@app.route('/api/chat', methods=['POST'])
def chat():
        data = request.get_json()
        message = data.get('input_value')
        
    
        print(f"User query: {message}")
      
        try:
          response = run_flow_from_json(flow="Esahay Chatbot.json", input_value=message, tweaks=TWEAKS)
   
          if response and len(response) > 0:
            run_output = response[0]
            if hasattr(run_output, 'outputs') and run_output.outputs:
                result_data = run_output.outputs[0]
                if hasattr(result_data, 'results') and 'message' in result_data.results:
                    message = result_data.results['message'].data['text']
                    print(message)
                else:
                    message = 'No message found in results'
            else:
              message = 'No outputs found in run_output'
          else:
             message = 'No response'
        except Exception as e:
            print(f"Error: {str(e)}")

        

        return jsonify({'output': message})

@app.route('/')
def home():
        return jsonify(message="Welcome to the backend API!")

if __name__ == '__main__':
        app.run(debug=True, host="0.0.0.0", port=5000)  