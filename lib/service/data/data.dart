import 'package:shopping_app/models/basket_model.dart';
import 'package:shopping_app/models/product_model.dart';

import '../../models/review_model.dart';

sealed class Data {

  static final List<Product> products = [
    Product(
      imageUrl: "assets/images/orange_chair.png",
      price: 879.00,
      name: "Orange Chair",
      type: "Furniture",
      rate: 4,
    ),
    Product(
      imageUrl: "assets/images/bike.png",
      price: 2800.00,
      name: "Bicycle",
      type: "Furniture",
      rate: 5,
    ),
    Product(
      imageUrl: "assets/images/freezer.png",
      price: 799.00,
      name: "Freezer",
      type: "Furniture",
      rate: 3,
    ),
    Product(
      imageUrl: "assets/images/sofa.png",
      price: 1200.00,
      name: "Modern Sofa",
      type: "Furniture",
      rate: 5,
    ),
    Product(
      imageUrl: "assets/images/table.png",
      price: 450.00,
      name: "Dining Table",
      type: "Furniture",
      rate: 4,
    ),
    Product(
      imageUrl: "assets/images/bed.png",
      price: 999.00,
      name: "King Size Bed",
      type: "Furniture",
      rate: 5,
    ),
    Product(
      imageUrl: "assets/images/lamp.png",
      price: 199.00,
      name: "Night Lamp",
      type: "Furniture",
      rate: 4,
    ),
    Product(
      imageUrl: "assets/images/wardrobe.png",
      price: 1300.00,
      name: "Wardrobe",
      type: "Furniture",
      rate: 3,
    ),
    Product(
      imageUrl: "assets/images/tv_stand.png",
      price: 349.00,
      name: "TV Stand",
      type: "Furniture",
      rate: 4,
    ),
    Product(
      imageUrl: "assets/images/shoe.png",
      price: 7777.77,
      name: "CR7 shoes",
      type: "Furniture",
      rate: 5,
    ),
  ];

  static final List<Review> reviews = [
    Review(
      name: 'Ali Karimov',
      imageUrl: 'assets/images/img0.png',
      dateTime: '2025-04-01 12:30',
      title: 'Ajoyib tajriba!',
      comment: 'Xizmat juda yaxshi edi, yana albatta qaytaman.',
      rate: 5,
    ),
    Review(
      name: 'Jessie Phelps',
      imageUrl: 'assets/images/img1.png',
      dateTime: '2025-04-02 10:15',
      title: 'Great Chair',
      comment:
      'The Size and color , blends well with our mid century home. Sturdy and comfortable. Very happy with this purchase!',
      rate: 4,
    ),
    Review(
      name: 'Dostonbek Usmonov',
      imageUrl: 'assets/images/img2.png',
      dateTime: '2025-03-28 18:45',
      title: 'Zo‘r!',
      comment: 'Shunchaki ajoyib, hammaga tavsiya qilaman.',
      rate: 5,
    ),
    Review(
      name: 'Zulfiya Raximova',
      imageUrl: 'assets/images/img3.png',
      dateTime: '2025-03-30 16:00',
      title: 'O‘rtacha',
      comment: 'Yaxshi tomonlari bor, lekin kamchiliklar ham yetarli.',
      rate: 3,
    ),
    Review(
      name: 'Javohir Qodirov',
      imageUrl: 'assets/images/img4.png',
      dateTime: '2025-04-01 09:05',
      title: 'Xafa bo‘ldim',
      comment: 'Kutilganidek emasdi, xizmat sifati past.',
      rate: 2,
    ),
    for (int i = 0; i <= 4; i++)
      Review(
        name: 'User $i',
        imageUrl: 'assets/images/img$i.png',
        dateTime:
        '2025-04-${(i % 30 + 1).toString().padLeft(2, '0')} ${(i % 24).toString().padLeft(2, '0')}:${(i * 3 % 60).toString().padLeft(2, '0')}',
        title: 'Title $i',
        comment: 'Bu foydalanuvchi $i fikri: xizmat haqida umumiy mulohaza.',
        rate: (i % 5) + 1,
      ),
  ];

  static List<BasketElement> basket =[
  ];

  static double sum = 0;
}