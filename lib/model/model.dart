import 'package:flutter/material.dart';

class Item {
  final String title;
  final String author;
  final String image;
  final String description;
  final double rating;
  final Color backgroundColor;
  final double price;
  final bool isPopular;

  Item({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.rating,
    required this.backgroundColor,
    required this.price,
    required this.isPopular,
  });
}

final List<Item> itemList = [
  Item(
    title: "Atomic Habits",
    author: "James Clear",
    image: "https://m.media-amazon.com/images/I/91bYsX41DVL._SL1500_.jpg",
    description:
        "Atomic Habits adalah buku yang mengungkap cara membangun kebiasaan baik dan menghentikan kebiasaan buruk melalui perubahan kecil yang mudah dilakukan setiap hari. "
        "James Clear menjelaskan bagaimana kebiasaan dibentuk oleh sistem, bukan oleh tujuan semata. "
        "Dengan strategi ilmiah dan contoh nyata, buku ini membantu pembaca menciptakan perubahan besar melalui langkah-langkah kecil yang konsisten.",
    rating: 5,
    backgroundColor: Color(0xFFFFF3E0),
    price: 29.00,
    isPopular: true,
  ),

  Item(
    title: "The Subtle Art of Not Giving a F*ck",
    author: "Mark Manson",
    image: "https://m.media-amazon.com/images/I/71QKQ9mwV7L.jpg",
    description:
        "Buku ini mengajarkan bahwa hidup tidak harus sempurna, dan kita harus memilih hal-hal penting yang benar-benar layak diperjuangkan. "
        "Mark Manson memadukan humor gelap dan filosofi kehidupan untuk membantu pembaca menerima kekurangan, kegagalan, dan kenyataan bahwa kita tidak bisa mengontrol segalanya. "
        "Buku ini cocok bagi mereka yang ingin hidup lebih ringan dan realistis.",
    rating: 3,
    backgroundColor: Color(0xFFFFE8E0),
    price: 2.00,
    isPopular: true,
  ),

  Item(
    title: "Rich Dad Poor Dad",
    author: "Robert Kiyosaki",
    image: "https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg",
    description:
        "Rich Dad Poor Dad membandingkan dua pola pikir tentang uang: ayah kaya dan ayah miskin. "
        "Robert Kiyosaki membongkar cara kerja uang, investasi, dan bagaimana membangun aset untuk mencapai kebebasan finansial. "
        "Buku ini telah menginspirasi jutaan orang di seluruh dunia untuk memulai perjalanan finansial yang lebih cerdas dan terarah.",
    rating: 4.7,
    backgroundColor: Color(0xFFEDE7F6),
    price: 25.00,
    isPopular: true,
  ),

  Item(
    title: "Ikigai",
    author: "Héctor García & Francesc Miralles",
    image: "https://m.media-amazon.com/images/I/71tbalAHYCL.jpg",
    description:
        "Ikigai adalah konsep Jepang tentang tujuan hidup yang memberi kita alasan untuk bangun setiap hari. "
        "Buku ini membahas rahasia umur panjang masyarakat Okinawa, kebiasaan harian mereka, pola makan, aktivitas mental, serta filosofi hidup yang seimbang. "
        "Ikigai mengajak pembaca untuk menemukan makna dan kebahagiaan melalui kesederhanaan dan konsistensi.",
    rating: 4.6,
    backgroundColor: Color(0xFFE0F7FA),
    price: 21.00,
    isPopular: false,
  ),

  Item(
    title: "Good Trouble",
    author: "Joseph O’Neill",
    image: "https://m.media-amazon.com/images/I/61KDuk8i4tL._SY466_.jpg",
    description:
        "Good Trouble adalah kumpulan cerita pendek yang menggambarkan kehidupan modern dengan humor halus dan ironi yang dalam. "
        "Joseph O’Neill menghadirkan karakter-karakter unik yang mengalami dilema moral, konflik pribadi, dan kesalahpahaman absurd. "
        "Sebuah buku yang cerdas, menyentuh, dan terkadang satir.",
    rating: 4.2,
    backgroundColor: Color(0xFFFFF2CC),
    price: 12.00,
    isPopular: false,
  ),

  Item(
    title: "All The Light We Cannot See",
    author: "Anthony Doerr",
    image:
        "https://m.media-amazon.com/images/I/41KCAcqX5lL._SY445_SX342_QL70_ML2_.jpg",
    description:
        "Novel pemenang Pulitzer ini mengikuti perjalanan dua anak muda—Marie-Laure, gadis buta dari Prancis, dan Werner, anak yatim yang jenius dari Jerman—"
        "yang hidupnya tak terduga saling bersinggungan di tengah kekacauan Perang Dunia II. "
        "Dengan bahasa yang puitis dan detail visual yang indah, Anthony Doerr menciptakan kisah penuh emosi, kehilangan, harapan, dan cahaya dalam kegelapan.",
    rating: 4.8,
    backgroundColor: Color(0xFFE3F2FD),
    price: 2.30,
    isPopular: false,
  ),
    Item(
    title: "Deep Work",
    author: "Cal Newport",
    image: "https://m.media-amazon.com/images/I/71sH3vxziLL.jpg",
    description:
        "Deep Work membahas kemampuan untuk fokus secara mendalam di dunia yang penuh distraksi. "
        "Cal Newport menjelaskan bahwa kemampuan berkonsentrasi tanpa gangguan adalah keterampilan langka namun sangat berharga. "
        "Buku ini memberikan strategi praktis untuk meningkatkan produktivitas dan kualitas kerja.",
    rating: 4.7,
    backgroundColor: Color(0xFFE8F5E9),
    price: 24.00,
    isPopular: true,
  ),

  Item(
    title: "Think and Grow Rich",
    author: "Napoleon Hill",
    image: "https://m.media-amazon.com/images/I/71UypkUjStL.jpg",
    description:
        "Think and Grow Rich adalah buku klasik pengembangan diri yang membahas mindset kesuksesan. "
        "Napoleon Hill menekankan pentingnya keyakinan, tujuan yang jelas, dan ketekunan. "
        "Buku ini telah menjadi fondasi bagi banyak pengusaha dan pemimpin dunia.",
    rating: 4.6,
    backgroundColor: Color(0xFFFFFDE7),
    price: 20.00,
    isPopular: true,
  ),

  Item(
    title: "Start With Why",
    author: "Simon Sinek",
    image: "https://m.media-amazon.com/images/I/71K9CbNZPsL.jpg",
    description:
        "Simon Sinek menjelaskan bahwa pemimpin dan organisasi hebat selalu memulai dengan 'mengapa'. "
        "Buku ini mengajarkan cara menemukan tujuan utama yang mampu menginspirasi orang lain. "
        "Sangat cocok untuk pemimpin, entrepreneur, dan tim kreatif.",
    rating: 4.5,
    backgroundColor: Color(0xFFE3F2FD),
    price: 22.00,
    isPopular: true,
  ),

  Item(
    title: "The Psychology of Money",
    author: "Morgan Housel",
    image: "https://m.media-amazon.com/images/I/71g2ednj0JL.jpg",
    description:
        "Buku ini membahas hubungan antara perilaku manusia dan uang. "
        "Morgan Housel menunjukkan bahwa keputusan finansial seringkali dipengaruhi emosi, bukan logika. "
        "Ditulis dengan bahasa ringan dan contoh nyata yang mudah dipahami.",
    rating: 4.8,
    backgroundColor: Color(0xFFF1F8E9),
    price: 26.00,
    isPopular: true,
  ),

  Item(
    title: "Can't Hurt Me",
    author: "David Goggins",
    image: "https://m.media-amazon.com/images/I/81gTRv2HXrL.jpg",
    description:
        "David Goggins membagikan kisah hidupnya yang penuh penderitaan dan disiplin ekstrem. "
        "Buku ini menantang pembaca untuk keluar dari zona nyaman dan melampaui batas mental. "
        "Inspiratif dan penuh motivasi keras.",
    rating: 4.9,
    backgroundColor: Color(0xFFFFEBEE),
    price: 27.00,
    isPopular: true,
  ),

  Item(
    title: "Man's Search for Meaning",
    author: "Viktor E. Frankl",
    image: "https://m.media-amazon.com/images/I/71t6n2wq9JL.jpg",
    description:
        "Buku ini menceritakan pengalaman Viktor Frankl di kamp konsentrasi Nazi. "
        "Ia menjelaskan bahwa manusia dapat bertahan dalam penderitaan jika memiliki makna hidup. "
        "Sebuah karya klasik yang mendalam dan menyentuh.",
    rating: 4.8,
    backgroundColor: Color(0xFFE0F2F1),
    price: 18.00,
    isPopular: false,
  ),

  Item(
    title: "The Alchemist",
    author: "Paulo Coelho",
    image: "https://m.media-amazon.com/images/I/71aFt4+OTOL.jpg",
    description:
        "The Alchemist mengikuti perjalanan Santiago dalam mencari harta karun dan jati diri. "
        "Paulo Coelho menyampaikan pesan tentang mimpi, takdir, dan keberanian mengikuti kata hati. "
        "Novel filosofis yang sederhana namun bermakna.",
    rating: 4.7,
    backgroundColor: Color(0xFFFFF3E0),
    price: 19.00,
    isPopular: true,
  ),

  Item(
    title: "Sapiens",
    author: "Yuval Noah Harari",
    image: "https://m.media-amazon.com/images/I/713jIoMO3UL.jpg",
    description:
        "Sapiens mengulas sejarah umat manusia dari zaman purba hingga modern. "
        "Yuval Noah Harari menggabungkan sejarah, sains, dan filsafat dengan sudut pandang unik. "
        "Buku ini mengajak pembaca memahami siapa kita dan ke mana arah peradaban.",
    rating: 4.6,
    backgroundColor: Color(0xFFE8EAF6),
    price: 30.00,
    isPopular: true,
  ),

  Item(
    title: "Educated",
    author: "Tara Westover",
    image: "https://m.media-amazon.com/images/I/81WojUxbbFL.jpg",
    description:
        "Educated adalah memoar tentang perjuangan mendapatkan pendidikan di tengah keluarga yang menolak sistem formal. "
        "Tara Westover menceritakan perjalanan luar biasa dari isolasi menuju dunia akademik. "
        "Kisah yang kuat, emosional, dan inspiratif.",
    rating: 4.7,
    backgroundColor: Color(0xFFFCE4EC),
    price: 23.00,
    isPopular: false,
  ),

  Item(
    title: "Atomic Love",
    author: "Dr. Lisa Harper",
    image: "https://m.media-amazon.com/images/I/61kRZpVZ0-L.jpg",
    description:
        "Atomic Love membahas hubungan manusia dari sudut pandang psikologi modern. "
        "Buku ini mengajarkan bagaimana membangun hubungan sehat melalui komunikasi dan empati. "
        "Cocok bagi pembaca yang ingin memahami dinamika cinta dan relasi.",
    rating: 4.3,
    backgroundColor: Color(0xFFFFF1F8),
    price: 17.00,
    isPopular: false,
  ),
];
