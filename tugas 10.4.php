<php></php>
  <!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Penerimaan Pegawai</title>
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
      select,
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
    </style>
  </head>
  <body>
    <div class="container">
      <h2>Silakan Masukkan Informasi Anda</h2>
      <form id="formPenerimaan">
        <label for="jenisKelamin">Jenis Kelamin:</label>
        <select id="jenisKelamin">
          <option value="laki-laki">Laki-laki</option>
          <option value="perempuan">Perempuan</option>
        </select>
        <label for="tinggiBadan">Tinggi Badan (cm):</label>
        <input type="number" id="tinggiBadan" required />
        <label for="beratBadan">Berat Badan (kg):</label>
        <input type="number" id="beratBadan" required />
        <label for="ipk">IPK:</label>
        <input type="number" step="0.01" id="ipk" required />
        <label for="pendidikan">Pendidikan:</label>
        <select id="pendidikan">
          <option value="D3">D3</option>
          <option value="S1">S1</option>
        </select>
        <button type="button" onclick="cekKelayakan()">Cek Kelayakan</button>
      </form>
    </div>
    <script>
      function cekKelayakan() {
        var jenisKelamin = document.getElementById("jenisKelamin").value;
        var tinggiBadan = parseInt(
          document.getElementById("tinggiBadan").value
        );
        var beratBadan = parseInt(document.getElementById("beratBadan").value);
        var ipk = parseFloat(document.getElementById("ipk").value);
        var pendidikan = document.getElementById("pendidikan").value;

        if (
          (jenisKelamin === "laki-laki" &&
            tinggiBadan >= 170 &&
            tinggiBadan <= 179 &&
            beratBadan == tinggiBadan - 110 &&
            ipk >= 3 &&
            ipk <= 4 &&
            (pendidikan === "D3" || pendidikan === "S1")) ||
          (jenisKelamin === "perempuan" &&
            tinggiBadan >= 160 &&
            tinggiBadan <= 170 &&
            beratBadan == tinggiBadan - 110 &&
            ipk >= 3 &&
            ipk <= 4 &&
            (pendidikan === "D3" || pendidikan === "S1"))
        ) {
          alert("Anda memenuhi syarat untuk penerimaan pegawai.");
        } else {
          alert("Maaf, Anda tidak memenuhi syarat untuk penerimaan pegawai.");
        }
      }
    </script>
  </body>
</html>