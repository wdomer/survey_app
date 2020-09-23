// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_from_server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataFromServer _$DataFromServerFromJson(Map<String, dynamic> json) {
  return DataFromServer(
    id: json['id'] as int,
    name: json['name'] as String,
    uniqueUuid: json['uniqueUuid'] as String,
    languages: json['languages'] as String,
    description: json['description'] as String,
    timer: json['timer'] as String,
    importantDates: json['importantDates'] as String,
    createdAt: json['createdAt'] as String,
    updatedAt: json['updatedAt'] as String,
    category: (json['category'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    question: (json['question'] as List)
        ?.map((e) =>
            e == null ? null : Question.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataFromServerToJson(DataFromServer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uniqueUuid': instance.uniqueUuid,
      'languages': instance.languages,
      'description': instance.description,
      'timer': instance.timer,
      'importantDates': instance.importantDates,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'category': instance.category,
      'question': instance.question,
    };
