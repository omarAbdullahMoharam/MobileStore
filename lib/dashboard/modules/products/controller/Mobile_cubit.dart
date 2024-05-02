import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:mobile_app/dashboard/modules/products/model/repo/firebase_data.dart';
import 'package:mobile_app/dashboard/modules/products/model/repo/local_db_data.dart';
import 'package:mobile_app/dashboard/modules/products/model/Product_model.dart';

part 'Mobile_state.dart';

class MobileCubit extends Cubit<MobilePhonesState> {
  MobileCubit() : super(MobilePhonesLoading()) {
    init();
  }

  List<ProductModel> MobilePhones = [];

  Future<void> init() async {
    emit(MobilePhonesLoading());
    MobilePhones = await (await DatabaseRepo.instance).fetch();
    // MobilePhones = await (await FirebaseRepo.instance).fetch();
    if (MobilePhones.isEmpty) {
      emit(MobilePhonesEmpty());
    } else {
      emit(MobilePhonesLoaded());
    }
  }
}