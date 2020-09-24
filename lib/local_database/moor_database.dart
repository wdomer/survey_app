import 'package:moor_flutter/moor_flutter.dart';
import 'package:survey_app/local_database/ResultResponsesConverter.dart';
import 'package:survey_app/local_database/data.dart';
import 'package:survey_app/local_database/DataConverter.dart';
import 'package:survey_app/local_database/responses.dart';

import 'package:moor/moor.dart';

part 'moor_database.g.dart';

class Datums extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get surveys => text().map(const DataModelConverter()).nullable()();
}

class Results extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get response => text().map(const ResultResponsesConverter()).nullable()();
}

class Tokens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get token => text().nullable()();
}

@UseMoor(tables: [Datums,Results,Tokens])
class AppDatabase extends _$AppDatabase {
  AppDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: 'db.sqlite',
          logStatements: true,
        ));

  @override
  int get schemaVersion => 1;

//  @override
//  MigrationStrategy get migration =>
//      MigrationStrategy(onUpgrade: (migrator, from, to) async {
//        if (from == 1) {
//          await migrator.addColumn(datums, datums.id);
//        }
//      });

  Future<List<Datum>> getAllOrder() => select(datums).get();
  Future insertSurveys(Datum datum) => into(datums).insert(datum);
  Future updateSurveys(Datum datum) => update(datums).replace(datum);
  Future deleteSurveys(Datum datum) => delete(datums).delete(datum);

  Future<List<Result>> getAllResult() => select(results).get();
  Future insertResults(Result result) => into(results).insert(result);
  Future updateResults(Result result) => update(results).replace(result);
  Future deleteResults(Result result) => delete(results).delete(result);

  Future insertToken(Token token) => into(tokens).insert(token);
  Future deleteToken(Token token) => delete(tokens).delete(token);
  Future<Token> getToken() => select(tokens).getSingle();

}
