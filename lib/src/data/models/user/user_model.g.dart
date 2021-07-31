// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      kdUser: fields[0] as String,
      kdLevel: fields[1] as String,
      username: fields[2] as String,
      password: fields[3] as String,
      namaUser: fields[4] as String,
      email: fields[5] as String,
      noTelpon: fields[6] as String,
      foto: fields[7] as String,
      isActive: fields[8] as String,
      token: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.kdUser)
      ..writeByte(1)
      ..write(obj.kdLevel)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.namaUser)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.noTelpon)
      ..writeByte(7)
      ..write(obj.foto)
      ..writeByte(8)
      ..write(obj.isActive)
      ..writeByte(9)
      ..write(obj.token);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
