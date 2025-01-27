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



# LANGFLOW_URL = 'http://127.0.0.1:7860/flow/05972445-0fd5-401c-b4c2-de2fdc3cebaa'
# API_KEY = 'sk-0toha2qOiH8OX9KI8sqszx2sYhFTlH2fSZtUcpgL9Jc'  # Replace with your actual API key


@app.route('/api/chat', methods=['POST'])
def chat():
        data = request.get_json()
        message = data.get('input_value')
        
        # Process the message using run_flow_from_json
        # flow_input = {
        #     "input_value": message,
        #     "tweaks": TWEAKS
        # }
        # headers = {
        #     'Authorization': f'Bearer {API_KEY}',
        #     'Content-Type': 'application/json'
        # }
        print(f"User query: {message}")
        # # Forward the request to the Langflow API
        # response = requests.get(LANGFLOW_URL, json=flow_input, headers=headers)
        try:
          response = run_flow_from_json(flow="Esahay Chatbot.json", input_value=message, tweaks=TWEAKS)
    # Print the response
        #   print("Response object:", response)
    # if hasattr(response, 'output_value'):
    #     print(response.output_value)
    # else:
    #     print('No response')
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

        
        
        # if response.status_code == 200:
        #     flow_output = response.json()
        #     # Extract the output from the flow_output
        #     output = flow_output.get('output_value', 'No response')
        # else:
        #     output = 'Error: Unable to process the request'
        
        return jsonify({'output': message})

@app.route('/')
def home():
        return jsonify(message="Welcome to the backend API!")

# if __name__ == '__main__':
        # app.run(debug=True)
if __name__ == '__main__':
        app.run(debug=True, host="0.0.0.0", port=5000)  