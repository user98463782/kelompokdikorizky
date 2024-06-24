<php></php>
<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Game Zodiak</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        text-align: center;
        padding: 50px;
        background-color: #f0f0f0;
      }
      .container {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: auto;
      }
      h1 {
        color: #333;
      }
      .zodiac-form {
        margin-bottom: 20px;
      }
      .zodiac-form label {
        display: block;
        margin: 10px 0 5px;
        color: #555;
      }
      .zodiac-form input[type="number"] {
        width: calc(100% - 24px);
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 1em;
      }
      .zodiac-form button {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #007bff;
        color: #fff;
        font-size: 1em;
        cursor: pointer;
        transition: background-color 0.3s;
      }
      .zodiac-form button:hover {
        background-color: #0056b3;
      }
      .zodiac-result {
        margin-top: 20px;
      }
      .zodiac-result h2 {
        color: #007bff;
      }
      .zodiac-result p {
        color: #333;
        margin: 5px 0;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Game Zodiak</h1>
      <div class="zodiac-form">
        <form id="formZodiac">
          <label for="day">Tanggal: </label>
          <input type="number" id="day" name="day" min="1" max="31" required />
          <label for="month">Bulan: </label>
          <input
            type="number"
            id="month"
            name="month"
            min="1"
            max="12"
            required
          />
          <button type="button" onclick="showZodiac()">Cari Zodiak</button>
        </form>
      </div>
      <div class="zodiac-result" id="zodiac-result"></div>
    </div>

    <script>
      const zodiacs = [
        {
          sign: "Aries",
          start: { month: 3, day: 21 },
          end: { month: 4, day: 19 },
        },
        {
          sign: "Taurus",
          start: { month: 4, day: 20 },
          end: { month: 5, day: 20 },
        },
        {
          sign: "Gemini",
          start: { month: 5, day: 21 },
          end: { month: 6, day: 20 },
        },
        {
          sign: "Cancer",
          start: { month: 6, day: 21 },
          end: { month: 7, day: 22 },
        },
        {
          sign: "Leo",
          start: { month: 7, day: 23 },
          end: { month: 8, day: 22 },
        },
        {
          sign: "Virgo",
          start: { month: 8, day: 23 },
          end: { month: 9, day: 22 },
        },
        {
          sign: "Libra",
          start: { month: 9, day: 23 },
          end: { month: 10, day: 22 },
        },
        {
          sign: "Scorpio",
          start: { month: 10, day: 23 },
          end: { month: 11, day: 21 },
        },
        {
          sign: "Sagittarius",
          start: { month: 11, day: 22 },
          end: { month: 12, day: 21 },
        },
        {
          sign: "Capricorn",
          start: { month: 12, day: 22 },
          end: { month: 1, day: 19 },
        },
        {
          sign: "Aquarius",
          start: { month: 1, day: 20 },
          end: { month: 2, day: 18 },
        },
        {
          sign: "Pisces",
          start: { month: 2, day: 19 },
          end: { month: 3, day: 20 },
        },
      ];

      const horoscopes = {
        Aries: {
          health: "Kesehatan Anda prima, tetapi jangan lupa berolahraga.",
          finance:
            "Keuangan Anda stabil, hindari pengeluaran yang tidak perlu.",
          love: "Asmara Anda akan berkembang dengan baik, komunikasikan perasaan Anda.",
          career: "Karir Anda sedang naik, ambil peluang yang ada.",
        },
        Taurus: {
          health: "Kesehatan Anda perlu perhatian ekstra, hindari stres.",
          finance: "Keuangan Anda membaik, simpan sebagian untuk masa depan.",
          love: "Asmara Anda akan menghadapi tantangan, tetaplah sabar.",
          career: "Karir Anda stabil, fokus pada pekerjaan saat ini.",
        },
        Gemini: {
          health: "Kesehatan Anda dalam kondisi baik, jaga pola makan.",
          finance:
            "Keuangan Anda stabil, tetapi waspadai pengeluaran mendadak.",
          love: "Asmara Anda akan mendapat kejutan menyenangkan.",
          career: "Karir Anda sedang berkembang, teruskan usaha Anda.",
        },
        Cancer: {
          health: "Kesehatan Anda baik, tetapi tetap waspada terhadap cuaca.",
          finance: "Keuangan Anda cukup baik, hindari investasi berisiko.",
          love: "Asmara Anda akan harmonis, nikmati waktu bersama pasangan.",
          career:
            "Karir Anda membutuhkan inovasi, jangan takut untuk mencoba hal baru.",
        },
        Leo: {
          health: "Kesehatan Anda luar biasa, tetaplah aktif.",
          finance: "Keuangan Anda stabil, tetapi tetap berhemat.",
          love: "Asmara Anda penuh gairah, sampaikan perasaan Anda.",
          career: "Karir Anda memerlukan dedikasi ekstra, fokuslah.",
        },
        Virgo: {
          health:
            "Kesehatan Anda memerlukan perhatian lebih, jangan abaikan gejala.",
          finance:
            "Keuangan Anda cukup baik, tetapi hindari pengeluaran besar.",
          love: "Asmara Anda akan menghadapi ujian, tetap tenang dan komunikatif.",
          career: "Karir Anda sedang naik daun, manfaatkan peluang yang ada.",
        },
        Libra: {
          health: "Kesehatan Anda stabil, jaga keseimbangan hidup.",
          finance: "Keuangan Anda stabil, tetaplah bijak dalam berbelanja.",
          love: "Asmara Anda harmonis, nikmati kebersamaan dengan pasangan.",
          career:
            "Karir Anda memerlukan usaha ekstra, tetap fokus dan bekerja keras.",
        },
        Scorpio: {
          health: "Kesehatan Anda prima, teruskan gaya hidup sehat.",
          finance:
            "Keuangan Anda baik, tetapi hindari keputusan finansial besar.",
          love: "Asmara Anda penuh gairah, sampaikan perasaan Anda dengan jujur.",
          career: "Karir Anda membutuhkan ketekunan, jangan mudah menyerah.",
        },
        Sagittarius: {
          health: "Kesehatan Anda cukup baik, tetapi jaga pola makan.",
          finance: "Keuangan Anda stabil, tetapi hindari pemborosan.",
          love: "Asmara Anda akan mendapatkan kejutan manis.",
          career: "Karir Anda sedang berkembang, teruskan usaha Anda.",
        },
        Capricorn: {
          health: "Kesehatan Anda stabil, tetap jaga pola hidup sehat.",
          finance: "Keuangan Anda stabil, simpan sebagian untuk masa depan.",
          love: "Asmara Anda akan harmonis, nikmati waktu bersama pasangan.",
          career:
            "Karir Anda memerlukan inovasi, jangan takut mencoba hal baru.",
        },
        Aquarius: {
          health: "Kesehatan Anda baik, tetapi tetap waspada terhadap cuaca.",
          finance: "Keuangan Anda cukup baik, hindari investasi berisiko.",
          love: "Asmara Anda akan harmonis, nikmati kebersamaan dengan pasangan.",
          career:
            "Karir Anda membutuhkan inovasi, jangan takut untuk mencoba hal baru.",
        },
        Pisces: {
          health: "Kesehatan Anda luar biasa, tetaplah aktif.",
          finance: "Keuangan Anda stabil, tetapi tetap berhemat.",
          love: "Asmara Anda penuh gairah, sampaikan perasaan Anda.",
          career: "Karir Anda memerlukan dedikasi ekstra, fokuslah.",
        },
      };

      function showZodiac() {
        const day = parseInt(document.getElementById("day").value);
        const month = parseInt(document.getElementById("month").value);

        if (
          isNaN(day) ||
          isNaN(month) ||
          day < 1 ||
          day > 31 ||
          month < 1 ||
          month > 12
        ) {
          alert("Masukkan tanggal dan bulan yang valid.");
          return;
        }

        let zodiacSign = "";

        for (let zodiac of zodiacs) {
          if (
            (month === zodiac.start.month && day >= zodiac.start.day) ||
            (month === zodiac.end.month && day <= zodiac.end.day) ||
            (month > zodiac.start.month && month < zodiac.end.month) ||
            (month === 12 &&
              zodiac.sign === "Capricorn" &&
              day >= zodiac.start.day) ||
            (month === 1 &&
              zodiac.sign === "Capricorn" &&
              day <= zodiac.end.day)
          ) {
            zodiacSign = zodiac.sign;
            break;
          }
        }

        if (zodiacSign) {
          const horoscope = horoscopes[zodiacSign];
          document.getElementById("zodiac-result").innerHTML = `
                    <h2>${zodiacSign}</h2>
                    <p><strong>Kesehatan:</strong> ${horoscope.health}</p>
                    <p><strong>Keuangan:</strong> ${horoscope.finance}</p>
                    <p><strong>Asmara:</strong> ${horoscope.love}</p>
                    <p><strong>Karir:</strong> ${horoscope.career}</p>
                `;
        } else {
          document.getElementById(
            "zodiac-result"
          ).innerHTML = `<p>Tidak dapat menemukan zodiak untuk tanggal dan bulan yang diberikan.</p>`;
        }
      }
    </script>
  </body>
</html>
