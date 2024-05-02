import 'dart:developer';
import 'dart:typed_data';
import 'package:mobile_app/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:mobile_app/dashboard/modules/users/model/repo/parent.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:sqflite/sqflite.dart';

class APIsRepo extends ParentRepo {
  static late Database _database;
  @override
  Future<void> delete({required int ID}) {
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> fetch() {
    throw UnimplementedError();
  }

  @override
  Future<void> insert({
    required String brand,
    required String model,
    required int storageCapacity,
    required String color,
    required double price,
    required double screenSize,
    required int ramCapacity,
    required String processor,
    required String cameraResolution,
    required String os,
    required int year,
    String availabilityState = 'In Stock',
    bool favorite = false,
    bool cart = false,
    String description = '''Here you can find all the information you need ''',
    required Uint32List image,
    Uint64List? video,
    required int quantity,
    double? discount,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> UpdateProductState({
    required int id,
    required String availabilityState,
    required int quantity,
  }) async {
    await _database.update(
      'MobilePhones',
      {
        'AvailabilityState': availabilityState,
        'Quantity': quantity,
      },
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

  // ===========Update record for specified ID and quantity===========
  @override
  Future<void> UpdateQuantity({required int id, required int quantity}) async {
    await DatabaseRepo.instance.then((DB) {
      DB.UpdateProductState(
        id: id,
        availabilityState: quantity > 0 ? 'In Stock' : 'Out of Stock',
        quantity: quantity,
      );
    });
  }

  // ==========Update record by specified ID for Cart Products============
  @override
  Future<void> UpdateCart({
    required int id,
    required bool cart,
  }) async {
    await _database.update(
      'MobilePhones',
      {
        'Cart': cart,
      },
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

  //======== Update record by specified ID for Favorite Products ===========
  @override
  Future<void> UpdateFavorite({
    required int id,
    required bool favorite,
  }) async {
    await _database.update(
      'MobilePhones',
      {
        'Favorite': favorite,
      },
      where: 'Id = ?',
      whereArgs: [id],
    );
  }

  // =======Update Product price by discount in MobilePhones Table========
  @override
  Future<void> UpdatePrice({
    required int id,
    required double price,
    required double discount,
  }) async {
    // ID exists ???
    List<Map<String, dynamic>> products = await _database.query(
      'MobilePhones',
      where: 'Id = ?',
      whereArgs: [id],
    );

    //  product exists====> update with discount
    if (products.isNotEmpty) {
      // Calculate the new price after applying the discount
      double newPrice = price * (1 - (discount / 100));

      // Update the product's price in the database
      await _database.update(
        'MobilePhones',
        {
          'Price': newPrice,
        },
        where: 'Id = ?',
        whereArgs: [id],
      );
    } else {
      // not exist !!! ===> notify User
      print('Product with ID $id does not exist.');
      //============>>notify for developer
      log("Product with ID $id is not Found");
    }
  }
}


// // Delete Product from MobilePhones Table by ID
// Future<void> delete({
//   required int id,
// }) async {
//   // Check if the product with the specified ID exists
//   List<Map<String, dynamic>> products = await _database.query(
//     'MobilePhones',
//     where: 'Id = ?',
//     whereArgs: [id],
//   );

//   // If the product exists, delete it
//   if (products.isNotEmpty) {
//     await _database.delete('MobilePhones', where: 'Id = ?', whereArgs: [id]);
//   } else {
//     print('Product with ID $id does not exist.');
//     // Handle the case where the product does not exist
//   }
// }
