// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controllerMobxFirebase.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Controller on ControllerBase, Store {
  late final _$nameAtom = Atom(name: 'ControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom = Atom(name: 'ControllerBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$workingHoursAtom =
      Atom(name: 'ControllerBase.workingHours', context: context);

  @override
  String get workingHours {
    _$workingHoursAtom.reportRead();
    return super.workingHours;
  }

  @override
  set workingHours(String value) {
    _$workingHoursAtom.reportWrite(value, super.workingHours, () {
      super.workingHours = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: 'ControllerBase.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$profilePictureAtom =
      Atom(name: 'ControllerBase.profilePicture', context: context);

  @override
  String get profilePicture {
    _$profilePictureAtom.reportRead();
    return super.profilePicture;
  }

  @override
  set profilePicture(String value) {
    _$profilePictureAtom.reportWrite(value, super.profilePicture, () {
      super.profilePicture = value;
    });
  }

  late final _$comentariosAtom =
      Atom(name: 'ControllerBase.comentarios', context: context);

  @override
  String get comentarios {
    _$comentariosAtom.reportRead();
    return super.comentarios;
  }

  @override
  set comentarios(String value) {
    _$comentariosAtom.reportWrite(value, super.comentarios, () {
      super.comentarios = value;
    });
  }

  late final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase', context: context);

  @override
  dynamic changeName(String newName) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeName');
    try {
      return super.changeName(newName);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePhoneNumber(String NewPhoneNumber) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changePhoneNumber');
    try {
      return super.changePhoneNumber(NewPhoneNumber);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWorkingHours(String NewWorkingHours) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeWorkingHours');
    try {
      return super.changeWorkingHours(NewWorkingHours);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String NewDescription) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeDescription');
    try {
      return super.changeDescription(NewDescription);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProfilePicture(String NewProfilePicture) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeProfilePicture');
    try {
      return super.changeProfilePicture(NewProfilePicture);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeComentarios(String NewComentarios) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.changeComentarios');
    try {
      return super.changeComentarios(NewComentarios);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
workingHours: ${workingHours},
description: ${description},
profilePicture: ${profilePicture},
comentarios: ${comentarios}
    ''';
  }
}
