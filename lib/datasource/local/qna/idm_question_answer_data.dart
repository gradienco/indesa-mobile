class QNA {

  var listQNA = [

    {
      'id' : 1,
      'pertanyaan' : 'Dari lokasi atau posisi  tengah desa ini, berapa waktu tempuh ke prasarana kesehatan (puskesmas, klinik dokter atau rumah sakit) terdekat?',
      'jawaban' : [
        {'text' : 'waktu tempuh ke prasarana kesehatan < 30 menit dan dengan kondisi jalan yang sangat baik', 'score' : 5},
        {'text' : 'waktu tempuh ke prasarana kesehatan < 30 menit dan dengan kondisi jalan yang baik', 'score' : 4},
        {'text' : 'waktu tempuh ke prasarana kesehatan 30 – 60 menit dan dengan kondisi jalan yang baik', 'score' : 3},
        {'text' : 'waktu tempuh ke prasarana kesehatan 30 – 60 menit dan dengan kondisi jalan yang buruk', 'score' : 2},
        {'text' : 'waktu tempuh ke prasarana kesehatan > 60 menit dan dengan kondisi jalan yang buruk', 'score' : 1},
        {'text' : 'waktu tempuh ke prasarana kesehatan  > 120 menit dan dengan kondisi jalan yang buruk', 'score' : 0},
      ]
    },

    {
      'id' : 2,
      'pertanyaan' : 'Berapa jumlah tenaga kesehatan bidan tersedia di desa ini?',
      'jawaban' : [
        {'text' : 'tersedia lebih dari 2 bidan yang memiliki sertifikat kompetensi', 'score' : 5},
        {'text' : 'tersedia lebih dari 1 bidan yang memiliki sertifikat kompetensi', 'score' : 4},
        {'text' : 'tersedia hanya 1 bidan, memiliki sertifikat kompetensi', 'score' : 3},
        {'text' : 'tersedia hanya 1 bidan, belum memiliki sertifikat kompetensi', 'score' : 2},
        {'text' : 'tersedia hanya 1 bidan, dan kedatangannya tidak menentu', 'score' : 1},
        {'text' : 'tidak ada bidan yang berkunjung sama sekali', 'score' : 0},
      ]
    },

    {
      'id' : 3,
      'pertanyaan' : 'Berapa tenaga kesehatan dokter tersedia di desa ini?',
      'jawaban' : [
        {'text' : 'terdapat 1 dokter yang stand by di Desa dan rasio dokter dengan jumlah penduduk 1 : 2.500 (WHO)', 'score' : 5},
        {'text' : 'dokter tidak stand by di Desa namun rasio dokter dan jumlah penduduk 1 : 2.500', 'score' : 4},
        {'text' : 'terdapat 1 dokter yang stand by di Desa dan rasio dokter dengan jumlah penduduk 1 : ≥ 2500', 'score' : 3},
        {'text' : 'dokter tidak stand by di Desa dan rasio dokter dengan jumlah penduduk 1 : ≥ 2500', 'score' : 2},
        {'text' : 'ada dokter namun kedatangannya tidak menentu', 'score' : 1},
        {'text' : 'dokter tidak pernah datang sama sekali', 'score' : 0},
      ]
    },

   {
     'id' : 4,
     'pertanyaan' : 'Berapa tersedia tenaga kesehatan lainnya di desa  ini?',
     'jawaban' : [
       {'text' : '7 jenis tenaga kesehatan tersedia di Desa (Tenaga Medis, Keperawatan, Kefarmasian, TKM, Gizi, Keterapian, Keteknisan', 'score' : 5},
       {'text' : '5 jenis tenaga kesehatan tersedia di Desa (Tenaga Medis, Keperawatan, Kefarmasian, Tenaga Kesehatan Masyarakat, Tenaga Gizi)', 'score' : 4},
       {'text' : '4 jenis tenaga kesehatan tersedia di Desa (Tenaga Medis, Keperawatan, Kefarmasian, Kesehatan Masyarakat)', 'score' : 3},
       {'text' : '3 jenis tenaga kesehatan tersedia di Desa (Tenaga Medis, Tenaga Keperawatan, Tenaga Kefarmasian', 'score' : 2},
       {'text' : '2 jenis tenaga kesehatan tersedia di Desa (Tenaga Medis, Tenaga Keperawatan)', 'score' : 1},
       {'text' : 'tidak ada tenaga kesehatan di Desa', 'score' : 0},
     ]
   },

   {
     'id' : 5,
     'pertanyaan' : 'Dari lokasi atau posisi  tengah desa ini, berapa waktu tempuh ke poskesdes, polindes atau posyandu terdekat?',
     'jawaban' : [
       {'text' : 'terdapat poskesdes dan atau polindes dan posyandu yang dapat dicapai masyarakat dalam waktu  ≤ 10 menit', 'score' : 5},
       {'text' : 'terdapat poskesdes dan atau polindes dan posyandu yang dapat dicapai masyarakat dalam waktu  > 10 menit', 'score' : 4},
       {'text' : 'hanya terdapat posyandu yang dapat dicapai masyarakat dalam waktu  ≤ 10 Menit', 'score' : 3},
       {'text' : 'hanya terdapat posyandu yang dapat dicapai masyarakat dalam waktu  > 10 menit', 'score' : 2},
       {'text' : 'hanya terdapat terdapat posyandu yang dapat dicapai masyarakat dalam waktu  > 10 menit', 'score' : 1},
       {'text' : 'tidak ada akses ke poskesdes, polindes dan posyandu', 'score' : 0},
     ]
   },

   {
     'id' : 6,
     'pertanyaan' : 'Bagaimana Tingkat aktivitas posyandu di desa ini?',
     'jawaban' : [
       {'text' : 'Posyandu memberikan layanan utama yang meliputi KIA, KB, Imunisasi, dan Gizi serta serta minimal 1 kegiatan tambahan', 'score' : 5},
       {'text' : 'Posyandu memberikan layanan utama yang meliputi KIA, KB, Imunisasi, dan Gizi', 'score' : 4},
       {'text' : 'Posyandu memberikan 3 layanan utama', 'score' : 3},
       {'text' : 'Posyandu memberikan 2 layanan utama', 'score' : 2},
       {'text' : 'Posyandu memberikan 1 pelayanan utama', 'score' : 1},
       {'text' : 'Posyandu tidak ada aktifitas', 'score' : 0},
     ]
   },

   {
     'id' : 7,
     'pertanyaan' : 'Bagaimana tingkat kepesertaan BPJS di desa ini?',
     'jawaban' : [
       {'text' : 'semua warga telah menjadi peserta BPJS', 'score' : 5},
       {'text' : '≥ 80% warga telah menjadi peserta BPJS', 'score' : 4},
       {'text' : '60% - 80% warga telah menjadi peserta BPJS', 'score' : 3},
       {'text' : '≥ 40% < 60% warga telah menjadi peserta BPJS', 'score' : 2},
       {'text' : 'kurang dari 40% warga yang menjadi peserta BPJS', 'score' : 1},
       {'text' : 'tidak ada warga yang menjadi anggota BPJS', 'score' : 0},
     ]
   },

   {
     'id' : 8,
     'pertanyaan' : 'Dari lokasi tengah desa, bagaimana akses jalan dan jarak jalan  ke tempat lokasi pendidikan dasar SD/MI?',
     'jawaban' : [
       {'text' : 'akses ke pendididan dasar berjarak < 6 km dengan kondisi jalan yang baik dan dapat ditempuh oleh siswa dengan mudah', 'score' : 5},
       {'text' : 'akses ke pendididan dasar berjarak < 6 km dengan kondisi jalan yang baik tetapi harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 4},
       {'text' : 'akses ke pendididan dasar berjarak < 6 km dengan kondisi jalan yang rusak dan mudah ditempuh oleh siswa', 'score' : 3},
       {'text' : 'akses ke pendididan dasar berjarak < 6 km dengan kondisi jalan rusak dan harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 2},
       {'text' : 'akses ke pendididan dasar berjarak > 6 km dengan kondisi jalan rusak dan harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 1},
       {'text' : 'tidak ada akses ke pendidikan dasar', 'score' : 0},
     ]
   },

   {
     'id' : 9,
     'pertanyaan' : 'Dari lokasi tengah desa, bagaimana akses jalan dan jarak jalan  ke tempat lokasi pendidikan SMP/MTS?',
     'jawaban' : [
       {'text' : 'akses ke SMP/MTS berjarak < 6 km dengan kondisi jalan yang baik dan dapat ditempuh oleh siswa dengan mudah', 'score' : 5},
       {'text' : 'akses ke SMP/MTS berjarak < 6 km dengan kondisi jalan yang baik tetapi harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 4},
       {'text' : 'akses ke SMP/MTS berjarak < 6 km dengan kondisi jalan yang rusak dan mudah ditempuh oleh siswa', 'score' : 3},
       {'text' : 'akses ke SMP/MTS berjarak < 6 km dengan kondisi jalan rusak dan harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 2},
       {'text' : 'akses ke SMP/MTS berjarak > 6 km dengan kondisi jalan rusak dan harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 1},
       {'text' : 'tidak ada akses ke SMP/MTS', 'score' : 0},
     ]
   },

   {
     'id' : 10,
     'pertanyaan' : 'Dari lokasi tengah desa, bagaimana akses jalan dan jarak jalan  ke tempat lokasi pendidikan SMA/SMK?',
     'jawaban' : [
       {'text' : 'akses ke SMA/SMK berjarak < 6 km dengan kondisi jalan yang baik dan dapat ditempuh oleh siswa dengan mudah', 'score' : 5},
       {'text' : 'akses ke SMA/SMK berjarak < 6 km dengan kondisi jalan yang baik tetapi harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 4},
       {'text' : 'akses ke SMA/SMK berjarak < 6 km dengan kondisi jalan yang rusak dan mudah ditempuh oleh siswa', 'score' : 3},
       {'text' : 'akses ke SMA/SMK  berjarak < 6 km dengan kondisi jalan rusak dan harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 2},
       {'text' : 'akses ke SMA/SMK berjarak > 6 km dengan kondisi jalan rusak dan harus ditempuh dengan kendaraan roda 2 atau roda 4', 'score' : 1},
       {'text' : 'tidak ada akses ke SMA/SMK', 'score' : 0},
     ]
   },

   {
     'id' : 11,
     'pertanyaan' : 'Bagaimana kegiatan pemberantasan buta aksara di desa ini?',
     'jawaban' : [
       {'text' : 'ada kegiatan pemberantasan buta aksara yang terlembaga, terencana, dan terjadwal dengan baik, dan atau Desa bebas buta aksara', 'score' : 5},
       {'text' : 'ada kegiatan pemberantasan buta aksara yang terlembaga, terencana, namun jadwalnya tidak pasti', 'score' : 4},
       {'text' : 'kegiatan pemberantasan buta aksara yang terlembaga, tidak terencana, dan jadwalnya tidak pasti', 'score' : 3},
       {'text' : 'kegiatan pemberantasan buta aksara tidak terlembaga, tidak terencana, dan jadwalnya tidak pasti', 'score' : 2},
       {'text' : 'tidak ada kegiatan pemberantasan buta aksara', 'score' : 1},
       {'text' : 'sebagian besar penduduk mengalami buta aksara dan tidak ada kegiatan pemberantasan buta aksara', 'score' : 0},
     ]
   },

   {
     'id' : 12,
     'pertanyaan' : 'Bagaimana kegiatan PAUD di desa ini?',
     'jawaban' : [
       {'text' : 'ada kegiatan PAUD yang terlembaga, menempati lokasi yang layak, terjadwal dengan baik, dan memiliki guru yang bersertifikat sebagai pengajar PAUD', 'score' : 5},
       {'text' : 'ada kegiatan PAUD yang terlembaga, menempati lokasi yang layak, terjadwal dengan baik, tetapi belum memiliki guru yang bersertifikat sebagai pengajar PAUD', 'score' : 4},
       {'text' : 'ada kegiatan PAUD yang terlembaga, terjadwal dengan baik, memiliki guru yang bersertifikat sebagai pengajar PAUD, tetapi menempati lokasi yang kurang layak', 'score' : 3},
       {'text' : 'ada kegiatan PAUD yang terlembaga, terjadwal dengan baik, namun belum memiliki guru yang bersertifikat sebagai pengajar PAUD, dan menempati lokasi yang kurang layak', 'score' : 2},
       {'text' : 'ada kegiatan PAUD yang terlembaga, tidak terjadwal dengan baik, belum memiliki guru yang bersertifikat sebagai pengajar PAUD, dan menempati lokasi yang kurang layak', 'score' : 1},
       {'text' : 'tidak ada kegiatan PAUD sama sekali', 'score' : 0},
     ]
   },

   {
     'id' : 13,
     'pertanyaan' : 'Bagaimana Kegiatan PKBM/Paket ABC di desa ini?',
     'jawaban' : [
       {'text' : 'ada kegiatan PKBM/Paket ABC yang terlembaga, terjadwal dengan baik, aktif, dan  menempati lokasi yang layak', 'score' : 5},
       {'text' : 'ada kegiatan PKBM/Paket ABC yang terlembaga, terjadwal dengan baik, aktif, tetapi masih menempati lokasi yang kurang layak', 'score' : 4},
       {'text' : 'ada kegiatan PKBM/Paket ABC yang terlembaga, terjadwal dengan baik, kurang aktif aktif, dan masih menempati lokasi yang kurang layak', 'score' : 3},
       {'text' : 'ada kegiatan PKBM/Paket ABC yang terlembaga, tidak terjadwal dengan baik, dan  menempati lokasi yang kurang layak', 'score' : 2},
       {'text' : 'ada kegiatan PKBM/Paket ABC namun belum terlembaga, tidak terjadwal dengan baik, dan  menempati lokasi yang kurang layak', 'score' : 1},
       {'text' : 'tidak ada PKBM/Paket ABC', 'score' : 0},
     ]
   },

   {
     'id' : 14,
     'pertanyaan' : 'Bagaimana kondisi akses ke pusat keterampilan/kursus? ',
     'jawaban' : [
       {'text' : 'di Desa terdapat beberapa pusat keterampilan/kursus yang bisa diakses oleh seluruh warga desa', 'score' : 5},
       {'text' : 'terdapat beberapa pusat keterampilan/kursus di luar Desa yang bisa diakses oleh seluruh warga desa', 'score' : 4},
       {'text' : 'terdapat beberapa pusat keterampilan/kursus di luar Desa yang hanya bisa diakses oleh sebagian warga desa', 'score' : 3},
       {'text' : 'terdapat hanya satu pusat keterampilan/kursus di luar Desa yang hanya bisa diakses oleh sebagian warga desa', 'score' : 2},
       {'text' : 'sebagian besar warga Desa tidak memiliki akses ke pusat keterampilan/kursus yang ada', 'score' : 1},
       {'text' : 'seluruh warga Desa yang tidak memiliki akses ke pusat keterampilan/kursus', 'score' : 0},
     ]
   },

   {
     'id' : 15,
     'pertanyaan' : 'Bagaimana kondisi Taman Bacaan Masyarakat atau Perpustakaan Desa di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa terdapat Taman Bacaan Masyarakat atau Perpustakaan Desa yang memiliki koleksi buku yang berkualitas, secara aktif dikunjungi oleh sebagian besar warga Desa dan menempati gedung yang layak', 'score' : 5},
       {'text' : 'di Desa terdapat Taman Bacaan Masyarakat atau Perpustakaan Desa yang memiliki koleksi buku yang berkualitas, secara aktif dikunjungi oleh sebagian besar warga Desa, tetapi menempati gedung yang kurang layak', 'score' : 4},
       {'text' : 'di Desa terdapat Taman Bacaan Masyarakat atau Perpustakaan Desa yang memiliki koleksi buku yang berkualitas, secara aktif dikunjungi oleh sebagian kecil warga Desa, dan menempati gedung yang kurang layak', 'score' : 3},
       {'text' : 'di Desa terdapat Taman Bacaan Masyarakat atau Perpustakaan Desa yang memiliki koleksi buku yang kurang berkualitas, secara aktif dikunjungi oleh sebagian kecil warga Desa, dan menempati gedung yang kurang layak', 'score' : 2},
       {'text' : 'di Desa terdapat Taman Bacaan Masyarakat atau Perpustakaan Desa yang memiliki koleksi buku yang kurang berkualitas, jarang dikunjungi warga Desa, dan menempati gedung yang kurang layak', 'score' : 1},
       {'text' : 'tidak ada Taman Bacaan Masyarakat atau Perpustakaan Desa', 'score' : 0},
     ]
   },

   {
     'id' : 16,
     'pertanyaan' : 'Bagaimana Kebiasaan gotong royong di desa ini?',
     'jawaban' : [
       {'text' : 'gotong royong di Desa dilakukan secara rutin setiap minggu, melibatkan seluruh warga Desa dan atau pada saat-saat tertentu (misalnya membersihkan rumah ibadah, acara pernikahan, dll)', 'score' : 5},
       {'text' : 'gotong royong di Desa dilakukan secara rutin setiap bulan, melibatkan seluruh warga  dan pada saat-saat tertentu (misalnya membersihkan rumah ibadah, acara pernikahan, dll)', 'score' : 4},
       {'text' : 'gotong royong di Desa dilakukan hanya pada saat tertentu saja dan hanya melibatkan sebagian warga Desa', 'score' : 3},
       {'text' : 'gotong royong di Desa dilakukan hanya jika saat lomba Desa dan hanya melibatkan sebagian kecil warga Desa', 'score' : 2},
       {'text' : 'gotong royong di Desa dilakukan hanya jika ada perintah dari Kepala Kampung dan melibatkan sebagian kecil warga Desa', 'score' : 1},
       {'text' : 'tidak ada kegiatan gotong royong di Desa', 'score' : 0},
     ]
   },

   {
     'id' : 17,
     'pertanyaan' : 'Bagaimana Keberadaan ruang publik terbuka (alun-alun desa, sungai tempat berenang, taman desa)  bagi warga yg tidak berbayar di desa ini?',
     'jawaban' : [
       {'text' : 'Desa menyediakan ruang publik terbuka bagi warga yang tidak berbayar, aman, dan nyaman', 'score' : 5},
       {'text' : 'Desa menyediakan ruang publik terbuka bagi warga yang tidak berbayar, aman, tetapi tidak nyaman', 'score' : 4},
       {'text' : 'Desa menyediakan ruang publik terbuka bagi warga yang tidak berbayar, nyaman, tetapi tidak aman', 'score' : 3},
       {'text' : 'Desa menyediakan ruang publik terbuka bagi warga yang tidak berbayar, tetapi tidak dan tidak nyaman', 'score' : 2},
       {'text' : 'Desa menyediakan ruang publik terbuka bagi warga yang berbayar', 'score' : 1},
       {'text' : 'tidak ada ruang publik yang terbuka bagi warga', 'score' : 0},
     ]
   },

   {
     'id' : 18,
     'pertanyaan' : 'Bagaimana ketersediaan fasilitas/lapangan olahraga di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa tersedia minimal 4 jenis fasilitas/lapangan olah raga yang secara aktif digunakan warga dan tidak berbayar', 'score' : 5},
       {'text' : 'di Desa tersedia 3 jenis fasilitas/lapangan olah raga yang secara aktif digunakan warga dan tidak berbayar', 'score' : 4},
       {'text' : 'di Desa tersedia 2 jenis fasilitas/lapangan olah raga yang secara aktif digunakan warga dan tidak berbayar', 'score' : 3},
       {'text' : 'di Desa tersedia 1 jenis fasilitas/lapangan olah raga yang secara aktif digunakan warga dan tidak berbayar', 'score' : 2},
       {'text' : 'di Desa terdapat fasilitas /lapangan olahraga tidak berbayar tetapi tidak dimanfaatkan oleh warga', 'score' : 1},
       {'text' : 'di Desa tidak tersedia fasilitas /lapangan olahraga', 'score' : 0},
     ]
   },

   {
     'id' : 19,
     'pertanyaan' : 'Bagaimana kondisi kelompok kegiatan olahraga di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa terdapat minimal 4 jenis kelompok kegiatan olah raga yang secara aktif menggunakan fasilitas yang ada', 'score' : 5},
       {'text' : 'di Desa terdapat 3 jenis kelompok kegiatan olah raga yang secara aktif menggunakan fasilitas yang ada', 'score' : 4},
       {'text' : 'di Desa terdapat 2 jenis kelompok kegiatan olah raga yang secara aktif menggunakan fasilitas yang ada', 'score' : 3},
       {'text' : 'di terdapat 1 jenis kelompok kegiatan olah raga yang secara aktif menggunakan fasilitas yang ada', 'score' : 2},
       {'text' : 'di Desa terdapat kelompok kegiatan olah raga namun tidak aktif menggunakan fasilitas yang ada', 'score' : 1},
       {'text' : 'di Desa tidak ada kelompok dan tidak ada kegiatan olah raga', 'score' : 0},
     ]
   },

   {
     'id' : 20,
     'pertanyaan' : 'Bagaimana kondisi warga desa ini? apakah terdiri dari beberapa suku/etnis?',
     'jawaban' : [
       {'text' : 'warga desa terdiri dari satu atau lebih suku/etnis, secara aktif bekerjasama dalam berbagai kegiatan di Desa dalam semangat saling menghormati', 'score' : 5},
       {'text' : 'warga desa terdiri dari satu atau lebih suku/etnis, jarang bekerjasama dalam berbagai kegiatan di Desa, dalam semangat saling menghormati', 'score' : 4},
       {'text' : 'warga desa terdiri dari satu atau lebih suku/etnis, tidak bisa bekerja sama dan tidak saling menghormati', 'score' : 3},
       {'text' : 'warga Desa terdiri dari satu suku/etnis, tidak bisa bekerjasama dan tidak saling menghormati', 'score' : 2},
       {'text' : 'warga Desa terdiri dari satu atau lebih suku/etnis dan tidak ada toleransi', 'score' : 1},
       {'text' : 'warga Desa terdiri dari satu atau lebih suku/etnis dan sering terjadi keributan antar suku/etnis', 'score' : 0},
     ]
   },

   {
     'id' : 21,
     'pertanyaan' : 'Bagaimana suasana warga desa berkomunikasi sehari-hari? Apakah menggunakan bahasa yg berbeda?',
     'jawaban' : [
       {'text' : 'warga terdiri dari satu atau lebih suku/etnis dan berkomunikasi dengan menggunakan bahasa Indonesia', 'score' : 5},
       {'text' : 'warga terdiri dari satu atau lebih suku/etnis dan berkomunikasi dengan menggunakan bahasa daerah yang mayoritas', 'score' : 4},
       {'text' : 'warga terdiri dari satu atau lebih suku/etnis dan berkomunikasi dengan menggunakan bahasa daerah yang tertentu', 'score' : 3},
       {'text' : 'warga terdiri dari satu atau lebih suku/etnis dan berkomunikasi dengan menggunakan bahasa daerah  masing-masing namun bisa dimengerti kedua belah pihak', 'score' : 2},
       {'text' : 'warga terdiri dari satu atau lebih suku/etnis dan berkomunikasi dengan menggunakan bahasa daerah masing-masing namun tidak saling mengerti', 'score' : 1},
       {'text' : 'warga Desa pernah berkonflik karena bahasa yang digunakan dalam berkomunikasi', 'score' : 0},
     ]
   },

   {
     'id' : 22,
     'pertanyaan' : 'Bagaimana kondisi keanekaragaman agama penduduk di Desa ini?',
     'jawaban' : [
       {'text' : 'warga desa menganut satu atau lebih agama, secara aktif bekerjasama dalam berbagai kegiatan di Desa dalam semangat saling menghormati', 'score' : 5},
       {'text' : 'warga desa menganut satu atau lebih agama, jarang bekerjasama dalam berbagai kegiatan di Desa, dalam semangat saling menghormati', 'score' : 4},
       {'text' : 'warga desa menganut satu atau lebih agama, tidak bisa bekerja sama dan tidak saling menghormati', 'score' : 3},
       {'text' : 'warga Desa menganut satu agama, tidak bisa bekerjasama dan tidak saling menghormati', 'score' : 2},
       {'text' : 'warga Desa menganut satu atau lebih agama dan tidak ada toleransi', 'score' : 1},
       {'text' : 'warga Desa menganut satu atau lebih agama dan sering terjadi keributan antar agama', 'score' : 0},
     ]
   },

   {
     'id' : 23,
     'pertanyaan' : 'Bagaimana kondisi warga desa ini membangun dan memelihara poskamling lingkungan?',
     'jawaban' : [
       {'text' : 'warga membangun dan memelihara poskamling di setiap RT', 'score' : 5},
       {'text' : 'warga membangun poskamling di tingkat dusun', 'score' : 4},
       {'text' : 'warga membangun poskamling di tingkat Desa', 'score' : 3},
       {'text' : 'poskamling hanya dibangun sewaktu-waktu dan jika hanya diperlukan', 'score' : 2},
       {'text' : 'tidak ada poskamling dan tingkat kriminalitas rendah', 'score' : 1},
       {'text' : 'tidak ada poskamling dan tingkat kriminalitas tinggi', 'score' : 0},
     ]
   },

   {
     'id' : 24,
     'pertanyaan' : 'Bagaimana Partisipasi warga mengadakan ronda bergilir siskamling?',
     'jawaban' : [
       {'text' : 'semua warga berpartisipasi mengadakan ronda siskamling dan terjadwal dengan baik', 'score' : 5},
       {'text' : 'tidak semua warga berpartisipasi mengadakan ronda siskamling dan tidak terjadwal dengan baik', 'score' : 4},
       {'text' : 'siskamling dilakukan oleh beberapa warga dan warga lainnya berpartisipasi dalam bentuk dana keamanan', 'score' : 3},
       {'text' : 'siskamling dilakukan oleh beberapa warga dan warga lainnya  tidak berpartisipasi dalam bentuk dana keamanan', 'score' : 2},
       {'text' : 'siskamling dilakukan sewaktu-waktu saja oleh beberapa orang warga', 'score' : 1},
       {'text' : 'tidak ada siskamling', 'score' : 0},
     ]
   },

   {
     'id' : 25,
     'pertanyaan' : 'Bagaimana Tingkat kriminalitas yang terjadi di Desa setahun belakangan ini?',
     'jawaban' : [
       {'text' : 'tidak pernah ada kriminalitas di Desa selama 1 tahun terakhir', 'score' : 5},
       {'text' : 'ada 1 kasus kriminalitas di Desa selama 1 tahun terakhir', 'score' : 4},
       {'text' : 'ada 2 kasus kriminalitas di Desa selama 1 tahun terakhir terakhir', 'score' : 3},
       {'text' : 'ada 3 kasus kriminalitas di Desa selama 1 tahun terakhir terakhir', 'score' : 2},
       {'text' : 'terjadi 4 kasus kriminal di Desa selama 1 tahun terakhir', 'score' : 1},
       {'text' : 'terjadi lebih dari 4 kasus kriminal di Desa selama 1 tahun terakhir', 'score' : 0},
     ]
   },

   {
     'id' : 26,
     'pertanyaan' : 'Bagaimana Tingkat konflik (akibat kesenjangan sosial, ekonomi, agama, pemilu) yang terjadi di Desa ini setahun belakangan?',
     'jawaban' : [
       {'text' : 'tidak pernah terjadi konflik di Desa selama 1 tahun terakhir', 'score' : 5},
       {'text' : 'terjadi 1 kasus konflik di Desa selama 1 tahun terakhir', 'score' : 4},
       {'text' : 'terjadi 2 kasus konflik di Desa selama 1 tahun terakhir', 'score' : 3},
       {'text' : 'terjadi 3 kasus konflik di Desa selama 1 tahun terakhir', 'score' : 2},
       {'text' : 'terjadi 4 kasus konflik di Desa selama 1 tahun terakhir', 'score' : 1},
       {'text' : 'terjadi lebih dari 4 kasus konflik di Desa selama 1 tahun terakhir', 'score' : 0},
     ]
   },

   {
     'id' : 27,
     'pertanyaan' : 'Bagaimana upaya penyelesaian konflik yang terjadi didesa ini?',
     'jawaban' : [
       {'text' : 'terdapat lembaga atau forum musyawarah penyelesaian konflik di Desa, yang terdiri dari berbagai elemen masyarakat Desa', 'score' : 5},
       {'text' : 'lembaga penyelesaian konflik dibentuk jika terjadi konflik dan anggotanya terdiri berbagai elemen masyarakat Desa', 'score' : 4},
       {'text' : 'tidak ada lembaga penyelesaian konflik, dan jika terjadi konflik penyelesaiannya dimediasi oleh Kepala Desa dan aparat Desa', 'score' : 3},
       {'text' : 'penyelesaian konflik diserahkan pada pihak-pihak yang berkonflik dan Aparat Desa tidak ikut campur tangan', 'score' : 2},
       {'text' : 'upaya penyelesaian konflik langsung diserahkan ke pihak kepolisian', 'score' : 1},
       {'text' : 'tidak ada upaya penyelesaian konflik', 'score' : 0},
     ]
   },

   {
     'id' : 28,
     'pertanyaan' : 'Bagaimana kondisi akses jalan dan jarak akses ke Sekolah Luar Biasa terdekat?',
     'jawaban' : [
       {'text' : 'semua warga yang membutuhkan memiliki akses ke sekolah luar biasa', 'score' : 5},
       {'text' : 'hanya sebagian warga yang membutuhkan yang memiliki kemudahan akses ke sekolah luar biasa', 'score' : 4},
       {'text' : 'hanya sebagian warga yang membutuhkan yang memiliki akses ke sekolah luar biasa dan itupun sulit dijangkau', 'score' : 3},
       {'text' : 'semua warga sulit untuk mendapatkan akses ke sekolah luar biasa', 'score' : 2},
       {'text' : 'semua warga sulit untuk mendapatkan akses ke sekolah luar biasa dan itupun sulit dijangkau', 'score' : 1},
       {'text' : 'tidak ada akses sama sekali ke sekolah luar biasa', 'score' : 0},
     ]
   },

   {
     'id' : 29,
     'pertanyaan' : 'Apakah di desa ini terdapat Penyandang Kesejahteraan Sosial (Anak Jalanan, Pekerja Seks Komersial dan Pengemis)?',
     'jawaban' : [
       {'text' : 'di Desa tidak terdapat Penyandang Kesejahteraan Sosial (Anak Jalanan, Pekerja Seks Komersial dan Pengemis)', 'score' : 5},
       {'text' : 'di Desa terdapat beberapa warga yang menjadi Anak Jalanan', 'score' : 4},
       {'text' : 'di Desa terdapat beberapa warga yang menjadi Anak Jalanan dan Pengemis', 'score' : 3},
       {'text' : 'di Desa terdapat beberapa warga sebagai Penyandang Kesejahteraan Sosial (Anak Jalanan, Pekerja Seks Komersial dan Pengemis)', 'score' : 2},
       {'text' : 'sebagian besar warga desa sebagai Penyandang Kesejahteraan Sosial (Anak Jalanan, Pekerja Seks Komersial dan Pengemis)', 'score' : 1},
       {'text' : 'seluruh warga Desa adalah Penyandang Kesejahteraan Sosial (Anak Jalanan, Pekerja Seks Komersial dan Pengemis)', 'score' : 0},
     ]
   },

   {
     'id' : 30,
     'pertanyaan' : 'Apakah di desa ini terdapat Penduduk yang mati bunuh diri tiga tahun belakangan ini?',
     'jawaban' : [
       {'text' : 'tidak pernah terjadi kasus bunuh diri di Desa selama 3 tahun terakhir', 'score' : 5},
       {'text' : 'terjadi 1 kasus kasus bunuh diri di Desa selama 3 tahun terakhir', 'score' : 4},
       {'text' : 'terjadi 2 kasus bunuh diri di Desa selama 3 tahun terakhir', 'score' : 3},
       {'text' : 'terjadi 3 kasus bunuh diri di Desa selama 3 tahun terakhir', 'score' : 2},
       {'text' : 'terjadi 4 kasus bunuh diri di Desa selama 3 tahun terakhir', 'score' : 1},
       {'text' : 'terjadi lebih dari 4 kasus bunuh diri di Desa selama 3 tahun terakhir', 'score' : 0},
     ]
   },

   {
     'id' : 31,
     'pertanyaan' : 'Apakah mayoritas penduduk desa ini memiliki sumber air minum yang layak?',
     'jawaban' : [
       {'text' : 'seluruh warga mendapatkan sumber air minum dari PDAM atau sumber lain berbayar, dan pasokannya dapat memenuhi kebutuhan', 'score' : 5},
       {'text' : 'sebagian warga mendapatkan sumber air minum dari PDAM yang pasokannya dapat memenuhi kebutuhan, sedangkan sebagian warga lainnya mendapatkan air minum dari sumber lain yang berbayar', 'score' : 4},
       {'text' : 'seluruh warga memiliki sumber air minum dari sumur warga yang layak atau sumber mata air yang ada di Desa', 'score' : 3},
       {'text' : 'hanya sebagian warga yang memiliki sumber air minum dari sumur yang layak', 'score' : 2},
       {'text' : 'sebagian besar warga tidak memiliki sumber air minum yang layak', 'score' : 1},
       {'text' : 'seluruh warga tidak memiliki sumber air minum yang layak', 'score' : 0},
     ]
   },

   {
     'id' : 32,
     'pertanyaan' : 'Bagaimana akses penduduk desa ini untuk memiliki air untuk mandi dan mencuci?',
     'jawaban' : [
       {'text' : 'seluruh warga memiliki air untuk mandi dan mencuci yang layak dan bersih', 'score' : 5},
       {'text' : 'sebagian besar warga memiliki air untuk mandi dan mencuci yang layak dan bersih', 'score' : 4},
       {'text' : 'seluruh warga memiliki air untuk mandi dan mencuci yang layak namun tidak bersih', 'score' : 3},
       {'text' : 'sebagian besar warga memiliki air untuk mandi dan mencuci yang tidak layak dan tidak bersih', 'score' : 2},
       {'text' : 'air untuk mandi dan mencuci bagi seluruh warga tidak layak', 'score' : 1},
       {'text' : 'seluruh warga tidak ada akses untuk memiliki air untuk mandi dan mencuci', 'score' : 0},
     ]
   },

   {
     'id' : 33,
     'pertanyaan' : 'Apakah mayoritas penduduk desa ini memiliki Jamban (wc) dan septik tank?',
     'jawaban' : [
       {'text' : 'seluruh penduduk Desa memiliki jamban di dalam rumah dan mencerminkan PHBS', 'score' : 5},
       {'text' : 'sebagian besar penduduk Desa memiliki jamban di dalam rumah dan mencerminkan PHBS', 'score' : 4},
       {'text' : 'sebagian besar penduduk memiliki jamban di luar rumah dan mencerminkan PHBS', 'score' : 3},
       {'text' : 'sebagian besar penduduk memiliki jamban di dalam rumah namun tidak mencerminkan PHBS', 'score' : 2},
       {'text' : 'sebagian besar penduduk memiliki jamban di luar rumah dan tidak mencerminkan PHBS', 'score' : 1},
       {'text' : 'seluruh penduduk tidak memiliki jamban yang mencerminkan PHBS', 'score' : 0},
     ]
   },

   {
     'id' : 34,
     'pertanyaan' : 'Apakah di penduduk atau keluarga di desa ini memiliki tempat pembuangan sampah rumah tangga?',
     'jawaban' : [
       {'text' : 'seluruh penduduk memiliki tempat pembuangan sampah, dan dapat memisahkan sampah organik, an organik dan B3', 'score' : 5},
       {'text' : 'sebagian besar penduduk memiliki tempat pembuangan sampah, dan dapat memisahkan sampah organik, an organik dan B3', 'score' : 4},
       {'text' : 'seluruh penduduk memiliki tempat pembuangan sampah namun belum dipisahkan antara sampah organik, an organik dan B3', 'score' : 3},
       {'text' : 'hanya sebagian kecil penduduk yang memiliki tempat pembuangan sampah, dan dapat memisahkan sampah organik, an organik dan B3', 'score' : 2},
       {'text' : 'hanya sebagian kecil penduduk yang memiliki tempat pembuangan sampah, namun tidak memisahkan sampah organik, an organik dan B3', 'score' : 1},
       {'text' : 'seluruh penduduk tidak memiliki tempat pembuangan sampah', 'score' : 0},
     ]
   },

   {
     'id' : 35,
     'pertanyaan' : 'Berapa jumlah keluarga yang telah memiliki aliran listrik di desa ini?',
     'jawaban' : [
       {'text' : 'seluruh rumah warga telah dialiri listrik', 'score' : 5},
       {'text' : 'baru 80% atau lebih rumah warga yang dialiri listrik', 'score' : 4},
       {'text' : 'persentase rumah warga yang dialiri listrik lebih dari 60% tetapi kurang dari 80%', 'score' : 3},
       {'text' : 'persentase rumah warga yang dialiri listrik 40% - 60%', 'score' : 2},
       {'text' : 'persentase rumah warga yang dialiri listrik kurang dari 40%', 'score' : 1},
       {'text' : 'semua rumah warga beluam ada yang dialiri listrik', 'score' : 0},
     ]
   },

   {
     'id' : 36,
     'pertanyaan' : 'Apakah Penduduk desa ini rta-rata memiliki telepon selular dan memperoleh sinyal seluler yang kuat?',
     'jawaban' : [
       {'text' : 'seluruh penduduk memiliki telepon seluler dan memperoleh sinyal yang kuat', 'score' : 5},
       {'text' : 'baru 80% atau lebih penduduk yang memiliki telepon seluler dan sinyal yang kuat', 'score' : 4},
       {'text' : 'persentase penduduk yang memiliki telepon seluler lebih dari 60% tetapi kurang dari 80% dan sinyal yang kuat', 'score' : 3},
       {'text' : 'persentase penduduk yang memiliki telepon seluler sebanyak 40% - 60% dan sinyal yang kuat', 'score' : 2},
       {'text' : 'penduduk yang memiliki telepon seluler kurang dari 40% dan sinyal yang kuat', 'score' : 1},
       {'text' : 'penduduk yang memiliki telepon seluler kurang dari 40% dan sinyalnya tidak kuat', 'score' : 0},
     ]
   },

   {
     'id' : 37,
     'pertanyaan' : 'Apakah penduduk di desa ini bisa menangkap siaran televisi lokal, nasional dan asing?',
     'jawaban' : [
       {'text' : 'seluruh warga dapat menikmati siaran TV lokal, nasional, dan asing di rumah masing-masing', 'score' : 5},
       {'text' : 'seluruh warga baru dapat menikmati siaran TV lokal dan nasional', 'score' : 4},
       {'text' : 'hanya 80% atau lebih warga yang dapat menikmati siaran TV lokal dan nasional', 'score' : 3},
       {'text' : 'hanya 60% - 80% warga yang dapat menikmati siaran TV lokal dan nasional', 'score' : 2},
       {'text' : 'kurang dari 60% warga yang  dapat menikmati siaran TV', 'score' : 1},
       {'text' : 'seluruh warga tidak dapat menikmati siaran TV lokal, nasional, atau asing', 'score' : 0},
     ]
   },

   {
     'id' : 38,
     'pertanyaan' : 'Bagaimana kondisi akses internet penduduk di desa ini?',
     'jawaban' : [
       {'text' : 'seluruh warga memiliki akses internet gratis yang disediakan oleh Desa atau pihak ketiga lainnya', 'score' : 5},
       {'text' : 'seluruh warga memiliki akses internet yang berbayar', 'score' : 4},
       {'text' : 'hanya 80% atau lebih warga memiliki akses internet gratis atau berbayar', 'score' : 3},
       {'text' : 'hanya 50% - 80% warga yang memiliki akses internet', 'score' : 2},
       {'text' : 'kurang dari 50% warga yang memiliki akses internet', 'score' : 1},
       {'text' : 'seluruh warga tidak memiliki akses internet', 'score' : 0},
     ]
   },

   {
     'id' : 39,
     'pertanyaan' : 'Bagaimana jenis kegiatan ekonomi penduduk (pertanian, nelayan, perdagangan, jasa,buruh, pegawai, industri,dll) di desa ini?',
     'jawaban' : [
       {'text' : 'terdapat lebih dari 1 jenis kegiatan ekonomi penduduk', 'score' : 5},
       {'text' : 'hanya terdapat 1 jenis kegiatan ekonomi penduduk', 'score' : 4},
       {'text' : 'hanya terdapat 1 jenis kegiatan ekonomi yang dilakukan oleh lebih dari 50% penduduk', 'score' : 3},
       {'text' : 'hanya 25%- 50% penduduk yang melakukan kegiatan ekonomi', 'score' : 2},
       {'text' : 'penduduk yang melakukan kegiatan ekonomi kurang dari 25%', 'score' : 1},
       {'text' : 'tidak ada penduduk yang melakukan kegiatan ekonomi', 'score' : 0},
     ]
   },

   {
     'id' : 40,
     'pertanyaan' : 'Bagaimana akses penduduk ke pusat perdagangan (pertokoan, pasar permanen dan semi permanen) di desa ini?',
     'jawaban' : [
       {'text' : 'seluruh penduduk memiliki akses yang mudah ke pusat perdagangan', 'score' : 5},
       {'text' : 'seluruh penduduk memiliki akses ke pusata perdagangan namun tempatnya jauh', 'score' : 4},
       {'text' : 'seluruh penduduk memiliki akses ke pusat perdagangan namun tempatnya jauh dan sulit dijangkau', 'score' : 3},
       {'text' : 'hanya 50% atau lebih penduduk yang memiliki akses ke pusat perdagangan', 'score' : 2},
       {'text' : 'kurang dari 50% penduduk yang memiliki akses ke pusat perdagangan', 'score' : 1},
       {'text' : 'tidak ada akses ke pusat perdagangan sama sekali', 'score' : 0},
     ]
   },

   {
     'id' : 41,
     'pertanyaan' : 'Apakah terdapat sektor perdagangan dekat permukiman di desa ini (spt warung dan minimarket)?',
     'jawaban' : [
       {'text' : 'terdapat berbagai sektor perdagangan (warung, mini market) di pemukiman penduduk', 'score' : 5},
       {'text' : 'terdapat sedikit sektor perdagangan (warung, minimarket) di pemukiman penduduk', 'score' : 4},
       {'text' : 'hanya ada satu warung atau minimarket di pemukiman penduduk', 'score' : 3},
       {'text' : 'tidak ada sektor perdagangan di pemukiman penduduk, namun di luar pemukiman terdapat beberapa sektor perdagangan', 'score' : 2},
       {'text' : 'sektor perdagangan berada di luar pemukiman penduduk dan sulit di jangkau', 'score' : 1},
       {'text' : 'tidak ada sektor perdagangan yang bisa diakses oleh penduduk', 'score' : 0},
     ]
   },

   {
     'id' : 42,
     'pertanyaan' : 'Apakah terdapat usaha kedai makanan, restoran, hotel dan penginapan di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa terdapat beberapa usaha kedai makanan, restoran, hotel dan penginapan yang layak', 'score' : 5},
       {'text' : 'di Desa terdapat usaha kedai makanan, restoran, hotel dan penginapan yang layak', 'score' : 4},
       {'text' : 'di Desa terdapat usaha kedai makanan, restoran, hotel dan penginapan namun tidak semuanya layak', 'score' : 3},
       {'text' : 'di Desa hanya terdapat usaha kedai makanan dan restoran', 'score' : 2},
       {'text' : 'di Desa hanya terdapat usaha kedai makanan', 'score' : 1},
       {'text' : 'di Desa tidak terdapat usaha kedai makanan, restoran, hotel dan penginapan', 'score' : 0},
     ]
   },

   {
     'id' : 43,
     'pertanyaan' : 'Apakah terdapat kantor pos dan jasa logistik di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa terdapat kantor pos dan jasa logistik yang beroperasi setiap hari', 'score' : 5},
       {'text' : 'di Desa hanya terdapat jasa logistik yang beroperasi setiap hari', 'score' : 4},
       {'text' : 'di Desa terdapat kantor pos dan/atau jasa logistik tetapi tidak beroperasi setiap hari', 'score' : 3},
       {'text' : 'di Desa terdapat kantor pos dan/atau jasa logistik yang beroperasi 3 hari dalam seminggu', 'score' : 2},
       {'text' : 'di Desa terdapat kantor pos dan/atau jasa logistik yang beroperasi kurang dari 3 hari dalam seminggu', 'score' : 1},
       {'text' : 'di Desa tidak terdapat kantor pos dan/atau jasa logistik', 'score' : 0},
     ]
   },

   {
     'id' : 44,
     'pertanyaan' : 'Apakah tersedianya lembaga perbankan umum (Pemerintah dan Swasta) di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa terdapat beberapa lembaga perbankan baik milik pemerintah maupun swasta', 'score' : 5},
       {'text' : 'di Desa terdapat beberapa lembaga perbankan milik pemerintah', 'score' : 4},
       {'text' : 'di Desa hanya terdapat 1 atau lebih lembaga perbankan milik swasta', 'score' : 3},
       {'text' : 'di Desa hanya terdapat 1 lembaga perbankan milik pemerintah', 'score' : 2},
       {'text' : 'di Desa hanya terdapat 1 lembaga perbankan milik swasta', 'score' : 1},
       {'text' : 'di Desa tidak terdapat lembaga perbankan', 'score' : 0},
     ]
   },

   {
     'id' : 45,
     'pertanyaan' : 'Apakah di desa ini Tersedia BPR (bank perkreditan rakyat)?',
     'jawaban' : [
       {'text' : 'di Desa terdapat lebih dari 2 BPR yang dapat dimanfaatkan oleh seluruh masyarakat Desa', 'score' : 5},
       {'text' : 'di Desa 2 BPR yang dapat dimanfaatkan oleh seluruh masyarakat Desa', 'score' : 4},
       {'text' : 'di Desa hanya terdapat 1 BPR yang dapat dimanfaatkan oleh seluruh masyarakat Desa', 'score' : 3},
       {'text' : 'di Desa hanya terdapat 1 BPR dan hanya dapat diakses oleh sebagian besar masyarakat Desa', 'score' : 2},
       {'text' : 'di Desa hanya terdapat 1 BPR yang hanya dapat diakses oleh sebagian kecil masyarakat Desa', 'score' : 1},
       {'text' : 'di Desa tidak terdapat BPR', 'score' : 0},
     ]
   },

   {
     'id' : 46,
     'pertanyaan' : 'Bgaimana akses penduduk ke penyedia kredit atau perbankan di desa ini?',
     'jawaban' : [
       {'text' : 'seluruh penduduk memiliki akses ke kredit dengan bunga yang sangat ringan', 'score' : 5},
       {'text' : 'sebagian besar penduduk memiliki ke kredit dengan bunga yang sangat ringan', 'score' : 4},
       {'text' : 'hanya sebagian kecil penduduk memiliki akses ke kredit dengan bunga yang ringan', 'score' : 3},
       {'text' : 'sebagian besar penduduk memiliki akses ke kredit namun dengan bunga yang tidak ringan', 'score' : 2},
       {'text' : 'hanya sebagian penduduk yang memiliki akses ke kredit namun dengan bunga yang tidak ringan', 'score' : 1},
       {'text' : 'tidak ada akses ke penduduk ke kredit', 'score' : 0},
     ]
   },

   {
     'id' : 47,
     'pertanyaan' : 'Apakah di desa ini Tersedia lembaga ekonomi rakyat (kud, bumdes)?',
     'jawaban' : [
       {'text' : 'di Desa tersedia 1 lembaga ekonomi rakyat seperti koperasi atau bumdes, yang beroperasi secara aktif dan melayani seluruh masyarakat Desa', 'score' : 5},
       {'text' : 'di Desa tersedia 1 lembaga ekonomi rakyat seperti koperasi atau bumdes, yang beroperasi secara aktif dan melayani sebagian  masyarakat Desa', 'score' : 4},
       {'text' : 'di Desa tersedia 1 lembaga ekonomi rakyat seperti koperasi atau bumdes, yang beroperasi secara aktif dan hanya melayani sedikit masyarakat Desa', 'score' : 3},
       {'text' : 'di Desa tersedia 1 lembaga ekonomi rakyat seperti koperasi atau bumdes, yang kurang aktif dan hanya melayani sebagian masyarakat Desa', 'score' : 2},
       {'text' : 'di Desa tersedia 1 lembaga ekonomi rakyat seperti koperasi atau bumdes, namun sudah tidak aktif', 'score' : 1},
       {'text' : 'tidak ada lembaga ekonomi rakyat seperti koperasi atau bumdes', 'score' : 0},
     ]
   },

   {
     'id' : 48,
     'pertanyaan' : 'Apakah di desa ini terdapat usaha moda transportasi umum (Transportasi Angkutan Umum, trayek reguler dan jam operasi Angkutan Umum, ojek pangkalan, ojek online)?',
     'jawaban' : [
       {'text' : 'di Desa terdapat moda transportasi umum yang secara resmi melayani trayek tersebut dan beroperasi 24 jam', 'score' : 5},
       {'text' : 'di Desa terdapat angkutan umum yang secara resmi melayani trayek tersebut dan hanya  beroperasi pada  waktu siang', 'score' : 4},
       {'text' : 'di Desa terdapat angkutan umum yang secara resmi melayani trayek tersebut dan hanya beroperasi pada jam-jam tertentu', 'score' : 3},
       {'text' : 'di Desa terdapat angkutan umum yang secara tidak resmi melayani trayek tersebut dan hanya  beroperasi pada  waktu siang', 'score' : 2},
       {'text' : 'di Desa terdapat angkutan umum yang secara tidak resmi melayani trayek tersebut dan hanya beroperasi pada jam-jam tertentu', 'score' : 1},
       {'text' : 'di Desa tidak ada moda transportasi umum', 'score' : 0},
     ]
   },

   {
     'id' : 49,
     'pertanyaan' : 'Bagaimana kondisi Jalan yang dapat dilalui oleh kendaraan bermotor rodadua, roda empat atau lebih (sepanjang tahun kecuali musim hujan, kecuali saat tertentu)?',
     'jawaban' : [
       {'text' : 'jalan yang ada di Desa dalam kondisi baik dan dapat dilalui oleh kendaraan bermotor roda empat atau lebih sepanjang tahun', 'score' : 5},
       {'text' : 'jalan yang ada di Desa dalam kondisi baik dan dapat dilalui oleh kendaraan bermotor roda empat  sepanjang tahun', 'score' : 4},
       {'text' : 'jalan yang ada di Desa dalam kondisi baik dan hanya dapat dilalui oleh kendaraan bermotor roda empat sepanjang tahun', 'score' : 3},
       {'text' : 'jalan yang ada di Desa dalam kondisi rusak tetapi dapat dilalui oleh kendaraan bermotor roda empat sepanjang tahun', 'score' : 2},
       {'text' : 'jalan yang ada di Desa dalam kondisi sangat rusak tetapi dapat dilalui oleh kendaraan bermotor roda empat sepanjang tahun', 'score' : 1},
       {'text' : 'jalan yang ada di Desa tidak dapat dilalui oleh kendaraan roda empat', 'score' : 0},
     ]
   },

   {
     'id' : 50,
     'pertanyaan' : 'Bagaimana Kualitas Jalan Desa (Jalan terluas di desa dengan aspal, kerikil, dan tanah)?',
     'jawaban' : [
       {'text' : 'jalan terluas di Desa telah diaspal dengan baik dan dengan lebar badan jalan sangat layak', 'score' : 5},
       {'text' : 'jalan terluas di Desa telah diaspal dengan baik dan dengan lebar badan jalan kurang layak', 'score' : 4},
       {'text' : 'jalan terluas di Desa belum diaspal dengan baik dan dengan lebar badan jalan layak', 'score' : 3},
       {'text' : 'jalan terluas di Desa masih kerikil dan dengan lebar badan jalan layak', 'score' : 2},
       {'text' : 'jalan terluas di Desa masih kerikil dan sempit', 'score' : 1},
       {'text' : 'jalan terluas di Desa masih jalan tanah', 'score' : 0},
     ]
   },

   {
     'id' : 51,
     'pertanyaan' : 'Apakah ada atau tidak adanya pencemaran air, tanah dan udara di desa ini?',
     'jawaban' : [
       {'text' : 'di Desa tidak terjadi pencemaran air, tanah, dan udara dalam kurun waktu 1 tahun terakhir', 'score' : 5},
       {'text' : 'di Desa terjadi pencemaran air, tanah, dan/atau udara pada tingkat yang sangat rendah dalam kurun waktu 1 tahun terakhir', 'score' : 4},
       {'text' : 'di Desa terjadi pencemaran air, tanah, dan/atau udara pada tingkat yang rendah dalam kurun waktu 1 tahun terakhir', 'score' : 3},
       {'text' : 'di Desa terjadi pencemaran air, tanah, dan/atau udara pada tingkat yang sedang dalam kurun waktu 1 tahun terakhir', 'score' : 2},
       {'text' : 'di Desa terjadi pencemaran air, tanah, dan/atau udara pada tingkat yang tinggi dalam kurun waktu 1 tahun terakhir', 'score' : 1},
       {'text' : 'di Desa terjadi pencemaran air, tanah, dan/atau udara pada tingkat yang sangat mengkuatirkan dalam kurun waktu 1 tahun terakhir', 'score' : 0},
     ]
   },

   {
     'id' : 52,
     'pertanyaan' : 'Apakah di desa ini terdapat sungai yg terkena limbah?',
     'jawaban' : [
       {'text' : 'sungai yang mengalir di Desa bebas dari limbah rumah tangga dan industri', 'score' : 5},
       {'text' : 'sungai yang mengalir di Desa terkena limbah dari rumah tangga dan/atau industri tetapi tidak berdampak negatif terhadap kesehatan dan kelestarian hayati', 'score' : 4},
       {'text' : 'sungai yang mengalir di Desa terkena limbah dari rumah tangga dan/atau industri yang mengakibatkan perubahan warna air sungai dan berdampak negatif terhadap kesehatan', 'score' : 3},
       {'text' : 'sungai yang mengalir di Desa terkena limbah dari rumah tangga dan/atau industri yang mengakibatkan perubahan warna dan aroma air sungai dan berdampak negatif terhadap kesehatan dan kelestarian hayati', 'score' : 2},
       {'text' : 'sungai yang mengalir di Desa terkena limbah dari rumah tangga dan/atau industri yang mengakibatkan perubahan warna dan aroma air sungai dan sangat mengganggu kesehatan dan lingkungan', 'score' : 1},
       {'text' : 'sungai yang mengalir di Desa sangat tercemar yang mengakibatkan perubahan warna dan aroma air sungai dan mengakibatkan terganggunya kesehatan masyarakat dan matinya habitat makhluk yang hidup di sungai', 'score' : 0},
     ]
   },

   {
     'id' : 53,
     'pertanyaan' : 'Apakah di desa ini pernah kejadian Bencana Alam (banjir, tanah longsong, kebakaran hutan) setahun tertakhir?',
     'jawaban' : [
       {'text' : 'Desa bebas dari bencana banjir, tanah longsor, dan kebakaran hutan dalam waktu 1 tahun terakhir', 'score' : 5},
       {'text' : 'Desa pernah mengalami sekali bencana (banjir, tanah longsor dan/atau kebakaran hutan) dalam waktu 1 tahun terakhir', 'score' : 4},
       {'text' : 'Desa mengalami dua kali bencana (banjir, tanah longsor dan/atau kebakaran hutan) dalam waktu 1 tahun terakhir', 'score' : 3},
       {'text' : 'Desa mengalami lebih dari 2 kali bencana (banjir, tanah longsor dan/atau kebakaran hutan) dalam waktu 1 tahun terakhir', 'score' : 2},
       {'text' : 'Desa seringkali mengalami banjir, tanah longsor dan/atau kebakaran hutan dalam waktu 1 tahun terakhir', 'score' : 1},
       {'text' : 'Desa mengalami bencana banjir, tanah longsor dan/atau kebakaran hutan sepanjang tahun', 'score' : 0},
     ]
   },

    {
      'id' : 54,
      'pertanyaan' : 'Bagaimana Upaya/Tindakan terhadap potensi bencana alam (Tanggap bencana, jalur evakuasi, peringatan dini dan ketersediaan) di desa ini?',
      'jawaban' : [
        {'text' : 'Desa memiliki upaya yang sistematis terhadap potensi bencana (Mis : melakukan reboisasi, dll)', 'score' : 5},
        {'text' : 'Desa memiliki upaya yang sistematis terhadap potensi bencana dan membuat jalur evakuasi, serta peringatan dini terhadap bencana', 'score' : 4},
        {'text' : 'Desa belum memiliki upaya yang sistematis terhadap potensi bencana tetapi telah mempersiapkan jalur evakuasi, serta peringatan dini terhadap bencana', 'score' : 3},
        {'text' : 'Desa belum memiliki upaya yang sistematis terhadap potensi bencana tetapi telah mempersiapkan jalur evakuasi jika terjadi bencana', 'score' : 2},
        {'text' : 'Desa belum memiliki upaya yang sistematis terhadap potensi bencana belum mempersiapkan jalur evakuasi jika terjadi bencana', 'score' : 1},
        {'text' : 'tidak ada upaya apapun yang dilakukan Desa untuk meminimalisir potensi bencana dan upaya sistematis jika terjadi bencana', 'score' : 0},
      ]
    },

