from flask import Flask, request
import sqlite3

app = Flask(__name__)

# On met un secret en dur pour que SonarQube puisse le voir plus tard [cite: 50]
SECRET_KEY = "cle_secrete_trop_facile"

@app.route('/')
def index():
    user_id = request.args.get('id')
    # On laisse une injection SQL potentielle, comme dans ton TP [cite: 55]
    query = "SELECT * FROM users WHERE id=" + str(user_id)
    return {"status": "running", "query_debug": query}

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)