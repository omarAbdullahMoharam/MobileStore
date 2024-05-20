import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/dashboard/modules/users/controller/Mobile_state.dart';
import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';
import 'package:mobile_app/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:sqflite/sqlite_api.dart';


class ProductCubit extends Cubit<ProductState> {
  static final ProductCubit instance = ProductCubit._internal();
  ProductCubit._internal() : super(ProductStateLoading()) {
    init();
  }

  factory ProductCubit() {
    return instance;
  }

  final DatabaseRepo dbRepo = DatabaseRepo();

  List<ProductModel> products = [];

  Future<void> init() async {
    emit(ProductStateLoading());
    await dbRepo.initDB();
    await dbRepo.insertProduct(
      id: 1,
      storageCapacity: 64,
      price: 22000,
      ramCapacity: 6,
      year: 2024,
      quantity: 1,
      availabilityState: 1,
      brand: 'Samsung',
      model: 'Galaxy S23',
      color: 'Black',
      processor: 'processor',
      cameraResolution: 'cameraResolution',
      os: 'os',
      image: 'assets/images/AirPods-Pro.png',
      screenSize: 6.0,
      discount: 0.0,
    );
    products = await dbRepo.fetchProducts();

    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  Future<void> addToCart(int id, int state) async {
    await dbRepo.updateCart(id, state);
    products = await dbRepo.fetchProducts();
    emit(ProductStateLoaded());
  }

  Future<void> addToFavourite(int id, int state) async {
    await dbRepo.updateFavorite(id, state);
    products = await dbRepo.fetchProducts();
    emit(ProductStateLoaded());
  }

  Future<void> addItemToFavorite(int value, int id) async {
    await dbRepo.updateFavorite(id, value);
    products = await dbRepo.fetchProducts();
    emit(ProductStateLoaded());
  }
}
