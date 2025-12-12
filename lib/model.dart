import 'package:flutter/material.dart';

class Item {
  final String title;
  final String author;
  final String image;
  final String description;
  final double rating;
  final Color backgroundColor;
  final double price;

  Item({
    required this.title,
    required this.author,
    required this.image,
    required this.description,
    required this.rating,
    required this.backgroundColor,
    required this.price,
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
  ),
];
