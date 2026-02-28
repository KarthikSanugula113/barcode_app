from flask import Flask, render_template, request, send_file
import barcode
from barcode.writer import ImageWriter
from io import BytesIO
import random
import os

app = Flask(__name__, template_folder=os.path.join(os.path.dirname(__file__), "../templates"))

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        price = request.form.get("price")

        if price:
            # Convert to cents
            price_in_cents = int(round(float(price) * 100))
            price_block = str(price_in_cents).zfill(5)

            # No random part (stable barcode)
            final_string = "ADR" + price_block

            CODE128 = barcode.get_barcode_class("code128")
            my_barcode = CODE128(final_string, writer=ImageWriter())

            buffer = BytesIO()
            my_barcode.write(buffer)
            buffer.seek(0)

            return send_file(buffer, mimetype="image/png")

    return render_template("index.html")


# ✅ IMPORTANT: nothing else below
app.debug = False
