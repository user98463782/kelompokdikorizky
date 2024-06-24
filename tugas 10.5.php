<php></php>
  <!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Calculator Billing Online</title>
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
      p {
        margin-bottom: 20px;
        color: #555;
      }
      input[type="text"] {
        width: calc(100% - 22px);
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
      #result {
        margin-top: 20px;
        font-size: 1.1em;
        color: #333;
      }
    </style>
    <script>
      function calculateCost() {
        // Mendapatkan nilai dari input detik
        var seconds = parseInt(document.getElementById("seconds").value);

        // Menghitung jumlah pulsa
        var pulses = Math.ceil(seconds / 45);

        // Menghitung biaya total
        var cost = pulses * 30;

        // Menghitung total waktu pemakaian dalam jam, menit, dan detik
        var hours = Math.floor(seconds / 3600);
        var minutes = Math.floor((seconds % 3600) / 60);
        var remainingSeconds = seconds % 60;

        // Menampilkan hasil
        document.getElementById("result").innerHTML =
          "Total Waktu Pemakaian: " +
          hours +
          " jam " +
          minutes +
          " menit " +
          remainingSeconds +
          " detik<br>Jumlah Pulsa: " +
          pulses +
          "<br>Biaya Total: Rp " +
          cost;
      }
    </script>
  </head>
  <body>
    <div class="container">
      <h2>Calculator Billing Online</h2>
      <p>Masukkan jumlah detik pemakaian:</p>
      <form id="billingForm">
        <input type="text" id="seconds" placeholder="Jumlah Detik" />
        <button type="button" onclick="calculateCost()">Hitung Biaya</button>
      </form>
      <div id="result"></div>
    </div>
  </body>
</html>