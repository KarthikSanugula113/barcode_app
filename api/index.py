from flask import Flask, request, send_file, render_template_string
import barcode
from barcode.writer import ImageWriter
from io import BytesIO
import random

app = Flask(__name__)

HTML = """
<!DOCTYPE html>
<html>
<head>
    <title>Barcode App</title>
</head>
<body style="text-align:center; margin-top:50px;">
    <h2>Flask Barcode App 🚀</h2>
    <form method="POST">
        <input type="number" step="0.01" name="price" placeholder="Enter price" required>
        <br><br>
        <button type="submit">Generate</button>
    </form>
</body>
</html>
"""

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        price = request.form.get("price")

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

    return render_template_string(HTML)

handler = app
