

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `place_id` int(11) NOT NULL,
  `user_comment` text DEFAULT NULL,
  `user_rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `itinerary` (
  `id` int(11) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `numberofpeople` int(11) DEFAULT NULL,
  `added_at` datetime NOT NULL DEFAULT current_timestamp(),
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `places` (
  `id` int(11) NOT NULL,
  `image_url` text DEFAULT NULL,
  `place_name` text DEFAULT NULL,
  `city` text DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `category` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lon` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `users_image` (
  `id` int(11) NOT NULL,
  `uploadedBy` varchar(200) DEFAULT NULL,
  `image` varchar(300) NOT NULL,
  `createdAt` date DEFAULT NULL,
  `updatedAt` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `place_id` (`place_id`);

ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `places`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

ALTER TABLE `users_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploadedBy` (`uploadedBy`);

ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `itinerary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `places`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `users_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`);

ALTER TABLE `users_image`
  ADD CONSTRAINT `users_image_ibfk_1` FOREIGN KEY (`uploadedBy`) REFERENCES `users` (`username`);
COMMIT;





INSERT INTO `places` (`id`, `image_url`, `place_name`, `city`, `price`, `rating`, `category`, `description`, `lat`, `lon`) VALUES
(1, 'https://storage.googleapis.com/traveleasebucket/places/KotaTua.jpg', 'Kota Tua', 'Jakarta', 5000, 5, 'Budaya', 'Kota tua di Jakarta, yang juga bernama Kota Tua, berpusat di Alun-Alun Fatahillah, yaitu alun-alun yang ramai dengan pertunjukan rutin tarian tradisional. Museum Sejarah Jakarta adalah bangunan era Belanda dengan lukisan dan barang antik, sedangkan Museum Wayang memamerkan boneka kayu khas Jawa. Desa Glodok, atau Chinatown, terkenal dengan makanan kaki lima, seperti pangsit dan mi goreng. Di dekatnya, terdapat sekunar dan kapal penangkap ikan di pelabuhan Sunda Kelapa yang kuno.', -6.137644799999999, 106.8171245),
(2, 'https://storage.googleapis.com/traveleasebucket/places/MonumenNasional.jpg', 'Monumen Nasional', 'Jakarta', 20000, 5, 'Budaya', 'Monumen Nasional atau yang populer disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia untuk merebut kemerdekaan dari pemerintahan kolonial Hindia Belanda. Pembangunan monumen ini dimulai pada tanggal 17 Agustus 1961 di bawah perintah presiden Soekarno dan dibuka untuk umum pada tanggal 12 Juli 1975. Tugu ini dimahkotai lidah api yang dilapisi lembaran emas yang melambangkan semangat perjuangan yang menyala-nyala. Monumen Nasional terletak tepat di tengah Lapangan Medan Merdeka', -6.1753924, 106.8271528),
(3, 'https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit1440960gsm/events/2021/12/08/9c6ae660-1799-4276-b81d-f8b0b85669d6-1638949473006-1e6c55a1b1edca6bf250012af2cc79e2.jpg', 'Dunia Fantasi', 'Jakarta', 270000, 5, 'Taman Hiburan', 'Dunia Fantasi atau disebut juga Dufan adalah tempat hiburan yang terletak di kawasan Taman Impian Jaya Ancol, Jakarta Utara, Indonesia. Dufan diresmikan dan dibuka pada tanggal 29 Agustus 1985.', 6.125312399999999, 106.8335377),
(4, 'https://storage.googleapis.com/traveleasebucket/places/Museum%20Layang-layang.jpg', 'Museum Layang-layang', 'Jakarta', 10000, 5, 'Budaya', 'Museum Layang-Layang adalah sebuah museum yang terletak di Jl. H. Kamang No. 38, Pondok Labu, Jakarta Selatan. Museum ini merupakan museum layang-layang pertama di Indonesia. Jumlah koleksi layang-layang di museum ini berjumlah 600, tetapi jumlah tersebut terus bertambah seiring datangnya koleksi-koleksi baru dari para pelayang daerah dan luar negeri maupun layang-layang yang dibuat sendiri oleh karyawan museum. Museum Layang-Layang buka setiap hari mulai pukul 09.00-16.00 WIB. Hari libur nasional Museum Layang-layang tutup.', -6.3080282, 106.790548),
(5, 'https://storage.googleapis.com/traveleasebucket/places/MuseumFatahillah.jpg', 'Museum Fatahillah', 'Jakarta', 5000, 4, 'Budaya', 'Museum Fatahillah memiliki nama resmi Museum Sejarah Jakarta adalah sebuah museum yang terletak di Jalan Taman Fatahillah No. 1, Jakarta Barat dengan luas lebih dari 1.300 meter persegi.\\\\nBangunan ini dahulu merupakan balai kota Batavia (bahasa Belanda: Stadhuis van Batavia) yang dibangun pada tahun 1707-1710 atas perintah Gubernur-Jendral Joan van Hoorn. Bangunan ini menyerupai Istana Dam di Amsterdam, terdiri atas bangunan utama dengan dua sayap di bagian timur dan barat serta bangunan sanding yang digunakan sebagai kantor, ruang pengadilan, dan ruang-ruang bawah tanah yang dipakai sebagai penjara. Pada tanggal 30 Maret 1974, bangunan ini kemudian diresmikan oleh bapak Ali Sadikin sebagai Museum Sejarah Jakarta.', -6.136448899999999, 106.8130661),
(6, 'https://storage.googleapis.com/traveleasebucket/places/JembatanKotaIntan.jpg', 'Jembatan Kota Intan', 'Jakarta', 0, 4, 'Budaya\r\n', 'Jembatan Kota Intan adalah jembatan tertua di Indonesia yang dibangun pada tahun 1628 oleh pemerintah Vereenigde Oostindische Compagnie atau VOC, atau masyarakat kita lebih familiar dengan sebutan Kumpeni. Jembatan itu kini terletak di Kali Besar kawasan Kota Tua wilayah Jakarta Barat dan berada di bawah pengelolaan Dinas Pariwisata dan Kebudayaan Provinsi DKI Jakarta.', -6.1314572, 106.8106169),
(7, 'https://storage.googleapis.com/traveleasebucket/places/MuseumSonobudoyoUnitI.jpg', 'Museum Sonobudoyo Unit I', 'Yogyakarta', 5000, 5, 'Budaya', 'Museum Sonobudoyo adalah museum dan perpustakaan sejarah dan budaya Jawa di Yogyakarta, Indonesia. Museum ini berisi koleksi artefak Jawa terlengkap, setelah Museum Nasional di Jakarta. Selain keramik era Neolitikum dan patung perunggu abad ke-8, museum ini juga menyimpan koleksi wayang, berbagai senjata kuno (seperti keris), dan topeng Jawa. Museum Sonobudoyo terdiri dari dua unit, Unit I terletak di Jalan Trikora No. 6 Yogyakarta, dan Unit II terletak di Ndalem Condrokiranan, Wijilan, di sebelah timur alun-alun utama (utara) kota.', -7.8024499, 110.3639555),
(8, 'https://storage.googleapis.com/traveleasebucket/places/TamanPintarYogyakarta.jpg', 'Taman Pintar Yogyakarta', 'Yogyakarta', 6000, 4, 'Hiburan', 'Taman Pintar Yogyakarta (bahasa Jawa: Hanacaraka,ꦠꦩꦤ꧀​ꦥꦶꦤ꧀ꦠꦂ​ꦔꦪꦺꦴꦒꦾꦏꦂꦠ, Taman Pintar Ngayogyakarta) adalah wahana wisata yang terdapat di pusat Kota Yogyakarta, tepatnya di Jalan Panembahan Senopati No. 1-3, Yogyakarta, di kawasan Benteng Vredeburg. Taman ini memadukan tempat wisata rekreasi maupun edukasi dalam satu lokasi. Taman Pintar memiliki arena bermain sekaligus sarana edukasi yang terbagi dalam beberapa zona. Akses langsung kepada pusat buku eks Shopping Centre juga menambah nilai lebih Taman Pintar. Tempat rekreasi ini sangat baik untuk anak-anak pada masa perkembangan.\\\\nBeberapa tahun ini Taman Pintar menjadi alternatif tempat berwisata bagi masyarakat Yogyakarta maupun luar kota.Taman ini, khususnya pada wahana pendidikan anak usia dini dilengkapi dengan teknologi interaktif digital serta pemetaan video yang akan memacu imajinasi anak serta ketertarikan mereka terhadap teknologi. Pada saat ini ada 35 zona dan 3.500 alat peraga permainan yang edukatif.\"', -7.800671500000001, 110.3676551),
(9, 'https://storage.googleapis.com/traveleasebucket/places/GrojoganWatuPurboBangunrejo.jpg', 'Grojogan Watu Purbo Bangunrejo', 'Yogyakarta', 10000, 4, 'Hiburan', 'Objek wisata itu tak adalah Grojogan Watu Purbo yang berada di Bangunrejo, Merdikorejo, Kecamatan Tempel. Objek wisata itu sekitar setahun terakhir cukup populer di kalangan wisatawan karena memiliki pemandangan eksotis berupa air terjun yang memiliki enam tingkatan. Wisatawan yang datang rata-rata menjadikan air terjun itu sebagai latar untuk swafoto karena pemandangannya yang dinilai instagramable. Grojokan Watu Purbo ini tepatnya berlokasi di aliran Kali Krisak, yang merupakan jalur dari lahar dingin yang mengalir dari Gunung Merapi. Pemandangan kawasan ini eksotis karena dikepung pepohonan asri serta hamparan sawah. Munculnya air terjun atau grojogan ini berasal dari enam dam dengan ketinggian bervariasi tak lebih dari 10 meter.', -7.6340172, 110.33837),
(10, 'https://storage.googleapis.com/traveleasebucket/places/DesaWisataKelor.jpg', 'Desa Wisata Kelor', 'Yogyakarta', 0, 4, 'Hiburan', 'Desa wisata Kelor merupakan salah satu desa yang ada di kabupaten Sleman yang saat ini sedang dikembangkan menjadi desa wisata. Desa wisata Kelor ini menawarkan suasana pedesaan yang penduduknya bermata pencaharian sebagai petani, peternak, dan budidaya jamur. Banyak tanaman hijau yang membentang luas dengan pemandangan alam yang asri. Desa wisata Kelor ini memiliki masyarakat yang ramah dan memiliki lingkungan desa yang sangat nyaman. Desa Kelor ini juga memiliki sungai, dan air di sungai tersebut masih jernih dan indah.', 7.641025800000001, 110.3622794),
(11, 'https://storage.googleapis.com/traveleasebucket/places/JalanBraga.jpg', 'Jalan Braga', 'Bandung', 0, 5, 'Budaya', 'Jalan Braga adalah nama sebuah jalan utama di kota Bandung, Indonesia. Nama jalan ini cukup dikenal sejak masa pemerintahan Hindia Belanda. Sampai saat ini nama jalan tersebut tetap dipertahankan sebagai salah satu maskot dan objek wisata kota Bandung yang dahulu dikenal sebagai Parijs van Java.', -6.9150534, 107.6089842),
(12, 'https://storage.googleapis.com/traveleasebucket/places/KebunTanamanObatSariAlam.jpg', 'Kebun Tanaman Obat Sari Alam', 'Bandung', 0, 5, 'Wisata', 'Kebun Tanaman Obat Sari Alam lebih terkenal dengan sebutan wisata pengobatan herbal, karena disana terdapat banyak sekali tanaman yang dijadikan sebagai pengobatan alternative. Kebun Tanaman Obat Sari Alam lebih dikenal oleh orang Bandung dengan sebutan KTO Sari Alam. Lokasi: Jl. Raya Ciwidey bandung km 26 no 8 rt 1 rw 2 kampung Andir, Cukanggenteng, Kec. Pasirjambu, kab Bandung, Jawa Barat 40972\",\r\n        \"Category\": \"Wisata', -6.601320999999999, 106.632734),
(13, 'https://storage.googleapis.com/traveleasebucket/places/GunungTangkubanperahu.jpg', 'GunungTangkuban perahu', 'Bandung', 30000, 4, 'Wisata', 'Gunung Tangkuban Parahu adalah salah satu gunung yang terletak di Provinsi Jawa Barat, Indonesia. Sekitar 20 km ke arah utara Kota Bandung, dengan rimbun pohon pinus dan hamparan kebun teh di sekitarnya, Gunung Tangkuban Parahu mempunyai ketinggian setinggi 2.084 meter. Bentuk gunung ini adalah Stratovulcano dengan pusat erupsi yang berpindah dari timur ke barat. Jenis batuan yang dikeluarkan melalui letusan kebanyakan adalah lava dan sulfur, mineral yang dikeluarkan adalah sulfur belerang, mineral yang dikeluarkan saat gunung tidak aktif adalah uap belerang. Daerah Gunung Tangkuban Parahu dikelola oleh Perum Perhutanan. Suhu rata-rata hariannya adalah 17oC pada siang hari dan 2 °C pada malam hari.', -6.759637700000001, 107.6097807),
(14, 'https://storage.googleapis.com/traveleasebucket/places/BalaiKotaSurabaya.jpg', 'Balai Kota Surabaya', 'Surabaya', 0, 5, 'Budaya', 'Surabaya sebagai Resort Gemeente (Haminte) secara resmi mulai berdiri pada tanggal 1 April 1906. Sebelumnya Surabaya merupakan bagian dari karesidenan Pemerintah Haminte dijalankan oleh Dewan Haminte yang diketuai oleh asisten residen sebagai Kepala Daerah.\\\\nTahun 1916 diangkat Wali kota Surabaya pertama, A. Meyroos yang bertugas sampai tahun 1921. Baru setelah wali kota yang kedua, G.J. DIJKERMAN, terpilih, rencana membangun gedung Balai Kota diwujudkan.\\\\nGedung utama Balai Kota di Taman Surya di daerah Ketabang itu mulai dibangun pada tahun 1923 dan mulai ditempati pada tahun 1927. Arsiteknya ialah C. Citroen dan pelaksanaannya H.V. Hollandsche Beton Mij. Biaya seluruhnya, termasuk perlengkapan dan lain-lainnya, menghabiskan dana sekitar 1000 gulden.\\\\n\\\\nUkuran gedung utama: panjang 102 m dan lebar 19 m. Konstruksinya terdiri dari tiang-tiang pancang beton bertulang yang ditanam, sedangkan dinding-dindingnya diisi dengan bata dan semen. Atapnya terbuat dari rangka besi dan ditutup dengan sirap, Belakangan atap ini kemudian diganti dengan genteng.\\\\nSetelah Republik Indonesia diproklamirkan, dilantiklah Radjamin Nasution sebagai Wali kota Kota Besar Surabaya. Berdasarkan Penpres 1959 No. 16 maka ditetapkan Wali kota menjadi Kepala Daerah Kota Surabaya. Tahun 1965 Kotapraja Surabaya resmi menjadi Kotamadya.', -7.2592948, 112.7470512),
(15, 'https://storage.googleapis.com/traveleasebucket/places/HappyfarmCiwidey.jpg', 'Happyfarm Ciwidey', 'Bandung', 15000, 4, 'Wisata', 'Objek wisata alam dan edukasi tengah banyak menjamur akhir-akhir ini. Selain De Ranch dan Farmhouse Lembang, ada juga Happy Farm Ciwidey di Bandung. Objek wisata ini masih terbilang baru, karena baru bulan Juni 2019 ini berdiri. Konsepnya hampir sama, wisata alam dan peternakan dengan unsur edukasi. Sangat cocok menjadi tujuan wisata keluarga, terutama untuk anak-anak. Dan semakin seru karena bermain di area outdoor dengan udara sejuk.', -7.1147877, 107.4380865),
(16, 'https://storage.googleapis.com/traveleasebucket/places/seaworld.jpg', 'Sea World', 'Jakarta', 115000, 5, 'Taman Hiburan', 'Seaworld Indonesia adalah sebuah miniatur pesona laut yang terdapat dalam kompleks wisata pertama di Taman Impian Jaya Ancol.\\nPada tanggal 2 Oktober 1992, Gubernur DKI masa itu, Wiyogo Atmodarminto meletakkan batu pertama pembangunan Seaworld Indonesia. Tidak sampai dua tahun, pada tanggal 3 Juni 1994 SeaWorld Indonesia sudah mulai beroperasi. Area Seaworld seluas 3 hektare dengan luas bangunan utama 4.500 m2 berisi berbagai macam akuarium, lorong Antasena (lorong bawah air), perpustakaan, museum, terapi ikan dokter, glow theatre, komputer edukatif layar sentuh berisi informasi berbagai spesies di Seaworld dan bermacam fasilitas pelengkap untuk pengunjung seperti tempat makan, toko suvenir, dan ruang serba guna.', -6.126477500000001, 106.842963),
(17, 'https://storage.googleapis.com/traveleasebucket/places/Museum-Keramik.jpg', 'Museum Seni Rupa dan Kramik', 'Jakarta', 5000, 4, 'Budaya', 'Museum Seni Rupa dan Keramik (Indonesia: Museum Seni Rupa dan Keramik) adalah sebuah museum di Jakarta, Indonesia. Museum ini didedikasikan khusus untuk menampilkan seni rupa tradisional dan keramik Indonesia. Museum ini terletak di sisi timur Lapangan Fatahillah, dekat Museum Sejarah Jakarta dan Museum Wayang.', -6.1342598, 106.814552),
(18, 'https://storage.googleapis.com/traveleasebucket/places/JakartaAquariumdanSafari.jpg', 'Jakarta Aquarium dan Safari', 'Jakarta', 185000, 5, 'Taman Hiburan', 'Jika telah mengunjungi Seaworld Ancol, mungkin sudah tidak asing lagi dengan serunya menyaksikan biota laut. Jika belum puas, pengunjung dapat mencoba mengunjungi wisata satwa laut unik di Jakarta Aquarium. Jakarta Aquarium menempati areal seluas ±7000 m2 ini menawarkan atraksi wisata laut modern yang tidak hanya menghibur, juga edukatif. Meskipun tidak seluas SeaWorld Ancol, taman rekreasi ini juga menawarkan wahana dan atraksi yang tak kalah menariknya.', -6.1752647, 106.7904684),
(19, 'https://storage.googleapis.com/traveleasebucket/places/kampungpelangi.jpg', 'Kampung Pelangi', 'Semarang', 3000, 4, 'Taman Hiburan', 'Kampung pelangi atau dalam bahasa Inggris disebut Rainbow Village merupakan sebutan untuk daerah atau kampung yang rumah-rumah penduduknya dicat dengan warna-warni. Sebenarnya Kampung Pelangi pada awalnya merupakan daerah kumuh yang dikemudian secara kreatif diubah menjadi daerah yang menarik untuk dijadikan sebagai destinasi wisata, terutama bagi masyarakat yang senang atau sedang mencari spot yang menarik untuk mengabadikan momen.\\nBanyak daerah-daerah di Indonesia, terutama di jawa memliki tempat yang disebut Kampung pelangi, antara lain di Malang, Semarang, Jakarta, Bandung, dan kota-kota lainnya. Contoh kampung seperti ini yaitu, kampung warna-warni di Jodipan dan Tridi, Kota Malang, Jawa Timur.', -6.988881200000001, 110.4083781),
(20, 'https://storage.googleapis.com/traveleasebucket/places/LawangSewu.jpg', 'Lawang Sewu', 'Semarang', 10000, 5, 'Budaya', 'Lawang Sewu (\"\"Seribu Pintu\"\") (bahasa Jawa: ꦭꦮꦁ​ꦱꦺꦮꦸ, translit. Lawang Sèwu) adalah landmark di Semarang, Jawa Tengah, Indonesia, yang dibangun sebagai kantor pusat Perusahaan Kereta Api Hindia Belanda. Bangunan era kolonial terkenal sebagai rumah berhantu dan lokasi syuting, meskipun pemerintah kota Semarang telah berusaha mengubah citra itu.', -6.9839099, 110.4104342),
(21, 'https://storage.googleapis.com/traveleasebucket/places/PantaiBaruna.jpg', 'Pantai Baruna', 'Semarang', 3000, 4, 'Bahari', 'kunjungi Pantai Baruna yang berada di Kota Semarang, Jawa Tengah! Pantai yang satu ini akan memberikan pengalaman wisata yang berbeda. Pasalnya, di sini tidak ada hamparan pasir. Memang Pantai Baruna merupakan objek wisata ‘tidak resmi’ milik Kota Semarang. Pantai ini berada di belakang kawasan pabrik semen. Sehingga tidak ada kepadatan wisatawan atau tempat berselancar di sini. Yang ada hanyalah hamparan padang rumput dan ilalang di hadapan Laut Jawa yang tenang.', -6.945105199999999, 110.3982398),
(22, 'https://storage.googleapis.com/traveleasebucket/places/GerejaPerawanMariaTakBerdosaSurabaya.jpg', 'Gereja Perawan Maria Tak Berdosa Surabaya', 'Surabaya', 10000, 5, 'Tempat Ibadah', 'Gereja Katolik Kelahiran Santa Perawan Maria merupakan salah satu gereja tua di kota Surabaya, Jawa Timur, Indonesia. Berlokasi di Jalan Kepanjen, Surabaya, bangunan religius ini berdampingan dengan gedung SMA Katolik Frateran Surabaya.', -7.2420758, 112.7368158),
(23, 'https://storage.googleapis.com/traveleasebucket/places/AtlantisLandSurabaya.jpg', 'Atlantis Land Surabaya', 'Surabaya', 125000, 4, 'Taman Hiburan', 'Sejak diresmikan pada bulan Desember 2017, Atlantis Land Kenjeran Surabaya sudah sukses mendatangkan banyak pengunjung. Taman wisata air ini menjadi taman air terbesar di Kota Surabaya. Lokasinya terletak satu wilayah dengan Kenjeran Park, atau familiar disebut Ken Park. Tepatnya di Jalan Pantai Ria Kenjeran, Sukolilo Baru, Bulak, Surabaya, Jawa Timur. Taman wisata air ini memiliki luas sekitar 15 hektar dengan desain asli milik arsitek Australia. Tema yang diambil untuk taman wisata air ini adalah istana bawah laut. Dengan tema tersebut, gerbang masuk Atlantis Land Kenjeran Surabaya memiliki dinding bangunan utama berwarna biru. Dinding utama tersebut dihiasi dengan garis-garis menyerupai ombak berwarna putih. Atapnya berwarna kuning kecokelatan dan menjulang tinggi bagai istana. Di kedua sisi bangunan utama, terdapat bangunan berdinding cokelat dengan ornamen belahan kayu. Bangunan ini memberi kesan bagaikan kapal pesiar yang belum rampung dibuat. Sebuah patung neptunus berwarna kuning juga terlihat menghiasi salah satu sudut tembok taman ini. Dekorasi yang ada di Atlantis Land Kenjeran akan memberi suasana bagaikan berada di sebuah kastil.', -7.2516189, 112.8009694),
(24, 'https://storage.googleapis.com/traveleasebucket/places/museumkesehatan.jpg', 'Museum Kesehatan Dr. Adhyatma', 'Surabaya', 10000, 4, 'Budaya', 'Museum Kesehatan Dr. Adhyatma, MPH adalah museum kesehatan yang dirintis Pemerintah indonesia melalui Departemen Kesehatan pada tanggal 16 Desember 2003. Museum Kesehatan Puslitbang Pelayanan dan Tehnologi kesehatan (PUSLITBANG YANTEKKES) diresmikan oleh Menteri Kesehatan pada tanggal 14 September 2004, sehingga diberi nama Museum Kesehatan Dr. Adhyatma, MPH.Museum Kesehatan Dr. Adhyatma, MPH, berlokasi di Jl. Indrapura 17 Surabaya Jawa Timur.', -7.240327999999999, 112.731431),
(25, 'https://storage.googleapis.com/traveleasebucket/places/duriangarden.jpg', 'Durian Gardens and Tourism Education Watu Simbar', 'Semarang', 5000, 4, 'Cagar Alam', 'Perlu diketahui, watu simbar ini merupakan lokasi wisata yang menawarkan edukasi dari berbagai macam pohon durian. Walaupun terkesan biasa saja, hal tersebut lah yang sebenarnya menjadi keunikan tempat ini. Apabila seseorang datang kemari, orang tersebut akan bisa mempelajari banyak hal tentang pohon durian. Selain bisa mempelejari berbagai macam hal tentang pohon durian tersebut, tentu lah para pengunjung pun bisa membeli durian yang berada disana.', -7.096707899999999, 110.3900517),
(26, 'https://storage.googleapis.com/traveleasebucket/places/KampoengKopiBanaran.jpg', 'Kampoeng Kopi Banaran', 'Semarang', 200000, 4, 'Taman Hiburan', 'Kampoeng Kopi Banaran, sebuah agro wisata perkebunan kopi di Kabupaten Semarang. Tempat wisata ini memiliki luas 462 hektar yang sebagian dijadikan resort dan tempat wisata. Lokasinya berada di Areal Perkebunan Kopi Kebun Getas Afdeling Assinan tepatnya Jl. Raya Semarang – Solo Km. 35. Lokasi Kampoeng Kopi Banaran yang berada di ketinggian 480 – 600m dpl membuat suhu udara disana sejuk antara 23ºC – 27ºC. Jadi cocok banget buat pelesir mencari udara dingin dan segar dengan pemandangan indah. Menghilangkan penat kesibukan Kota besar, di tengah perkebunan yang asri.', -7.253900499999999, 110.4414953),
(27, 'https://storage.googleapis.com/traveleasebucket/places/TamanMiniaturKeretaApi.jpg', 'Taman Miniatur Kereta Api', 'Bandung', 15000, 4, 'Taman Hiburan', 'Salah satu wisata yang ramai di Bandung adalah Taman Miniatur Kereta Api yang berada di taman wisata Floating Market Lembang. Dengan menghadirkan pernak-pernik kereta api secara lengkap dan sangat detail membuat taman miniatur kereta api ini seolah-olah benar hidup. Tak heran jika objek wisata ini mengundang ribuan orang untuk menikmati sekaligus belajar banyak tentang perkeretaan api baik di Indonesia maupun dunia. Taman miniatur ini menyediakan toko suvenir yang menjual beragam jenis miniatur kendaraan mulai dari mobil, pesawat dan kereta api tentunya. Selain itu, bagi pengunjung yang ingin menikmati sajian aneka ragam kuliner bisa langsung ke Floating Market Lembang. Bagi pengunjung yang berasal dari luar kota dapat menginap di hotel-hotel yang berdekatan dengan lokasi taman miniatur. Jarak hotel dari taman miniatur sekitar 200 meter sampai 1 kilometer. Hotel-hotel tersebut antara lain Grand Hotel Lembang, Hotel Cemara Asri, Hotel Buah Sinuan dan Hotel Pesona Bamboe. Tarif sewa hotel menginap semalam antara Rp 200.000 hingga Rp 1.000.000.', -6.817327, 107.61794),
(28, 'https://storage.googleapis.com/traveleasebucket/places/bandung-indah-waterpark.jpg', 'Water Park Bandung Indah', 'Bandung', 50000, 4, 'Taman Hiburan', 'Bandung Indah Waterpark merupakan salah satu kolam renang yang ada di Bandung. Menyediakan berbagai wahana permainan air yang cocok bagi keluarga. Terdapat kolam renang untuk dewasa dan anak-anak. Pengunjung dapat melakukan olahraga renang dan rekreasi.', -6.980580700000001, 107.5856567),
(29, 'https://storage.googleapis.com/traveleasebucket/places/masjidsalmanITB.jpg', 'Masjid Salman ITB', 'Bandung', 0, 5, 'Tempat Ibadah', 'Masjid Salman ITB adalah masjid kampus yang terletak di Jalan Ganesha 7, Lebak Siliwangi, Coblong, Kota Bandung atau tepat di depan area Kampus ITB Ganesha. Dengan luas lahan 7800 m2 dan luas bangunan masjid 1225 m2, Masjid Salman dilengkapi dengan berbagai fasilitas penunjang seperti kantin, air minum gratis, mini market, dan ruang serbaguna. Masjid yang dibuka pada tahun 1972 ini merupakan masjid kampus pertama di Indonesia.', -6.893664299999999, 107.611271),
(30, 'https://storage.googleapis.com/traveleasebucket/places/taman-sejarah-bandung.jpg', 'Taman Sejarah Bandung', 'Bandung', 0, 4, 'Budaya', 'Taman Sejarah Bandung adalah taman yang terletak di belakang Balai Kota Bandung, kompleks Pemerintahan Kota Bandung. Taman ini berfungsi untuk mengenalkan sejarah di Kota Bandung. Taman ini dilengkapi informasi mengenai pemimpin kota Bandung dari masa ke masa. Pembangunan taman ini menghabiskan anggaran sekitar 3,5 miliar rupiah.', -6.9103086, 107.6098619);


INSERT INTO `itinerary` (`id`, `start_date`, `end_date`, `city`, `category`, `numberofpeople`, `added_at`, `createdAt`, `updatedAt`) VALUES
(1, '2024-06-20', '2024-06-23', 'Bandung', 'Budaya', 2, '2024-06-19 02:14:26', '2024-06-18 21:13:54', '2024-06-18 21:13:54'),
(2, '2024-06-23', '2024-06-26', 'Jakarta', 'Taman Hiburan', 2, '2024-06-19 02:15:31', '2024-06-18 21:14:39', '2024-06-18 21:14:39');


INSERT INTO `users` (`id`, `username`, `email`, `password`, `age`, `location`, `refresh_token`, `createdAt`, `updatedAt`) VALUES
(1, 'John Doe', 'johndoe@gmail.com', 'password', 21, 'Jakarta', NULL, '2024-06-18 21:18:02', '2024-06-18 21:18:02'),
(2, 'fara', 'faraadevianaa@gmail.com', 'fara2800', 21, 'Bandung', NULL, '2024-06-18 21:16:50', '2024-06-18 21:16:50');