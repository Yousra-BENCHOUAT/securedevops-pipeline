from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def home():
    return jsonify({
        "message": "SecureDevOps Pipeline — Application Python",
        "version": "1.0.0",
        "status": "running"
    })

@app.route('/health')
def health():
    return jsonify({"status": "healthy"})

@app.route('/info')
def info():
    return jsonify({
        "app": "SecureDevOps",
        "stack": ["Jenkins", "SonarQube", "Vault", "Nginx", "ELK Stack"],
        "cloud": "AWS EC2"
    })

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)