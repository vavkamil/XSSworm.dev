#!/usr/bin/env python

# XSSworm.dev
# Self-replication contest
# Proof of Concept v1.0
#
# https://github.com/vavkamil/XSSworm.dev

from flask import (
    Flask,
    render_template,
    request,
    Response,
    redirect,
    session,
    send_from_directory,
    abort,
)
import pymysql
import bcrypt
import json

app = Flask(__name__)
app.secret_key = "31p475~Yr37748-35r0h~7c3rr0C"


class Database:
    def __init__(self):
        host = "127.0.0.1"
        user = "root"
        password = "localhost"
        db = "xssworm"

        self.con = pymysql.connect(
            host=host,
            user=user,
            password=password,
            db=db,
            cursorclass=pymysql.cursors.DictCursor,
        )
        self.cur = self.con.cursor()

    def list_victims(self):
        self.cur.execute("SELECT id, color FROM victims")
        result = self.cur.fetchall()
        self.con.close()

        return result

    def update_color(self, color, id):
        sql = "UPDATE victims SET color = %s WHERE id= %s"
        self.cur.execute(sql, (color, id))
        result = self.con.commit()
        self.con.close()

    def count_colors(self):
        self.cur.execute(
            "SELECT users.username, victims.color, count(victims.color) FROM victims JOIN users ON victims.color = users.color GROUP BY users.id, victims.color ORDER BY count(victims.color) DESC"
        )
        result = self.cur.fetchall()
        self.con.close()

        return result

    def read_message(self, id):
        sql = "SELECT message FROM victims WHERE id = %s"
        self.cur.execute(sql, (id))
        result = self.cur.fetchall()

        # Delete after read
        sql = "UPDATE victims SET message = '' WHERE id = %s"
        self.cur.execute(sql, (id))
        self.con.commit()
        self.con.close()

        return result

    def send_message(self, victim_id, msg, user_id):
        sql = "UPDATE users SET messages = messages - 1 WHERE id = %s;"
        self.cur.execute(sql, (user_id))
        result = self.con.commit()

        sql = "UPDATE victims INNER JOIN users SET victims.message = CASE WHEN users.messages >= 0 THEN %s ELSE victims.message END WHERE victims.id = %s AND users.id = %s"
        self.cur.execute(sql, (msg, victim_id, user_id))
        result = self.con.commit()

        sql = "INSERT INTO logs (message,victim_id,user_id) VALUES (%s, %s, %s)"
        self.cur.execute(sql, (msg, victim_id, user_id))
        result = self.con.commit()
        self.con.close()

        return result

    def send_message_puppeteer(self, victim_id, msg):
        sql = "UPDATE victims SET message = %s WHERE id = %s"
        self.cur.execute(sql, (msg, victim_id))
        result = self.con.commit()

        return result

    def add_user(self, username, color, password):
        sql = "INSERT INTO users (username, color, password, messages) VALUES (%s, %s, %s, %s)"
        self.cur.execute(sql, (username, color, password, 13))
        result = self.con.commit()
        self.con.close()

        return result

    def login(self, username):
        sql = "SELECT id, username, password, color FROM users WHERE username = %s"
        self.cur.execute(sql, (username))
        result = self.cur.fetchall()
        self.con.close()

        return result

    def check_remaining(self, id):
        sql = "SELECT messages FROM users WHERE id = %s"
        self.cur.execute(sql, (id))
        result = self.cur.fetchone()
        self.con.close()

        return result


@app.route("/")
def index():

    return render_template("index.html")


@app.route("/rules")
def rules():

    return render_template("rules.html")


@app.route("/login", methods=["GET", "POST"])
def login():

    if "loggedin" in session:
        return redirect("/send-message")

    if request.method == "POST":
        req = request.form

        username = req.get("username")
        password = req.get("password")

        def db_query():
            db = Database()
            emps = db.login(username)

            return emps

        account = db_query()
        if account:
            if bcrypt.hashpw(
                password.encode("utf-8"), account[0]["password"].encode("utf-8")
            ) == account[0]["password"].encode("utf-8"):
                session["loggedin"] = True
                session["id"] = account[0]["id"]
                session["username"] = account[0]["username"]
                session["color"] = account[0]["color"]

        return redirect("/send-message")
    else:
        return render_template("login.html")


@app.route("/register", methods=["POST"])
def register():
    if request.method == "POST":
        req = request.form

        username = req.get("username")
        color = req.get("color")
        password = req.get("password")

        hashed_password = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())

        def db_query():
            db = Database()
            emps = db.add_user(username, color, hashed_password)

            return emps

        res = db_query()
        return render_template("login.html", check="<h1>Registration succesfull!</h1>")


@app.route("/faq")
def faq():

    return render_template("faq.html")


@app.route("/score")
def score():
    def db_query():
        db = Database()
        emps = db.list_victims()

        return emps

    res = db_query()

    def db_query2():
        db = Database()
        emps = db.count_colors()

        return emps

    res2 = db_query2()

    return render_template(
        "score.html", result=res, result2=res2, content_type="application/json"
    )


@app.route("/update", methods=["GET", "POST"])
def update():
    if request.cookies.get("secret") != "correct-horse-battery-staple":
        abort(403)

    if request.method == "POST":
        req = request.form

        color = req.get("color")

        if "31p475~Yr37748-35r0h~7c3rr0C-ID" in request.cookies:
            cookie_id = request.cookies.get("31p475~Yr37748-35r0h~7c3rr0C-ID")

            def db_query():
                db = Database()
                emps = db.update_color(color, cookie_id)

                return emps

            res = db_query()
        else:
            print("no cookie")

    return render_template("update.html")


@app.route("/read-message")
def read_message():

    if request.cookies.get("secret") != "correct-horse-battery-staple":
        abort(403)

    id = request.cookies.get("31p475~Yr37748-35r0h~7c3rr0C-ID")

    def db_query():
        db = Database()
        emps = db.read_message(id)

        return emps

    res = db_query()

    return render_template("read-message.html", result=res, content_type="text/plain")


@app.route("/send-message", methods=["GET", "POST"])
def send_message():
    if ("loggedin" not in session) and (
        request.cookies.get("secret") != "correct-horse-battery-staple"
    ):
        return redirect("/login")

    if request.cookies.get("secret") == "correct-horse-battery-staple":
        req = request.form
        victim_id = req.get("id")
        msg = req.get("msg")

        def db_query():
            db = Database()
            emps = db.send_message_puppeteer(victim_id, msg)

            return emps

        res2 = db_query()

        return render_template("send-message.html")

    def db_query():
        db = Database()
        emps = db.check_remaining(session["id"])

        return emps

    res = db_query()
    if request.method == "POST":
        if res["messages"] > 0:
            req = request.form
            victim_id = req.get("id")
            msg = req.get("msg")

            def db_query():
                db = Database()
                emps = db.send_message(victim_id, msg, session["id"])

                return emps

            res2 = db_query()

    def db_query():
        db = Database()
        emps = db.check_remaining(session["id"])

        return emps

    res = db_query()

    return render_template(
        "send-message.html",
        color=session["color"],
        username=session["username"],
        remaining=res["messages"],
    )


@app.route("/jsonp")
def jsonp():
    def db_query():
        db = Database()
        emps = db.count_colors()

        return emps

    res = db_query()
    res = json.dumps(res)

    content_type = "application/json"

    callback = request.args.get("callback", False)
    if callback:
        res = str(callback) + "(" + res + ")"
        content_type = "text/javascript"

    return Response(res, content_type=content_type)