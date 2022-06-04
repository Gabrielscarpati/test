import 'package:flutter/cupertino.dart';

import '../models/pix_request.dart';
import '../models/pix_response.dart';
import '../services/pix_service.dart';

class PixController {
  final PixService service = new PixService();
  final TextEditingController? inputController;

  PixController(this.inputController);

  Future<List> findAll() async {
    return await service.findAll();
  }      //Troquei para futue list

  Future<void> register() async {
    if (inputController != null) {
      String key = inputController!.text;
      var toBeSaved = PixRequest(key: key);
      service.register(toBeSaved);
    }
  }

  Future<void> edit(int id) async {
    if (inputController != null) {
      String key = inputController!.text;
      var toBeUpdated = PixResponse(id: id, pixKeys: key);
      service.update(toBeUpdated);
    }
  }

  Future<void> remove(String id) async {
    service.delete(id);
  }
}
