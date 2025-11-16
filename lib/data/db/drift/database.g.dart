// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class Favourites extends Table with TableInfo<Favourites, Favourite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Favourites(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  late final GeneratedColumn<int> addedAt = GeneratedColumn<int>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, propertyId, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favourites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favourite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favourite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favourite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  Favourites createAlias(String alias) {
    return Favourites(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(property_id)REFERENCES properties(id)ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Favourite extends DataClass implements Insertable<Favourite> {
  final int id;
  final int propertyId;
  final int addedAt;
  const Favourite({
    required this.id,
    required this.propertyId,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['added_at'] = Variable<int>(addedAt);
    return map;
  }

  FavouritesCompanion toCompanion(bool nullToAbsent) {
    return FavouritesCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      addedAt: Value(addedAt),
    );
  }

  factory Favourite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favourite(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['property_id']),
      addedAt: serializer.fromJson<int>(json['added_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'property_id': serializer.toJson<int>(propertyId),
      'added_at': serializer.toJson<int>(addedAt),
    };
  }

  Favourite copyWith({int? id, int? propertyId, int? addedAt}) => Favourite(
    id: id ?? this.id,
    propertyId: propertyId ?? this.propertyId,
    addedAt: addedAt ?? this.addedAt,
  );
  Favourite copyWithCompanion(FavouritesCompanion data) {
    return Favourite(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favourite(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favourite &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.addedAt == this.addedAt);
}

class FavouritesCompanion extends UpdateCompanion<Favourite> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<int> addedAt;
  const FavouritesCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavouritesCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required int addedAt,
  }) : propertyId = Value(propertyId),
       addedAt = Value(addedAt);
  static Insertable<Favourite> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<int>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavouritesCompanion copyWith({
    Value<int>? id,
    Value<int>? propertyId,
    Value<int>? addedAt,
  }) {
    return FavouritesCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<int>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavouritesCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class Cart extends Table with TableInfo<Cart, CartData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Cart(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT',
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _roomIdMeta = const VerificationMeta('roomId');
  late final GeneratedColumn<int> roomId = GeneratedColumn<int>(
    'room_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  late final GeneratedColumn<int> addedAt = GeneratedColumn<int>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [id, propertyId, roomId, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cart';
  @override
  VerificationContext validateIntegrity(
    Insertable<CartData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIdMeta,
        roomId.isAcceptableOrUnknown(data['room_id']!, _roomIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roomIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_addedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CartData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CartData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      roomId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}room_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  Cart createAlias(String alias) {
    return Cart(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(property_id)REFERENCES properties(id)ON DELETE CASCADE',
    'FOREIGN KEY(room_id)REFERENCES rooms(id)ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class CartData extends DataClass implements Insertable<CartData> {
  final int id;
  final int propertyId;
  final int roomId;
  final int addedAt;
  const CartData({
    required this.id,
    required this.propertyId,
    required this.roomId,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['room_id'] = Variable<int>(roomId);
    map['added_at'] = Variable<int>(addedAt);
    return map;
  }

  CartCompanion toCompanion(bool nullToAbsent) {
    return CartCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      roomId: Value(roomId),
      addedAt: Value(addedAt),
    );
  }

  factory CartData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CartData(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['property_id']),
      roomId: serializer.fromJson<int>(json['room_id']),
      addedAt: serializer.fromJson<int>(json['added_at']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'property_id': serializer.toJson<int>(propertyId),
      'room_id': serializer.toJson<int>(roomId),
      'added_at': serializer.toJson<int>(addedAt),
    };
  }

  CartData copyWith({int? id, int? propertyId, int? roomId, int? addedAt}) =>
      CartData(
        id: id ?? this.id,
        propertyId: propertyId ?? this.propertyId,
        roomId: roomId ?? this.roomId,
        addedAt: addedAt ?? this.addedAt,
      );
  CartData copyWithCompanion(CartCompanion data) {
    return CartData(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      roomId: data.roomId.present ? data.roomId.value : this.roomId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CartData(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('roomId: $roomId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, roomId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CartData &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.roomId == this.roomId &&
          other.addedAt == this.addedAt);
}

class CartCompanion extends UpdateCompanion<CartData> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<int> roomId;
  final Value<int> addedAt;
  const CartCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.roomId = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  CartCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required int roomId,
    required int addedAt,
  }) : propertyId = Value(propertyId),
       roomId = Value(roomId),
       addedAt = Value(addedAt);
  static Insertable<CartData> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<int>? roomId,
    Expression<int>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (roomId != null) 'room_id': roomId,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  CartCompanion copyWith({
    Value<int>? id,
    Value<int>? propertyId,
    Value<int>? roomId,
    Value<int>? addedAt,
  }) {
    return CartCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      roomId: roomId ?? this.roomId,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (roomId.present) {
      map['room_id'] = Variable<int>(roomId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<int>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CartCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('roomId: $roomId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class PropertyImages extends Table
    with TableInfo<PropertyImages, PropertyImage> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  PropertyImages(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _prefixMeta = const VerificationMeta('prefix');
  late final GeneratedColumn<String> prefix = GeneratedColumn<String>(
    'prefix',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyId,
    orderIndex,
    fileName,
    prefix,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'property_images';
  @override
  VerificationContext validateIntegrity(
    Insertable<PropertyImage> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('prefix')) {
      context.handle(
        _prefixMeta,
        prefix.isAcceptableOrUnknown(data['prefix']!, _prefixMeta),
      );
    } else if (isInserting) {
      context.missing(_prefixMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PropertyImage map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PropertyImage(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      prefix: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prefix'],
      )!,
    );
  }

  @override
  PropertyImages createAlias(String alias) {
    return PropertyImages(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(property_id)REFERENCES properties(id)ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class PropertyImage extends DataClass implements Insertable<PropertyImage> {
  final String id;
  final int propertyId;
  final int orderIndex;
  final String fileName;
  final String prefix;
  const PropertyImage({
    required this.id,
    required this.propertyId,
    required this.orderIndex,
    required this.fileName,
    required this.prefix,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['order_index'] = Variable<int>(orderIndex);
    map['file_name'] = Variable<String>(fileName);
    map['prefix'] = Variable<String>(prefix);
    return map;
  }

  PropertyImagesCompanion toCompanion(bool nullToAbsent) {
    return PropertyImagesCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      orderIndex: Value(orderIndex),
      fileName: Value(fileName),
      prefix: Value(prefix),
    );
  }

  factory PropertyImage.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PropertyImage(
      id: serializer.fromJson<String>(json['id']),
      propertyId: serializer.fromJson<int>(json['property_id']),
      orderIndex: serializer.fromJson<int>(json['order_index']),
      fileName: serializer.fromJson<String>(json['file_name']),
      prefix: serializer.fromJson<String>(json['prefix']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'property_id': serializer.toJson<int>(propertyId),
      'order_index': serializer.toJson<int>(orderIndex),
      'file_name': serializer.toJson<String>(fileName),
      'prefix': serializer.toJson<String>(prefix),
    };
  }

  PropertyImage copyWith({
    String? id,
    int? propertyId,
    int? orderIndex,
    String? fileName,
    String? prefix,
  }) => PropertyImage(
    id: id ?? this.id,
    propertyId: propertyId ?? this.propertyId,
    orderIndex: orderIndex ?? this.orderIndex,
    fileName: fileName ?? this.fileName,
    prefix: prefix ?? this.prefix,
  );
  PropertyImage copyWithCompanion(PropertyImagesCompanion data) {
    return PropertyImage(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      prefix: data.prefix.present ? data.prefix.value : this.prefix,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PropertyImage(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('fileName: $fileName, ')
          ..write('prefix: $prefix')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, propertyId, orderIndex, fileName, prefix);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PropertyImage &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.orderIndex == this.orderIndex &&
          other.fileName == this.fileName &&
          other.prefix == this.prefix);
}

class PropertyImagesCompanion extends UpdateCompanion<PropertyImage> {
  final Value<String> id;
  final Value<int> propertyId;
  final Value<int> orderIndex;
  final Value<String> fileName;
  final Value<String> prefix;
  final Value<int> rowid;
  const PropertyImagesCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.fileName = const Value.absent(),
    this.prefix = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PropertyImagesCompanion.insert({
    required String id,
    required int propertyId,
    required int orderIndex,
    required String fileName,
    required String prefix,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       propertyId = Value(propertyId),
       orderIndex = Value(orderIndex),
       fileName = Value(fileName),
       prefix = Value(prefix);
  static Insertable<PropertyImage> custom({
    Expression<String>? id,
    Expression<int>? propertyId,
    Expression<int>? orderIndex,
    Expression<String>? fileName,
    Expression<String>? prefix,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (orderIndex != null) 'order_index': orderIndex,
      if (fileName != null) 'file_name': fileName,
      if (prefix != null) 'prefix': prefix,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PropertyImagesCompanion copyWith({
    Value<String>? id,
    Value<int>? propertyId,
    Value<int>? orderIndex,
    Value<String>? fileName,
    Value<String>? prefix,
    Value<int>? rowid,
  }) {
    return PropertyImagesCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      orderIndex: orderIndex ?? this.orderIndex,
      fileName: fileName ?? this.fileName,
      prefix: prefix ?? this.prefix,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (prefix.present) {
      map['prefix'] = Variable<String>(prefix.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertyImagesCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('fileName: $fileName, ')
          ..write('prefix: $prefix, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class Rooms extends Table with TableInfo<Rooms, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Rooms(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _propertyIdMeta = const VerificationMeta(
    'propertyId',
  );
  late final GeneratedColumn<int> propertyId = GeneratedColumn<int>(
    'property_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _isAcAvailableMeta = const VerificationMeta(
    'isAcAvailable',
  );
  late final GeneratedColumn<int> isAcAvailable = GeneratedColumn<int>(
    'is_ac_available',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _rentAmountMeta = const VerificationMeta(
    'rentAmount',
  );
  late final GeneratedColumn<String> rentAmount = GeneratedColumn<String>(
    'rent_amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _securityDepositMeta = const VerificationMeta(
    'securityDeposit',
  );
  late final GeneratedColumn<String> securityDeposit = GeneratedColumn<String>(
    'security_deposit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyId,
    name,
    type,
    isAcAvailable,
    rentAmount,
    securityDeposit,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(
    Insertable<Room> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_id')) {
      context.handle(
        _propertyIdMeta,
        propertyId.isAcceptableOrUnknown(data['property_id']!, _propertyIdMeta),
      );
    } else if (isInserting) {
      context.missing(_propertyIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('is_ac_available')) {
      context.handle(
        _isAcAvailableMeta,
        isAcAvailable.isAcceptableOrUnknown(
          data['is_ac_available']!,
          _isAcAvailableMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_isAcAvailableMeta);
    }
    if (data.containsKey('rent_amount')) {
      context.handle(
        _rentAmountMeta,
        rentAmount.isAcceptableOrUnknown(data['rent_amount']!, _rentAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_rentAmountMeta);
    }
    if (data.containsKey('security_deposit')) {
      context.handle(
        _securityDepositMeta,
        securityDeposit.isAcceptableOrUnknown(
          data['security_deposit']!,
          _securityDepositMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_securityDepositMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}property_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      isAcAvailable: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}is_ac_available'],
      )!,
      rentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rent_amount'],
      )!,
      securityDeposit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}security_deposit'],
      )!,
    );
  }

  @override
  Rooms createAlias(String alias) {
    return Rooms(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
    'FOREIGN KEY(property_id)REFERENCES properties(id)ON DELETE CASCADE',
  ];
  @override
  bool get dontWriteConstraints => true;
}

class Room extends DataClass implements Insertable<Room> {
  final int id;
  final int propertyId;
  final String name;
  final String type;
  final int isAcAvailable;
  final String rentAmount;
  final String securityDeposit;
  const Room({
    required this.id,
    required this.propertyId,
    required this.name,
    required this.type,
    required this.isAcAvailable,
    required this.rentAmount,
    required this.securityDeposit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_id'] = Variable<int>(propertyId);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['is_ac_available'] = Variable<int>(isAcAvailable);
    map['rent_amount'] = Variable<String>(rentAmount);
    map['security_deposit'] = Variable<String>(securityDeposit);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      propertyId: Value(propertyId),
      name: Value(name),
      type: Value(type),
      isAcAvailable: Value(isAcAvailable),
      rentAmount: Value(rentAmount),
      securityDeposit: Value(securityDeposit),
    );
  }

  factory Room.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      propertyId: serializer.fromJson<int>(json['property_id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      isAcAvailable: serializer.fromJson<int>(json['is_ac_available']),
      rentAmount: serializer.fromJson<String>(json['rent_amount']),
      securityDeposit: serializer.fromJson<String>(json['security_deposit']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'property_id': serializer.toJson<int>(propertyId),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'is_ac_available': serializer.toJson<int>(isAcAvailable),
      'rent_amount': serializer.toJson<String>(rentAmount),
      'security_deposit': serializer.toJson<String>(securityDeposit),
    };
  }

  Room copyWith({
    int? id,
    int? propertyId,
    String? name,
    String? type,
    int? isAcAvailable,
    String? rentAmount,
    String? securityDeposit,
  }) => Room(
    id: id ?? this.id,
    propertyId: propertyId ?? this.propertyId,
    name: name ?? this.name,
    type: type ?? this.type,
    isAcAvailable: isAcAvailable ?? this.isAcAvailable,
    rentAmount: rentAmount ?? this.rentAmount,
    securityDeposit: securityDeposit ?? this.securityDeposit,
  );
  Room copyWithCompanion(RoomsCompanion data) {
    return Room(
      id: data.id.present ? data.id.value : this.id,
      propertyId: data.propertyId.present
          ? data.propertyId.value
          : this.propertyId,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      isAcAvailable: data.isAcAvailable.present
          ? data.isAcAvailable.value
          : this.isAcAvailable,
      rentAmount: data.rentAmount.present
          ? data.rentAmount.value
          : this.rentAmount,
      securityDeposit: data.securityDeposit.present
          ? data.securityDeposit.value
          : this.securityDeposit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isAcAvailable: $isAcAvailable, ')
          ..write('rentAmount: $rentAmount, ')
          ..write('securityDeposit: $securityDeposit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    propertyId,
    name,
    type,
    isAcAvailable,
    rentAmount,
    securityDeposit,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.propertyId == this.propertyId &&
          other.name == this.name &&
          other.type == this.type &&
          other.isAcAvailable == this.isAcAvailable &&
          other.rentAmount == this.rentAmount &&
          other.securityDeposit == this.securityDeposit);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<int> propertyId;
  final Value<String> name;
  final Value<String> type;
  final Value<int> isAcAvailable;
  final Value<String> rentAmount;
  final Value<String> securityDeposit;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.propertyId = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.isAcAvailable = const Value.absent(),
    this.rentAmount = const Value.absent(),
    this.securityDeposit = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required int propertyId,
    required String name,
    required String type,
    required int isAcAvailable,
    required String rentAmount,
    required String securityDeposit,
  }) : propertyId = Value(propertyId),
       name = Value(name),
       type = Value(type),
       isAcAvailable = Value(isAcAvailable),
       rentAmount = Value(rentAmount),
       securityDeposit = Value(securityDeposit);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<int>? propertyId,
    Expression<String>? name,
    Expression<String>? type,
    Expression<int>? isAcAvailable,
    Expression<String>? rentAmount,
    Expression<String>? securityDeposit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyId != null) 'property_id': propertyId,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (isAcAvailable != null) 'is_ac_available': isAcAvailable,
      if (rentAmount != null) 'rent_amount': rentAmount,
      if (securityDeposit != null) 'security_deposit': securityDeposit,
    });
  }

  RoomsCompanion copyWith({
    Value<int>? id,
    Value<int>? propertyId,
    Value<String>? name,
    Value<String>? type,
    Value<int>? isAcAvailable,
    Value<String>? rentAmount,
    Value<String>? securityDeposit,
  }) {
    return RoomsCompanion(
      id: id ?? this.id,
      propertyId: propertyId ?? this.propertyId,
      name: name ?? this.name,
      type: type ?? this.type,
      isAcAvailable: isAcAvailable ?? this.isAcAvailable,
      rentAmount: rentAmount ?? this.rentAmount,
      securityDeposit: securityDeposit ?? this.securityDeposit,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyId.present) {
      map['property_id'] = Variable<int>(propertyId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (isAcAvailable.present) {
      map['is_ac_available'] = Variable<int>(isAcAvailable.value);
    }
    if (rentAmount.present) {
      map['rent_amount'] = Variable<String>(rentAmount.value);
    }
    if (securityDeposit.present) {
      map['security_deposit'] = Variable<String>(securityDeposit.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('propertyId: $propertyId, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('isAcAvailable: $isAcAvailable, ')
          ..write('rentAmount: $rentAmount, ')
          ..write('securityDeposit: $securityDeposit')
          ..write(')'))
        .toString();
  }
}

class Properties extends Table with TableInfo<Properties, Property> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Properties(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _propertyNameMeta = const VerificationMeta(
    'propertyName',
  );
  late final GeneratedColumn<String> propertyName = GeneratedColumn<String>(
    'property_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _displayNameMeta = const VerificationMeta(
    'displayName',
  );
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
    'display_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _propertyTypeMeta = const VerificationMeta(
    'propertyType',
  );
  late final GeneratedColumn<String> propertyType = GeneratedColumn<String>(
    'property_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _accommodationTypeMeta = const VerificationMeta(
    'accommodationType',
  );
  late final GeneratedColumn<String> accommodationType =
      GeneratedColumn<String>(
        'accommodation_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  static const VerificationMeta _localityMeta = const VerificationMeta(
    'locality',
  );
  late final GeneratedColumn<String> locality = GeneratedColumn<String>(
    'locality',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _rentAmountMeta = const VerificationMeta(
    'rentAmount',
  );
  late final GeneratedColumn<String> rentAmount = GeneratedColumn<String>(
    'rent_amount',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _distanceMeta = const VerificationMeta(
    'distance',
  );
  late final GeneratedColumn<double> distance = GeneratedColumn<double>(
    'distance',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _ownerFirstNameMeta = const VerificationMeta(
    'ownerFirstName',
  );
  late final GeneratedColumn<String> ownerFirstName = GeneratedColumn<String>(
    'owner_first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _ownerLastNameMeta = const VerificationMeta(
    'ownerLastName',
  );
  late final GeneratedColumn<String> ownerLastName = GeneratedColumn<String>(
    'owner_last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _ownerMobileNumberMeta = const VerificationMeta(
    'ownerMobileNumber',
  );
  late final GeneratedColumn<String> ownerMobileNumber =
      GeneratedColumn<String>(
        'owner_mobile_number',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
        $customConstraints: 'NOT NULL',
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    propertyName,
    displayName,
    propertyType,
    accommodationType,
    locality,
    city,
    rentAmount,
    distance,
    ownerFirstName,
    ownerLastName,
    ownerMobileNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'properties';
  @override
  VerificationContext validateIntegrity(
    Insertable<Property> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('property_name')) {
      context.handle(
        _propertyNameMeta,
        propertyName.isAcceptableOrUnknown(
          data['property_name']!,
          _propertyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyNameMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
        _displayNameMeta,
        displayName.isAcceptableOrUnknown(
          data['display_name']!,
          _displayNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('property_type')) {
      context.handle(
        _propertyTypeMeta,
        propertyType.isAcceptableOrUnknown(
          data['property_type']!,
          _propertyTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_propertyTypeMeta);
    }
    if (data.containsKey('accommodation_type')) {
      context.handle(
        _accommodationTypeMeta,
        accommodationType.isAcceptableOrUnknown(
          data['accommodation_type']!,
          _accommodationTypeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_accommodationTypeMeta);
    }
    if (data.containsKey('locality')) {
      context.handle(
        _localityMeta,
        locality.isAcceptableOrUnknown(data['locality']!, _localityMeta),
      );
    } else if (isInserting) {
      context.missing(_localityMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('rent_amount')) {
      context.handle(
        _rentAmountMeta,
        rentAmount.isAcceptableOrUnknown(data['rent_amount']!, _rentAmountMeta),
      );
    } else if (isInserting) {
      context.missing(_rentAmountMeta);
    }
    if (data.containsKey('distance')) {
      context.handle(
        _distanceMeta,
        distance.isAcceptableOrUnknown(data['distance']!, _distanceMeta),
      );
    } else if (isInserting) {
      context.missing(_distanceMeta);
    }
    if (data.containsKey('owner_first_name')) {
      context.handle(
        _ownerFirstNameMeta,
        ownerFirstName.isAcceptableOrUnknown(
          data['owner_first_name']!,
          _ownerFirstNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerFirstNameMeta);
    }
    if (data.containsKey('owner_last_name')) {
      context.handle(
        _ownerLastNameMeta,
        ownerLastName.isAcceptableOrUnknown(
          data['owner_last_name']!,
          _ownerLastNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerLastNameMeta);
    }
    if (data.containsKey('owner_mobile_number')) {
      context.handle(
        _ownerMobileNumberMeta,
        ownerMobileNumber.isAcceptableOrUnknown(
          data['owner_mobile_number']!,
          _ownerMobileNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ownerMobileNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Property map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Property(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      propertyName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_name'],
      )!,
      displayName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}display_name'],
      )!,
      propertyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}property_type'],
      )!,
      accommodationType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}accommodation_type'],
      )!,
      locality: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}locality'],
      )!,
      city: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city'],
      )!,
      rentAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rent_amount'],
      )!,
      distance: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}distance'],
      )!,
      ownerFirstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_first_name'],
      )!,
      ownerLastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_last_name'],
      )!,
      ownerMobileNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_mobile_number'],
      )!,
    );
  }

  @override
  Properties createAlias(String alias) {
    return Properties(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Property extends DataClass implements Insertable<Property> {
  final int id;
  final String propertyName;
  final String displayName;
  final String propertyType;
  final String accommodationType;
  final String locality;
  final String city;
  final String rentAmount;
  final double distance;
  final String ownerFirstName;
  final String ownerLastName;
  final String ownerMobileNumber;
  const Property({
    required this.id,
    required this.propertyName,
    required this.displayName,
    required this.propertyType,
    required this.accommodationType,
    required this.locality,
    required this.city,
    required this.rentAmount,
    required this.distance,
    required this.ownerFirstName,
    required this.ownerLastName,
    required this.ownerMobileNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['property_name'] = Variable<String>(propertyName);
    map['display_name'] = Variable<String>(displayName);
    map['property_type'] = Variable<String>(propertyType);
    map['accommodation_type'] = Variable<String>(accommodationType);
    map['locality'] = Variable<String>(locality);
    map['city'] = Variable<String>(city);
    map['rent_amount'] = Variable<String>(rentAmount);
    map['distance'] = Variable<double>(distance);
    map['owner_first_name'] = Variable<String>(ownerFirstName);
    map['owner_last_name'] = Variable<String>(ownerLastName);
    map['owner_mobile_number'] = Variable<String>(ownerMobileNumber);
    return map;
  }

  PropertiesCompanion toCompanion(bool nullToAbsent) {
    return PropertiesCompanion(
      id: Value(id),
      propertyName: Value(propertyName),
      displayName: Value(displayName),
      propertyType: Value(propertyType),
      accommodationType: Value(accommodationType),
      locality: Value(locality),
      city: Value(city),
      rentAmount: Value(rentAmount),
      distance: Value(distance),
      ownerFirstName: Value(ownerFirstName),
      ownerLastName: Value(ownerLastName),
      ownerMobileNumber: Value(ownerMobileNumber),
    );
  }

  factory Property.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Property(
      id: serializer.fromJson<int>(json['id']),
      propertyName: serializer.fromJson<String>(json['property_name']),
      displayName: serializer.fromJson<String>(json['display_name']),
      propertyType: serializer.fromJson<String>(json['property_type']),
      accommodationType: serializer.fromJson<String>(
        json['accommodation_type'],
      ),
      locality: serializer.fromJson<String>(json['locality']),
      city: serializer.fromJson<String>(json['city']),
      rentAmount: serializer.fromJson<String>(json['rent_amount']),
      distance: serializer.fromJson<double>(json['distance']),
      ownerFirstName: serializer.fromJson<String>(json['owner_first_name']),
      ownerLastName: serializer.fromJson<String>(json['owner_last_name']),
      ownerMobileNumber: serializer.fromJson<String>(
        json['owner_mobile_number'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'property_name': serializer.toJson<String>(propertyName),
      'display_name': serializer.toJson<String>(displayName),
      'property_type': serializer.toJson<String>(propertyType),
      'accommodation_type': serializer.toJson<String>(accommodationType),
      'locality': serializer.toJson<String>(locality),
      'city': serializer.toJson<String>(city),
      'rent_amount': serializer.toJson<String>(rentAmount),
      'distance': serializer.toJson<double>(distance),
      'owner_first_name': serializer.toJson<String>(ownerFirstName),
      'owner_last_name': serializer.toJson<String>(ownerLastName),
      'owner_mobile_number': serializer.toJson<String>(ownerMobileNumber),
    };
  }

  Property copyWith({
    int? id,
    String? propertyName,
    String? displayName,
    String? propertyType,
    String? accommodationType,
    String? locality,
    String? city,
    String? rentAmount,
    double? distance,
    String? ownerFirstName,
    String? ownerLastName,
    String? ownerMobileNumber,
  }) => Property(
    id: id ?? this.id,
    propertyName: propertyName ?? this.propertyName,
    displayName: displayName ?? this.displayName,
    propertyType: propertyType ?? this.propertyType,
    accommodationType: accommodationType ?? this.accommodationType,
    locality: locality ?? this.locality,
    city: city ?? this.city,
    rentAmount: rentAmount ?? this.rentAmount,
    distance: distance ?? this.distance,
    ownerFirstName: ownerFirstName ?? this.ownerFirstName,
    ownerLastName: ownerLastName ?? this.ownerLastName,
    ownerMobileNumber: ownerMobileNumber ?? this.ownerMobileNumber,
  );
  Property copyWithCompanion(PropertiesCompanion data) {
    return Property(
      id: data.id.present ? data.id.value : this.id,
      propertyName: data.propertyName.present
          ? data.propertyName.value
          : this.propertyName,
      displayName: data.displayName.present
          ? data.displayName.value
          : this.displayName,
      propertyType: data.propertyType.present
          ? data.propertyType.value
          : this.propertyType,
      accommodationType: data.accommodationType.present
          ? data.accommodationType.value
          : this.accommodationType,
      locality: data.locality.present ? data.locality.value : this.locality,
      city: data.city.present ? data.city.value : this.city,
      rentAmount: data.rentAmount.present
          ? data.rentAmount.value
          : this.rentAmount,
      distance: data.distance.present ? data.distance.value : this.distance,
      ownerFirstName: data.ownerFirstName.present
          ? data.ownerFirstName.value
          : this.ownerFirstName,
      ownerLastName: data.ownerLastName.present
          ? data.ownerLastName.value
          : this.ownerLastName,
      ownerMobileNumber: data.ownerMobileNumber.present
          ? data.ownerMobileNumber.value
          : this.ownerMobileNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Property(')
          ..write('id: $id, ')
          ..write('propertyName: $propertyName, ')
          ..write('displayName: $displayName, ')
          ..write('propertyType: $propertyType, ')
          ..write('accommodationType: $accommodationType, ')
          ..write('locality: $locality, ')
          ..write('city: $city, ')
          ..write('rentAmount: $rentAmount, ')
          ..write('distance: $distance, ')
          ..write('ownerFirstName: $ownerFirstName, ')
          ..write('ownerLastName: $ownerLastName, ')
          ..write('ownerMobileNumber: $ownerMobileNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    propertyName,
    displayName,
    propertyType,
    accommodationType,
    locality,
    city,
    rentAmount,
    distance,
    ownerFirstName,
    ownerLastName,
    ownerMobileNumber,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Property &&
          other.id == this.id &&
          other.propertyName == this.propertyName &&
          other.displayName == this.displayName &&
          other.propertyType == this.propertyType &&
          other.accommodationType == this.accommodationType &&
          other.locality == this.locality &&
          other.city == this.city &&
          other.rentAmount == this.rentAmount &&
          other.distance == this.distance &&
          other.ownerFirstName == this.ownerFirstName &&
          other.ownerLastName == this.ownerLastName &&
          other.ownerMobileNumber == this.ownerMobileNumber);
}

class PropertiesCompanion extends UpdateCompanion<Property> {
  final Value<int> id;
  final Value<String> propertyName;
  final Value<String> displayName;
  final Value<String> propertyType;
  final Value<String> accommodationType;
  final Value<String> locality;
  final Value<String> city;
  final Value<String> rentAmount;
  final Value<double> distance;
  final Value<String> ownerFirstName;
  final Value<String> ownerLastName;
  final Value<String> ownerMobileNumber;
  const PropertiesCompanion({
    this.id = const Value.absent(),
    this.propertyName = const Value.absent(),
    this.displayName = const Value.absent(),
    this.propertyType = const Value.absent(),
    this.accommodationType = const Value.absent(),
    this.locality = const Value.absent(),
    this.city = const Value.absent(),
    this.rentAmount = const Value.absent(),
    this.distance = const Value.absent(),
    this.ownerFirstName = const Value.absent(),
    this.ownerLastName = const Value.absent(),
    this.ownerMobileNumber = const Value.absent(),
  });
  PropertiesCompanion.insert({
    this.id = const Value.absent(),
    required String propertyName,
    required String displayName,
    required String propertyType,
    required String accommodationType,
    required String locality,
    required String city,
    required String rentAmount,
    required double distance,
    required String ownerFirstName,
    required String ownerLastName,
    required String ownerMobileNumber,
  }) : propertyName = Value(propertyName),
       displayName = Value(displayName),
       propertyType = Value(propertyType),
       accommodationType = Value(accommodationType),
       locality = Value(locality),
       city = Value(city),
       rentAmount = Value(rentAmount),
       distance = Value(distance),
       ownerFirstName = Value(ownerFirstName),
       ownerLastName = Value(ownerLastName),
       ownerMobileNumber = Value(ownerMobileNumber);
  static Insertable<Property> custom({
    Expression<int>? id,
    Expression<String>? propertyName,
    Expression<String>? displayName,
    Expression<String>? propertyType,
    Expression<String>? accommodationType,
    Expression<String>? locality,
    Expression<String>? city,
    Expression<String>? rentAmount,
    Expression<double>? distance,
    Expression<String>? ownerFirstName,
    Expression<String>? ownerLastName,
    Expression<String>? ownerMobileNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (propertyName != null) 'property_name': propertyName,
      if (displayName != null) 'display_name': displayName,
      if (propertyType != null) 'property_type': propertyType,
      if (accommodationType != null) 'accommodation_type': accommodationType,
      if (locality != null) 'locality': locality,
      if (city != null) 'city': city,
      if (rentAmount != null) 'rent_amount': rentAmount,
      if (distance != null) 'distance': distance,
      if (ownerFirstName != null) 'owner_first_name': ownerFirstName,
      if (ownerLastName != null) 'owner_last_name': ownerLastName,
      if (ownerMobileNumber != null) 'owner_mobile_number': ownerMobileNumber,
    });
  }

  PropertiesCompanion copyWith({
    Value<int>? id,
    Value<String>? propertyName,
    Value<String>? displayName,
    Value<String>? propertyType,
    Value<String>? accommodationType,
    Value<String>? locality,
    Value<String>? city,
    Value<String>? rentAmount,
    Value<double>? distance,
    Value<String>? ownerFirstName,
    Value<String>? ownerLastName,
    Value<String>? ownerMobileNumber,
  }) {
    return PropertiesCompanion(
      id: id ?? this.id,
      propertyName: propertyName ?? this.propertyName,
      displayName: displayName ?? this.displayName,
      propertyType: propertyType ?? this.propertyType,
      accommodationType: accommodationType ?? this.accommodationType,
      locality: locality ?? this.locality,
      city: city ?? this.city,
      rentAmount: rentAmount ?? this.rentAmount,
      distance: distance ?? this.distance,
      ownerFirstName: ownerFirstName ?? this.ownerFirstName,
      ownerLastName: ownerLastName ?? this.ownerLastName,
      ownerMobileNumber: ownerMobileNumber ?? this.ownerMobileNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (propertyName.present) {
      map['property_name'] = Variable<String>(propertyName.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (propertyType.present) {
      map['property_type'] = Variable<String>(propertyType.value);
    }
    if (accommodationType.present) {
      map['accommodation_type'] = Variable<String>(accommodationType.value);
    }
    if (locality.present) {
      map['locality'] = Variable<String>(locality.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (rentAmount.present) {
      map['rent_amount'] = Variable<String>(rentAmount.value);
    }
    if (distance.present) {
      map['distance'] = Variable<double>(distance.value);
    }
    if (ownerFirstName.present) {
      map['owner_first_name'] = Variable<String>(ownerFirstName.value);
    }
    if (ownerLastName.present) {
      map['owner_last_name'] = Variable<String>(ownerLastName.value);
    }
    if (ownerMobileNumber.present) {
      map['owner_mobile_number'] = Variable<String>(ownerMobileNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PropertiesCompanion(')
          ..write('id: $id, ')
          ..write('propertyName: $propertyName, ')
          ..write('displayName: $displayName, ')
          ..write('propertyType: $propertyType, ')
          ..write('accommodationType: $accommodationType, ')
          ..write('locality: $locality, ')
          ..write('city: $city, ')
          ..write('rentAmount: $rentAmount, ')
          ..write('distance: $distance, ')
          ..write('ownerFirstName: $ownerFirstName, ')
          ..write('ownerLastName: $ownerLastName, ')
          ..write('ownerMobileNumber: $ownerMobileNumber')
          ..write(')'))
        .toString();
  }
}

class Users extends Table with TableInfo<Users, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Users(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    $customConstraints: 'NOT NULL PRIMARY KEY',
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _lastNameMeta = const VerificationMeta(
    'lastName',
  );
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
    'last_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  static const VerificationMeta _mobileNumberMeta = const VerificationMeta(
    'mobileNumber',
  );
  late final GeneratedColumn<String> mobileNumber = GeneratedColumn<String>(
    'mobile_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL',
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    firstName,
    lastName,
    email,
    mobileNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(
        _lastNameMeta,
        lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta),
      );
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('mobile_number')) {
      context.handle(
        _mobileNumberMeta,
        mobileNumber.isAcceptableOrUnknown(
          data['mobile_number']!,
          _mobileNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_mobileNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      )!,
      lastName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}last_name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      mobileNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mobile_number'],
      )!,
    );
  }

  @override
  Users createAlias(String alias) {
    return Users(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobileNumber;
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobileNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['email'] = Variable<String>(email);
    map['mobile_number'] = Variable<String>(mobileNumber);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      email: Value(email),
      mobileNumber: Value(mobileNumber),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['first_name']),
      lastName: serializer.fromJson<String>(json['last_name']),
      email: serializer.fromJson<String>(json['email']),
      mobileNumber: serializer.fromJson<String>(json['mobile_number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'first_name': serializer.toJson<String>(firstName),
      'last_name': serializer.toJson<String>(lastName),
      'email': serializer.toJson<String>(email),
      'mobile_number': serializer.toJson<String>(mobileNumber),
    };
  }

  User copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? email,
    String? mobileNumber,
  }) => User(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    mobileNumber: mobileNumber ?? this.mobileNumber,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      email: data.email.present ? data.email.value : this.email,
      mobileNumber: data.mobileNumber.present
          ? data.mobileNumber.value
          : this.mobileNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('mobileNumber: $mobileNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName, email, mobileNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.email == this.email &&
          other.mobileNumber == this.mobileNumber);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> email;
  final Value<String> mobileNumber;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.email = const Value.absent(),
    this.mobileNumber = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String email,
    required String mobileNumber,
  }) : firstName = Value(firstName),
       lastName = Value(lastName),
       email = Value(email),
       mobileNumber = Value(mobileNumber);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? email,
    Expression<String>? mobileNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (email != null) 'email': email,
      if (mobileNumber != null) 'mobile_number': mobileNumber,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? firstName,
    Value<String>? lastName,
    Value<String>? email,
    Value<String>? mobileNumber,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (mobileNumber.present) {
      map['mobile_number'] = Variable<String>(mobileNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('email: $email, ')
          ..write('mobileNumber: $mobileNumber')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final Favourites favourites = Favourites(this);
  late final Cart cart = Cart(this);
  late final PropertyImages propertyImages = PropertyImages(this);
  late final Rooms rooms = Rooms(this);
  late final Properties properties = Properties(this);
  late final Users users = Users(this);
  Selectable<Favourite> getAllFavourites() {
    return customSelect(
      'SELECT * FROM favourites ORDER BY added_at DESC',
      variables: [],
      readsFrom: {favourites},
    ).asyncMap(favourites.mapFromRow);
  }

  Selectable<Favourite> getFavourite(int var1) {
    return customSelect(
      'SELECT * FROM favourites WHERE property_id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {favourites},
    ).asyncMap(favourites.mapFromRow);
  }

  Selectable<bool> isFavourite(int var1) {
    return customSelect(
      'SELECT COUNT(*) > 0 AS is_fav FROM favourites WHERE property_id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {favourites},
    ).map((QueryRow row) => row.read<bool>('is_fav'));
  }

  Future<int> insertFavourite(int var1, int var2) {
    return customInsert(
      'INSERT INTO favourites (property_id, added_at) VALUES (?1, ?2)',
      variables: [Variable<int>(var1), Variable<int>(var2)],
      updates: {favourites},
    );
  }

  Future<int> deleteFavourite(int var1) {
    return customUpdate(
      'DELETE FROM favourites WHERE property_id = ?1',
      variables: [Variable<int>(var1)],
      updates: {favourites},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clearFavourites() {
    return customUpdate(
      'DELETE FROM favourites',
      variables: [],
      updates: {favourites},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<CartData> getAllCartItems() {
    return customSelect(
      'SELECT * FROM cart ORDER BY added_at DESC',
      variables: [],
      readsFrom: {cart},
    ).asyncMap(cart.mapFromRow);
  }

  Selectable<CartData> getCartItem(int var1, int var2) {
    return customSelect(
      'SELECT * FROM cart WHERE property_id = ?1 AND room_id = ?2',
      variables: [Variable<int>(var1), Variable<int>(var2)],
      readsFrom: {cart},
    ).asyncMap(cart.mapFromRow);
  }

  Future<int> insertCartItem(int var1, int var2, int var3) {
    return customInsert(
      'INSERT INTO cart (property_id, room_id, added_at) VALUES (?1, ?2, ?3)',
      variables: [
        Variable<int>(var1),
        Variable<int>(var2),
        Variable<int>(var3),
      ],
      updates: {cart},
    );
  }

  Future<int> deleteCartItem(int var1) {
    return customUpdate(
      'DELETE FROM cart WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {cart},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> clearCart() {
    return customUpdate(
      'DELETE FROM cart',
      variables: [],
      updates: {cart},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<PropertyImage> getImagesByProperty(int var1) {
    return customSelect(
      'SELECT * FROM property_images WHERE property_id = ?1 ORDER BY order_index',
      variables: [Variable<int>(var1)],
      readsFrom: {propertyImages},
    ).asyncMap(propertyImages.mapFromRow);
  }

  Future<int> insertImage(
    String var1,
    int var2,
    int var3,
    String var4,
    String var5,
  ) {
    return customInsert(
      'INSERT INTO property_images VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<String>(var1),
        Variable<int>(var2),
        Variable<int>(var3),
        Variable<String>(var4),
        Variable<String>(var5),
      ],
      updates: {propertyImages},
    );
  }

  Future<int> deleteImage(String var1) {
    return customUpdate(
      'DELETE FROM property_images WHERE id = ?1',
      variables: [Variable<String>(var1)],
      updates: {propertyImages},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteImagesByProperty(int var1) {
    return customUpdate(
      'DELETE FROM property_images WHERE property_id = ?1',
      variables: [Variable<int>(var1)],
      updates: {propertyImages},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Room> getRoom(int var1) {
    return customSelect(
      'SELECT * FROM rooms WHERE id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {rooms},
    ).asyncMap(rooms.mapFromRow);
  }

  Selectable<Room> getRoomsByProperty(int var1) {
    return customSelect(
      'SELECT * FROM rooms WHERE property_id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {rooms},
    ).asyncMap(rooms.mapFromRow);
  }

  Future<int> insertRoom(
    int var1,
    int var2,
    String var3,
    String var4,
    int var5,
    String var6,
    String var7,
  ) {
    return customInsert(
      'INSERT INTO rooms VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)',
      variables: [
        Variable<int>(var1),
        Variable<int>(var2),
        Variable<String>(var3),
        Variable<String>(var4),
        Variable<int>(var5),
        Variable<String>(var6),
        Variable<String>(var7),
      ],
      updates: {rooms},
    );
  }

  Future<int> deleteRoom(int var1) {
    return customUpdate(
      'DELETE FROM rooms WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {rooms},
      updateKind: UpdateKind.delete,
    );
  }

  Future<int> deleteRoomsByProperty(int var1) {
    return customUpdate(
      'DELETE FROM rooms WHERE property_id = ?1',
      variables: [Variable<int>(var1)],
      updates: {rooms},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<Property> getProperty(int var1) {
    return customSelect(
      'SELECT * FROM properties WHERE id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {properties},
    ).asyncMap(properties.mapFromRow);
  }

  Selectable<Property> getAllProperties() {
    return customSelect(
      'SELECT * FROM properties',
      variables: [],
      readsFrom: {properties},
    ).asyncMap(properties.mapFromRow);
  }

  Selectable<Property> getPropertiesByCity(String var1) {
    return customSelect(
      'SELECT * FROM properties WHERE city = ?1',
      variables: [Variable<String>(var1)],
      readsFrom: {properties},
    ).asyncMap(properties.mapFromRow);
  }

  Selectable<Property> getPropertiesByLocality(String var1) {
    return customSelect(
      'SELECT * FROM properties WHERE locality = ?1',
      variables: [Variable<String>(var1)],
      readsFrom: {properties},
    ).asyncMap(properties.mapFromRow);
  }

  Future<int> insertProperty(
    int var1,
    String var2,
    String var3,
    String var4,
    String var5,
    String var6,
    String var7,
    String var8,
    double var9,
    String var10,
    String var11,
    String var12,
  ) {
    return customInsert(
      'INSERT OR REPLACE INTO properties VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7, ?8, ?9, ?10, ?11, ?12)',
      variables: [
        Variable<int>(var1),
        Variable<String>(var2),
        Variable<String>(var3),
        Variable<String>(var4),
        Variable<String>(var5),
        Variable<String>(var6),
        Variable<String>(var7),
        Variable<String>(var8),
        Variable<double>(var9),
        Variable<String>(var10),
        Variable<String>(var11),
        Variable<String>(var12),
      ],
      updates: {properties},
    );
  }

  Future<int> deleteProperty(int var1) {
    return customUpdate(
      'DELETE FROM properties WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {properties},
      updateKind: UpdateKind.delete,
    );
  }

  Selectable<User> getUser(int var1) {
    return customSelect(
      'SELECT * FROM users WHERE id = ?1',
      variables: [Variable<int>(var1)],
      readsFrom: {users},
    ).asyncMap(users.mapFromRow);
  }

  Selectable<User> getAllUsers() {
    return customSelect(
      'SELECT * FROM users',
      variables: [],
      readsFrom: {users},
    ).asyncMap(users.mapFromRow);
  }

  Future<int> insertUser(
    int var1,
    String var2,
    String var3,
    String var4,
    String var5,
  ) {
    return customInsert(
      'INSERT INTO users (id, first_name, last_name, email, mobile_number) VALUES (?1, ?2, ?3, ?4, ?5)',
      variables: [
        Variable<int>(var1),
        Variable<String>(var2),
        Variable<String>(var3),
        Variable<String>(var4),
        Variable<String>(var5),
      ],
      updates: {users},
    );
  }

  Future<int> updateUser(
    String var1,
    String var2,
    String var3,
    String var4,
    int var5,
  ) {
    return customUpdate(
      'UPDATE users SET first_name = ?1, last_name = ?2, email = ?3, mobile_number = ?4 WHERE id = ?5',
      variables: [
        Variable<String>(var1),
        Variable<String>(var2),
        Variable<String>(var3),
        Variable<String>(var4),
        Variable<int>(var5),
      ],
      updates: {users},
      updateKind: UpdateKind.update,
    );
  }

  Future<int> deleteUser(int var1) {
    return customUpdate(
      'DELETE FROM users WHERE id = ?1',
      variables: [Variable<int>(var1)],
      updates: {users},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    favourites,
    cart,
    propertyImages,
    rooms,
    properties,
    users,
  ];
}

typedef $FavouritesCreateCompanionBuilder =
    FavouritesCompanion Function({
      Value<int> id,
      required int propertyId,
      required int addedAt,
    });
typedef $FavouritesUpdateCompanionBuilder =
    FavouritesCompanion Function({
      Value<int> id,
      Value<int> propertyId,
      Value<int> addedAt,
    });

class $FavouritesFilterComposer extends Composer<_$AppDatabase, Favourites> {
  $FavouritesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $FavouritesOrderingComposer extends Composer<_$AppDatabase, Favourites> {
  $FavouritesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $FavouritesAnnotationComposer
    extends Composer<_$AppDatabase, Favourites> {
  $FavouritesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $FavouritesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Favourites,
          Favourite,
          $FavouritesFilterComposer,
          $FavouritesOrderingComposer,
          $FavouritesAnnotationComposer,
          $FavouritesCreateCompanionBuilder,
          $FavouritesUpdateCompanionBuilder,
          (Favourite, BaseReferences<_$AppDatabase, Favourites, Favourite>),
          Favourite,
          PrefetchHooks Function()
        > {
  $FavouritesTableManager(_$AppDatabase db, Favourites table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $FavouritesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $FavouritesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $FavouritesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<int> addedAt = const Value.absent(),
              }) => FavouritesCompanion(
                id: id,
                propertyId: propertyId,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int propertyId,
                required int addedAt,
              }) => FavouritesCompanion.insert(
                id: id,
                propertyId: propertyId,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $FavouritesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Favourites,
      Favourite,
      $FavouritesFilterComposer,
      $FavouritesOrderingComposer,
      $FavouritesAnnotationComposer,
      $FavouritesCreateCompanionBuilder,
      $FavouritesUpdateCompanionBuilder,
      (Favourite, BaseReferences<_$AppDatabase, Favourites, Favourite>),
      Favourite,
      PrefetchHooks Function()
    >;
typedef $CartCreateCompanionBuilder =
    CartCompanion Function({
      Value<int> id,
      required int propertyId,
      required int roomId,
      required int addedAt,
    });
typedef $CartUpdateCompanionBuilder =
    CartCompanion Function({
      Value<int> id,
      Value<int> propertyId,
      Value<int> roomId,
      Value<int> addedAt,
    });

class $CartFilterComposer extends Composer<_$AppDatabase, Cart> {
  $CartFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $CartOrderingComposer extends Composer<_$AppDatabase, Cart> {
  $CartOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get roomId => $composableBuilder(
    column: $table.roomId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $CartAnnotationComposer extends Composer<_$AppDatabase, Cart> {
  $CartAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get roomId =>
      $composableBuilder(column: $table.roomId, builder: (column) => column);

  GeneratedColumn<int> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
}

class $CartTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Cart,
          CartData,
          $CartFilterComposer,
          $CartOrderingComposer,
          $CartAnnotationComposer,
          $CartCreateCompanionBuilder,
          $CartUpdateCompanionBuilder,
          (CartData, BaseReferences<_$AppDatabase, Cart, CartData>),
          CartData,
          PrefetchHooks Function()
        > {
  $CartTableManager(_$AppDatabase db, Cart table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $CartFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $CartOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $CartAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<int> roomId = const Value.absent(),
                Value<int> addedAt = const Value.absent(),
              }) => CartCompanion(
                id: id,
                propertyId: propertyId,
                roomId: roomId,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int propertyId,
                required int roomId,
                required int addedAt,
              }) => CartCompanion.insert(
                id: id,
                propertyId: propertyId,
                roomId: roomId,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $CartProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Cart,
      CartData,
      $CartFilterComposer,
      $CartOrderingComposer,
      $CartAnnotationComposer,
      $CartCreateCompanionBuilder,
      $CartUpdateCompanionBuilder,
      (CartData, BaseReferences<_$AppDatabase, Cart, CartData>),
      CartData,
      PrefetchHooks Function()
    >;
typedef $PropertyImagesCreateCompanionBuilder =
    PropertyImagesCompanion Function({
      required String id,
      required int propertyId,
      required int orderIndex,
      required String fileName,
      required String prefix,
      Value<int> rowid,
    });
typedef $PropertyImagesUpdateCompanionBuilder =
    PropertyImagesCompanion Function({
      Value<String> id,
      Value<int> propertyId,
      Value<int> orderIndex,
      Value<String> fileName,
      Value<String> prefix,
      Value<int> rowid,
    });

class $PropertyImagesFilterComposer
    extends Composer<_$AppDatabase, PropertyImages> {
  $PropertyImagesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prefix => $composableBuilder(
    column: $table.prefix,
    builder: (column) => ColumnFilters(column),
  );
}

class $PropertyImagesOrderingComposer
    extends Composer<_$AppDatabase, PropertyImages> {
  $PropertyImagesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prefix => $composableBuilder(
    column: $table.prefix,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PropertyImagesAnnotationComposer
    extends Composer<_$AppDatabase, PropertyImages> {
  $PropertyImagesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get prefix =>
      $composableBuilder(column: $table.prefix, builder: (column) => column);
}

class $PropertyImagesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          PropertyImages,
          PropertyImage,
          $PropertyImagesFilterComposer,
          $PropertyImagesOrderingComposer,
          $PropertyImagesAnnotationComposer,
          $PropertyImagesCreateCompanionBuilder,
          $PropertyImagesUpdateCompanionBuilder,
          (
            PropertyImage,
            BaseReferences<_$AppDatabase, PropertyImages, PropertyImage>,
          ),
          PropertyImage,
          PrefetchHooks Function()
        > {
  $PropertyImagesTableManager(_$AppDatabase db, PropertyImages table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PropertyImagesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PropertyImagesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PropertyImagesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> prefix = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PropertyImagesCompanion(
                id: id,
                propertyId: propertyId,
                orderIndex: orderIndex,
                fileName: fileName,
                prefix: prefix,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int propertyId,
                required int orderIndex,
                required String fileName,
                required String prefix,
                Value<int> rowid = const Value.absent(),
              }) => PropertyImagesCompanion.insert(
                id: id,
                propertyId: propertyId,
                orderIndex: orderIndex,
                fileName: fileName,
                prefix: prefix,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PropertyImagesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      PropertyImages,
      PropertyImage,
      $PropertyImagesFilterComposer,
      $PropertyImagesOrderingComposer,
      $PropertyImagesAnnotationComposer,
      $PropertyImagesCreateCompanionBuilder,
      $PropertyImagesUpdateCompanionBuilder,
      (
        PropertyImage,
        BaseReferences<_$AppDatabase, PropertyImages, PropertyImage>,
      ),
      PropertyImage,
      PrefetchHooks Function()
    >;
typedef $RoomsCreateCompanionBuilder =
    RoomsCompanion Function({
      Value<int> id,
      required int propertyId,
      required String name,
      required String type,
      required int isAcAvailable,
      required String rentAmount,
      required String securityDeposit,
    });
typedef $RoomsUpdateCompanionBuilder =
    RoomsCompanion Function({
      Value<int> id,
      Value<int> propertyId,
      Value<String> name,
      Value<String> type,
      Value<int> isAcAvailable,
      Value<String> rentAmount,
      Value<String> securityDeposit,
    });

class $RoomsFilterComposer extends Composer<_$AppDatabase, Rooms> {
  $RoomsFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get isAcAvailable => $composableBuilder(
    column: $table.isAcAvailable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get securityDeposit => $composableBuilder(
    column: $table.securityDeposit,
    builder: (column) => ColumnFilters(column),
  );
}

class $RoomsOrderingComposer extends Composer<_$AppDatabase, Rooms> {
  $RoomsOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get isAcAvailable => $composableBuilder(
    column: $table.isAcAvailable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get securityDeposit => $composableBuilder(
    column: $table.securityDeposit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $RoomsAnnotationComposer extends Composer<_$AppDatabase, Rooms> {
  $RoomsAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get propertyId => $composableBuilder(
    column: $table.propertyId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get isAcAvailable => $composableBuilder(
    column: $table.isAcAvailable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get securityDeposit => $composableBuilder(
    column: $table.securityDeposit,
    builder: (column) => column,
  );
}

class $RoomsTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Rooms,
          Room,
          $RoomsFilterComposer,
          $RoomsOrderingComposer,
          $RoomsAnnotationComposer,
          $RoomsCreateCompanionBuilder,
          $RoomsUpdateCompanionBuilder,
          (Room, BaseReferences<_$AppDatabase, Rooms, Room>),
          Room,
          PrefetchHooks Function()
        > {
  $RoomsTableManager(_$AppDatabase db, Rooms table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $RoomsFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $RoomsOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $RoomsAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> propertyId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> isAcAvailable = const Value.absent(),
                Value<String> rentAmount = const Value.absent(),
                Value<String> securityDeposit = const Value.absent(),
              }) => RoomsCompanion(
                id: id,
                propertyId: propertyId,
                name: name,
                type: type,
                isAcAvailable: isAcAvailable,
                rentAmount: rentAmount,
                securityDeposit: securityDeposit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int propertyId,
                required String name,
                required String type,
                required int isAcAvailable,
                required String rentAmount,
                required String securityDeposit,
              }) => RoomsCompanion.insert(
                id: id,
                propertyId: propertyId,
                name: name,
                type: type,
                isAcAvailable: isAcAvailable,
                rentAmount: rentAmount,
                securityDeposit: securityDeposit,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $RoomsProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Rooms,
      Room,
      $RoomsFilterComposer,
      $RoomsOrderingComposer,
      $RoomsAnnotationComposer,
      $RoomsCreateCompanionBuilder,
      $RoomsUpdateCompanionBuilder,
      (Room, BaseReferences<_$AppDatabase, Rooms, Room>),
      Room,
      PrefetchHooks Function()
    >;
typedef $PropertiesCreateCompanionBuilder =
    PropertiesCompanion Function({
      Value<int> id,
      required String propertyName,
      required String displayName,
      required String propertyType,
      required String accommodationType,
      required String locality,
      required String city,
      required String rentAmount,
      required double distance,
      required String ownerFirstName,
      required String ownerLastName,
      required String ownerMobileNumber,
    });
typedef $PropertiesUpdateCompanionBuilder =
    PropertiesCompanion Function({
      Value<int> id,
      Value<String> propertyName,
      Value<String> displayName,
      Value<String> propertyType,
      Value<String> accommodationType,
      Value<String> locality,
      Value<String> city,
      Value<String> rentAmount,
      Value<double> distance,
      Value<String> ownerFirstName,
      Value<String> ownerLastName,
      Value<String> ownerMobileNumber,
    });

class $PropertiesFilterComposer extends Composer<_$AppDatabase, Properties> {
  $PropertiesFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get propertyType => $composableBuilder(
    column: $table.propertyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get accommodationType => $composableBuilder(
    column: $table.accommodationType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locality => $composableBuilder(
    column: $table.locality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerFirstName => $composableBuilder(
    column: $table.ownerFirstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerLastName => $composableBuilder(
    column: $table.ownerLastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerMobileNumber => $composableBuilder(
    column: $table.ownerMobileNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $PropertiesOrderingComposer extends Composer<_$AppDatabase, Properties> {
  $PropertiesOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get propertyType => $composableBuilder(
    column: $table.propertyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get accommodationType => $composableBuilder(
    column: $table.accommodationType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locality => $composableBuilder(
    column: $table.locality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get distance => $composableBuilder(
    column: $table.distance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerFirstName => $composableBuilder(
    column: $table.ownerFirstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerLastName => $composableBuilder(
    column: $table.ownerLastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerMobileNumber => $composableBuilder(
    column: $table.ownerMobileNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $PropertiesAnnotationComposer
    extends Composer<_$AppDatabase, Properties> {
  $PropertiesAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get propertyName => $composableBuilder(
    column: $table.propertyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get displayName => $composableBuilder(
    column: $table.displayName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get propertyType => $composableBuilder(
    column: $table.propertyType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get accommodationType => $composableBuilder(
    column: $table.accommodationType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locality =>
      $composableBuilder(column: $table.locality, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get rentAmount => $composableBuilder(
    column: $table.rentAmount,
    builder: (column) => column,
  );

  GeneratedColumn<double> get distance =>
      $composableBuilder(column: $table.distance, builder: (column) => column);

  GeneratedColumn<String> get ownerFirstName => $composableBuilder(
    column: $table.ownerFirstName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerLastName => $composableBuilder(
    column: $table.ownerLastName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownerMobileNumber => $composableBuilder(
    column: $table.ownerMobileNumber,
    builder: (column) => column,
  );
}

class $PropertiesTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Properties,
          Property,
          $PropertiesFilterComposer,
          $PropertiesOrderingComposer,
          $PropertiesAnnotationComposer,
          $PropertiesCreateCompanionBuilder,
          $PropertiesUpdateCompanionBuilder,
          (Property, BaseReferences<_$AppDatabase, Properties, Property>),
          Property,
          PrefetchHooks Function()
        > {
  $PropertiesTableManager(_$AppDatabase db, Properties table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $PropertiesFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $PropertiesOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $PropertiesAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> propertyName = const Value.absent(),
                Value<String> displayName = const Value.absent(),
                Value<String> propertyType = const Value.absent(),
                Value<String> accommodationType = const Value.absent(),
                Value<String> locality = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> rentAmount = const Value.absent(),
                Value<double> distance = const Value.absent(),
                Value<String> ownerFirstName = const Value.absent(),
                Value<String> ownerLastName = const Value.absent(),
                Value<String> ownerMobileNumber = const Value.absent(),
              }) => PropertiesCompanion(
                id: id,
                propertyName: propertyName,
                displayName: displayName,
                propertyType: propertyType,
                accommodationType: accommodationType,
                locality: locality,
                city: city,
                rentAmount: rentAmount,
                distance: distance,
                ownerFirstName: ownerFirstName,
                ownerLastName: ownerLastName,
                ownerMobileNumber: ownerMobileNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String propertyName,
                required String displayName,
                required String propertyType,
                required String accommodationType,
                required String locality,
                required String city,
                required String rentAmount,
                required double distance,
                required String ownerFirstName,
                required String ownerLastName,
                required String ownerMobileNumber,
              }) => PropertiesCompanion.insert(
                id: id,
                propertyName: propertyName,
                displayName: displayName,
                propertyType: propertyType,
                accommodationType: accommodationType,
                locality: locality,
                city: city,
                rentAmount: rentAmount,
                distance: distance,
                ownerFirstName: ownerFirstName,
                ownerLastName: ownerLastName,
                ownerMobileNumber: ownerMobileNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $PropertiesProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Properties,
      Property,
      $PropertiesFilterComposer,
      $PropertiesOrderingComposer,
      $PropertiesAnnotationComposer,
      $PropertiesCreateCompanionBuilder,
      $PropertiesUpdateCompanionBuilder,
      (Property, BaseReferences<_$AppDatabase, Properties, Property>),
      Property,
      PrefetchHooks Function()
    >;
typedef $UsersCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String firstName,
      required String lastName,
      required String email,
      required String mobileNumber,
    });
typedef $UsersUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> firstName,
      Value<String> lastName,
      Value<String> email,
      Value<String> mobileNumber,
    });

class $UsersFilterComposer extends Composer<_$AppDatabase, Users> {
  $UsersFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $UsersOrderingComposer extends Composer<_$AppDatabase, Users> {
  $UsersOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lastName => $composableBuilder(
    column: $table.lastName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $UsersAnnotationComposer extends Composer<_$AppDatabase, Users> {
  $UsersAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get mobileNumber => $composableBuilder(
    column: $table.mobileNumber,
    builder: (column) => column,
  );
}

class $UsersTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          Users,
          User,
          $UsersFilterComposer,
          $UsersOrderingComposer,
          $UsersAnnotationComposer,
          $UsersCreateCompanionBuilder,
          $UsersUpdateCompanionBuilder,
          (User, BaseReferences<_$AppDatabase, Users, User>),
          User,
          PrefetchHooks Function()
        > {
  $UsersTableManager(_$AppDatabase db, Users table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $UsersFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $UsersOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $UsersAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> firstName = const Value.absent(),
                Value<String> lastName = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> mobileNumber = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                firstName: firstName,
                lastName: lastName,
                email: email,
                mobileNumber: mobileNumber,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String firstName,
                required String lastName,
                required String email,
                required String mobileNumber,
              }) => UsersCompanion.insert(
                id: id,
                firstName: firstName,
                lastName: lastName,
                email: email,
                mobileNumber: mobileNumber,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $UsersProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      Users,
      User,
      $UsersFilterComposer,
      $UsersOrderingComposer,
      $UsersAnnotationComposer,
      $UsersCreateCompanionBuilder,
      $UsersUpdateCompanionBuilder,
      (User, BaseReferences<_$AppDatabase, Users, User>),
      User,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $FavouritesTableManager get favourites =>
      $FavouritesTableManager(_db, _db.favourites);
  $CartTableManager get cart => $CartTableManager(_db, _db.cart);
  $PropertyImagesTableManager get propertyImages =>
      $PropertyImagesTableManager(_db, _db.propertyImages);
  $RoomsTableManager get rooms => $RoomsTableManager(_db, _db.rooms);
  $PropertiesTableManager get properties =>
      $PropertiesTableManager(_db, _db.properties);
  $UsersTableManager get users => $UsersTableManager(_db, _db.users);
}
