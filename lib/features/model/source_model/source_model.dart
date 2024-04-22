import 'source.dart';

class SourceModel {
  String? status;
  List<Source>? sources;

  SourceModel({this.status, this.sources});

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
        status: json['status'] as String?,
        sources: (json['sources'] as List<dynamic>?)
            ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'sources': sources?.map((e) => e.toJson()).toList(),
      };
}