//    {
//      'pertanyaan' : '',
//      'jawaban' : [
//        {'text' : '', 'score' : 5},
//        {'text' : '', 'score' : 4},
//        {'text' : '', 'score' : 3},
//        {'text' : '', 'score' : 2},
//        {'text' : '', 'score' : 1},
//        {'text' : '', 'score' : 0},
//      ]
//    },



  ];

}


//class QNA {
//
//  var listQNA = [
//
//    {
//      'pertanyaan' : 'Pada tanggal berapakah indonesia merdeka ?',
//      'jawaban' : [
//        {'text' : '17 Agustus 1945', 'score' : 4},
//        {'text' : '18 Agustus 1974', 'score' : 3},
//        {'text' : '19 Agustus 1942', 'score' : 2},
//        {'text' : '28 Agustus 1974', 'score' : 1},
//      ]
//    },
//
//    {
//      'pertanyaan' : 'Siapakah presiden pertama Indonesia ?',
//      'jawaban' : [
//        {'text' : 'Uya kuya', 'score' : 3},
//        {'text' : 'Alun Paranggi W', 'score' : 2},
//        {'text' : 'Soekarno', 'score' : 4},
//        {'text' : 'Rio Ardi', 'score' : 1},
//      ]
//    },
//
//    {
//      'pertanyaan' : 'Sekarang kamu semseter berapa ?',
//      'jawaban' : [
//        {'text' : '11', 'score' : 3},
//        {'text' :  '1', 'score' : 2},
//        {'text' : '4', 'score' : 1},
//        {'text' : '7', 'score' : 4},
//      ]
//    },
//
//    {
//      'pertanyaan' : 'Tanggal jadian rio dan pis ?',
//      'jawaban' : [
//        {'text' : '17 Mei 2017', 'score' : 4},
//        {'text' : '18 Agustus 1974', 'score' : 3},
//        {'text' : '19 Agustus 1942', 'score' : 2},
//        {'text' : '28 Agustus 1974', 'score' : 1},
//      ]
//    },
//
//
//  ];
//
//}