from flask import Flask, jsonify
app = Flask(__name__)

@app.route('/', methods=['GET'])
def home():
    return jsonify({'data': 'Hello world'})

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'data': 'Returning from Health API Endpoint'})

@app.route('/info', methods=['GET'])
def info():
    return jsonify({'info': 'Returning from Info API Endpoint'})

if __name__ == '__main__':
    app.run(debug=True)