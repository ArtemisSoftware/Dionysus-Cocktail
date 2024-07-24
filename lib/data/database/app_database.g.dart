// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DrinkDao? _drinkDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `DrinkEntity` (`id` TEXT NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `urlThumbnail` TEXT NOT NULL, `urlImage` TEXT NOT NULL, `modifiedAt` TEXT NOT NULL, `instruction` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DrinkDao get drinkDao {
    return _drinkDaoInstance ??= _$DrinkDao(database, changeListener);
  }
}

class _$DrinkDao extends DrinkDao {
  _$DrinkDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _drinkEntityInsertionAdapter = InsertionAdapter(
            database,
            'DrinkEntity',
            (DrinkEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'urlThumbnail': item.urlThumbnail,
                  'urlImage': item.urlImage,
                  'modifiedAt': item.modifiedAt,
                  'instruction': item.instruction
                }),
        _drinkEntityDeletionAdapter = DeletionAdapter(
            database,
            'DrinkEntity',
            ['id'],
            (DrinkEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'urlThumbnail': item.urlThumbnail,
                  'urlImage': item.urlImage,
                  'modifiedAt': item.modifiedAt,
                  'instruction': item.instruction
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<DrinkEntity> _drinkEntityInsertionAdapter;

  final DeletionAdapter<DrinkEntity> _drinkEntityDeletionAdapter;

  @override
  Future<List<DrinkEntity>> getDrinks() async {
    return _queryAdapter.queryList('SELECT * FROM DrinkEntity',
        mapper: (Map<String, Object?> row) => DrinkEntity(
            id: row['id'] as String,
            name: row['name'] as String,
            description: row['description'] as String,
            urlThumbnail: row['urlThumbnail'] as String,
            urlImage: row['urlImage'] as String,
            modifiedAt: row['modifiedAt'] as String,
            instruction: row['instruction'] as String));
  }

  @override
  Future<void> insertDrink(DrinkEntity drinkEntity) async {
    await _drinkEntityInsertionAdapter.insert(
        drinkEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteDrink(DrinkEntity drinkEntity) async {
    await _drinkEntityDeletionAdapter.delete(drinkEntity);
  }
}
