// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Datum extends DataClass implements Insertable<Datum> {
  final int id;
  final DataModel surveys;
  Datum({@required this.id, this.surveys});
  factory Datum.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Datum(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      surveys: $DatumsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}surveys'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || surveys != null) {
      final converter = $DatumsTable.$converter0;
      map['surveys'] = Variable<String>(converter.mapToSql(surveys));
    }
    return map;
  }

  DatumsCompanion toCompanion(bool nullToAbsent) {
    return DatumsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      surveys: surveys == null && nullToAbsent
          ? const Value.absent()
          : Value(surveys),
    );
  }

  factory Datum.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Datum(
      id: serializer.fromJson<int>(json['id']),
      surveys: serializer.fromJson<DataModel>(json['surveys']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'surveys': serializer.toJson<DataModel>(surveys),
    };
  }

  Datum copyWith({int id, DataModel surveys}) => Datum(
        id: id ?? this.id,
        surveys: surveys ?? this.surveys,
      );
  @override
  String toString() {
    return (StringBuffer('Datum(')
          ..write('id: $id, ')
          ..write('surveys: $surveys')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, surveys.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Datum && other.id == this.id && other.surveys == this.surveys);
}

class DatumsCompanion extends UpdateCompanion<Datum> {
  final Value<int> id;
  final Value<DataModel> surveys;
  const DatumsCompanion({
    this.id = const Value.absent(),
    this.surveys = const Value.absent(),
  });
  DatumsCompanion.insert({
    this.id = const Value.absent(),
    this.surveys = const Value.absent(),
  });
  static Insertable<Datum> custom({
    Expression<int> id,
    Expression<String> surveys,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (surveys != null) 'surveys': surveys,
    });
  }

  DatumsCompanion copyWith({Value<int> id, Value<DataModel> surveys}) {
    return DatumsCompanion(
      id: id ?? this.id,
      surveys: surveys ?? this.surveys,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (surveys.present) {
      final converter = $DatumsTable.$converter0;
      map['surveys'] = Variable<String>(converter.mapToSql(surveys.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatumsCompanion(')
          ..write('id: $id, ')
          ..write('surveys: $surveys')
          ..write(')'))
        .toString();
  }
}

class $DatumsTable extends Datums with TableInfo<$DatumsTable, Datum> {
  final GeneratedDatabase _db;
  final String _alias;
  $DatumsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _surveysMeta = const VerificationMeta('surveys');
  GeneratedTextColumn _surveys;
  @override
  GeneratedTextColumn get surveys => _surveys ??= _constructSurveys();
  GeneratedTextColumn _constructSurveys() {
    return GeneratedTextColumn(
      'surveys',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, surveys];
  @override
  $DatumsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'datums';
  @override
  final String actualTableName = 'datums';
  @override
  VerificationContext validateIntegrity(Insertable<Datum> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    context.handle(_surveysMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Datum map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Datum.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $DatumsTable createAlias(String alias) {
    return $DatumsTable(_db, alias);
  }

  static TypeConverter<DataModel, String> $converter0 =
      const DataModelConverter();
}

class Result extends DataClass implements Insertable<Result> {
  final int id;
  final ResultResponses response;
  Result({@required this.id, this.response});
  factory Result.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Result(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      response: $ResultsTable.$converter0.mapToDart(stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}response'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || response != null) {
      final converter = $ResultsTable.$converter0;
      map['response'] = Variable<String>(converter.mapToSql(response));
    }
    return map;
  }

  ResultsCompanion toCompanion(bool nullToAbsent) {
    return ResultsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      response: response == null && nullToAbsent
          ? const Value.absent()
          : Value(response),
    );
  }

  factory Result.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Result(
      id: serializer.fromJson<int>(json['id']),
      response: serializer.fromJson<ResultResponses>(json['response']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'response': serializer.toJson<ResultResponses>(response),
    };
  }

  Result copyWith({int id, ResultResponses response}) => Result(
        id: id ?? this.id,
        response: response ?? this.response,
      );
  @override
  String toString() {
    return (StringBuffer('Result(')
          ..write('id: $id, ')
          ..write('response: $response')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, response.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Result &&
          other.id == this.id &&
          other.response == this.response);
}

class ResultsCompanion extends UpdateCompanion<Result> {
  final Value<int> id;
  final Value<ResultResponses> response;
  const ResultsCompanion({
    this.id = const Value.absent(),
    this.response = const Value.absent(),
  });
  ResultsCompanion.insert({
    this.id = const Value.absent(),
    this.response = const Value.absent(),
  });
  static Insertable<Result> custom({
    Expression<int> id,
    Expression<String> response,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (response != null) 'response': response,
    });
  }

  ResultsCompanion copyWith({Value<int> id, Value<ResultResponses> response}) {
    return ResultsCompanion(
      id: id ?? this.id,
      response: response ?? this.response,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (response.present) {
      final converter = $ResultsTable.$converter0;
      map['response'] = Variable<String>(converter.mapToSql(response.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultsCompanion(')
          ..write('id: $id, ')
          ..write('response: $response')
          ..write(')'))
        .toString();
  }
}

class $ResultsTable extends Results with TableInfo<$ResultsTable, Result> {
  final GeneratedDatabase _db;
  final String _alias;
  $ResultsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _responseMeta = const VerificationMeta('response');
  GeneratedTextColumn _response;
  @override
  GeneratedTextColumn get response => _response ??= _constructResponse();
  GeneratedTextColumn _constructResponse() {
    return GeneratedTextColumn(
      'response',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, response];
  @override
  $ResultsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'results';
  @override
  final String actualTableName = 'results';
  @override
  VerificationContext validateIntegrity(Insertable<Result> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    context.handle(_responseMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Result map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Result.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ResultsTable createAlias(String alias) {
    return $ResultsTable(_db, alias);
  }

  static TypeConverter<ResultResponses, String> $converter0 =
      const ResultResponsesConverter();
}

class Token extends DataClass implements Insertable<Token> {
  final int id;
  final String token;
  Token({@required this.id, this.token});
  factory Token.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Token(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      token:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}token']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || token != null) {
      map['token'] = Variable<String>(token);
    }
    return map;
  }

  TokensCompanion toCompanion(bool nullToAbsent) {
    return TokensCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      token:
          token == null && nullToAbsent ? const Value.absent() : Value(token),
    );
  }

  factory Token.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Token(
      id: serializer.fromJson<int>(json['id']),
      token: serializer.fromJson<String>(json['token']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'token': serializer.toJson<String>(token),
    };
  }

  Token copyWith({int id, String token}) => Token(
        id: id ?? this.id,
        token: token ?? this.token,
      );
  @override
  String toString() {
    return (StringBuffer('Token(')
          ..write('id: $id, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, token.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Token && other.id == this.id && other.token == this.token);
}

class TokensCompanion extends UpdateCompanion<Token> {
  final Value<int> id;
  final Value<String> token;
  const TokensCompanion({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
  });
  TokensCompanion.insert({
    this.id = const Value.absent(),
    this.token = const Value.absent(),
  });
  static Insertable<Token> custom({
    Expression<int> id,
    Expression<String> token,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (token != null) 'token': token,
    });
  }

  TokensCompanion copyWith({Value<int> id, Value<String> token}) {
    return TokensCompanion(
      id: id ?? this.id,
      token: token ?? this.token,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (token.present) {
      map['token'] = Variable<String>(token.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TokensCompanion(')
          ..write('id: $id, ')
          ..write('token: $token')
          ..write(')'))
        .toString();
  }
}

class $TokensTable extends Tokens with TableInfo<$TokensTable, Token> {
  final GeneratedDatabase _db;
  final String _alias;
  $TokensTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _tokenMeta = const VerificationMeta('token');
  GeneratedTextColumn _token;
  @override
  GeneratedTextColumn get token => _token ??= _constructToken();
  GeneratedTextColumn _constructToken() {
    return GeneratedTextColumn(
      'token',
      $tableName,
      true,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, token];
  @override
  $TokensTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'tokens';
  @override
  final String actualTableName = 'tokens';
  @override
  VerificationContext validateIntegrity(Insertable<Token> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('token')) {
      context.handle(
          _tokenMeta, token.isAcceptableOrUnknown(data['token'], _tokenMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Token map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Token.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $TokensTable createAlias(String alias) {
    return $TokensTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $DatumsTable _datums;
  $DatumsTable get datums => _datums ??= $DatumsTable(this);
  $ResultsTable _results;
  $ResultsTable get results => _results ??= $ResultsTable(this);
  $TokensTable _tokens;
  $TokensTable get tokens => _tokens ??= $TokensTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [datums, results, tokens];
}
