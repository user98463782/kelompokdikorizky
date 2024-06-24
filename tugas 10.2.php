<php></php>
  <!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Perhitungan Harga dengan Diskon</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f0f0f0;
      }
      .container {
        background-color: #fff;
        text-align: center;
        border: 1px solid #ccc;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
      }
      h2 {
        margin-bottom: 20px;
        color: #333;
      }
      form {
        margin-bottom: 20px;
      }
      label {
        display: block;
        margin-bottom: 10px;
        color: #555;
        font-weight: bold;
      }
      input[type="text"],
      input[type="number"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
      }
      button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        font-size: 1em;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      button:hover {
        background-color: #0056b3;
      }
      #hasil {
        font-size: 1.2em;
        margin-top: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        background-color: #f9f9f9;
        color: #333;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Perhitungan Harga dengan Diskon</h2>
      <form>
        <label for="nama">Nama Barang:</label>
        <input type="text" id="nama" />
        <label for="harga">Harga Barang:</label>
        <input type="number" id="harga" />
        <label for="jumlah">Jumlah Barang:</label>
        <input type="number" id="jumlah" />
        <button type="button" onclick="hitungTotal()">Hitung Total</button>
      </form>
      <p id="hasil"></p>
    </div>
    <script>
      function hitungTotal() {
        var nama = document.getElementById("nama").value;
        var harga = parseFloat(document.getElementById("harga").value);
        var jumlah = parseInt(document.getElementById("jumlah").value);
        var diskon = 0;

        if (jumlah >= 3) {
          diskon = (10 / 100) * harga * jumlah;
        }

        var totalBayar = harga * jumlah - diskon;
        var hasil =
          "Total pembayaran untuk " + nama + ": Rp " + totalBayar.toFixed(2);
        document.getElementById("hasil").innerText = hasil;
      }
    </script>
  </body>
</html>