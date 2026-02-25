from flask import Flask, render_template, request, send_file
import barcode
from barcode.writer import ImageWriter
from io import BytesIO
import random

app = Flask(__name__, template_folder="../templates")

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        price = request.form.get("price")

        if price:
            euro_part = int(float(price))
            price_block = str(euro_part).zfill(4)
            random_part = str(random.randint(10**15, 10**16-1))

            final_string = "ADR" + price_block + random_part

            CODE128 = barcode.get_barcode_class("code128")
            my_barcode = CODE128(final_string, writer=ImageWriter())

            buffer = BytesIO()
            my_barcode.write(buffer)
            buffer.seek(0)

            return send_file(buffer, mimetype="image/png")

    return render_template("index.html")

# Required for Vercel
def handler(request, context):
    return app(request.environ, lambda *args: None)