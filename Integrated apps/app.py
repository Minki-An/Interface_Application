#!/usr/bin/python

from flask import Flask, render_template, jsonify, session, request, redirect
import json
import requests
import pymysql

app = Flask(__name__)
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'
app.config['JSON_AS_ASCII'] = False

db_config = [
    {
        'host': '43.201.252.118',
        'user': 'gasida',
        'password': 'qwe123',
        'db': 'userinfo',
    },
    {
        'host': '43.201.252.118',
        'user': 'gasida',
        'password': 'qwe123',
        'db': 'products',
    },
]

first_db_config = db_config[0]

def get_db():
    return pymysql.connect(**first_db_config)

second_db_config = db_config[1]

def get_userinfodb():
    return pymysql.connect(**second_db_config)

@app.route("/")
def index():
    username=""
    if "username" in session:
        username=session["username"]

    return render_template(
            "index.html",
            username=username
    )

@app.route("/w/login")
def login():
    if "username" in session:
        return render_template(
            "hello.html",
            username=session["username"]
        )
    else:
        return render_template("login.html")
    

@app.route("/api/order", methods=["GET"])
def get_orders():
    try:
        conn = get_db()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM products")
        rows = cursor.fetchall()
        cursor.close()
        conn.close()

        # 딕셔너리 형태로 변환하여 JSON으로 반환
        orders = []
        for row in rows:
            order = {
                'id': row[0],
                'name': row[1],
                'store': row[2],
                'storeId': row[3],
                'price': row[4],
                'img': row[5]
            }
            orders.append(order)

        return jsonify(orders), 200

    except Exception as e:
        return jsonify({'message': 'Error', 'error': str(e)}), 500

@app.route("/api/order/<oid>", methods=["GET"])
def order(oid):
    try:

        conn = get_db()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM products")
        rows = cursor.fetchall()
        cursor.close()
        conn.close()

        orders = []
        for row in rows:
            order = {
                'id': row[0],
                'name': row[1],
                'store': row[2],
                'storeId': row[3],
                'price': row[4],
                'img': row[5]
            }
            orders.append(order)
        orders_json = json.dumps(orders)
        data = json.loads(orders_json)
        sid = "0"
        for v in data:
            if v["id"] == oid:
                sid = v["storeId"]
                break

        response = requests.get("/api/store/" + sid)
        store_status = response.json()

        return store_status

    except Exception as e:
        return jsonify({'message': 'Error', 'error': str(e)}), 500

@app.route("/api/store/<id>", methods=["GET"])
def store(id):
    store_status={"100":0, "101":1, "102":1, "103":1}
    if id in  store_status.keys():
        data={"status": store_status[id]}
        return jsonify(data) 
    else:
        data={"status": -1}
        return jsonify(data) 

@app.route("/api/user", methods=["POST"])
def login_1():
    session['username'] = request.form['username']
    return redirect("/w/login", code=302)

@app.route("/api/user", methods=["GET"])
def get():
    if "username" in session:
        print(session["username"])
        return ("session found:"+session["username"])
    else:
        return ("Session not found: ")

@app.route("/api/user/logout", methods=["GET"])
def logout():
    session.clear()
    return redirect("/w/login", code=302)

if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=9000,
        debug=False
    )
