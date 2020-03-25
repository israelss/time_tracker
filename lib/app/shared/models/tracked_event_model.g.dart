// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracked_event_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrackedEventModelAdapter extends TypeAdapter<TrackedEventModel> {
  @override
  final typeId = 0;

  @override
  TrackedEventModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrackedEventModel()
      ..id = fields[0] as int
      ..title = fields[1] as String
      ..date = fields[2] as DateTime
      ..elapsedTime = fields[3] as int
      ..unit = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, TrackedEventModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.elapsedTime)
      ..writeByte(4)
      ..write(obj.unit);
  }
}

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrackedEventModel on _TrackedEventModel, Store {
  final _$titleAtom = Atom(name: '_TrackedEventModel.title');

  @override
  String get title {
    _$titleAtom.context.enforceReadPolicy(_$titleAtom);
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.context.conditionallyRunInAction(() {
      super.title = value;
      _$titleAtom.reportChanged();
    }, _$titleAtom, name: '${_$titleAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'title: ${title.toString()}';
    return '{$string}';
  }
}
