import 'user_model.dart';

class UsersResponseModel {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UserModel> data;
  final SupportModel support;

  UsersResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
    required this.support,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: (json['data'] as List)
          .map((user) => UserModel.fromJson(user))
          .toList(),
      support: SupportModel.fromJson(json['support']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': data.map((user) => user.toJson()).toList(),
      'support': support.toJson(),
    };
  }

  bool get hasMorePages => page < totalPages;
}

class SupportModel {
  final String url;
  final String text;

  SupportModel({required this.url, required this.text});

  factory SupportModel.fromJson(Map<String, dynamic> json) {
    return SupportModel(url: json['url'], text: json['text']);
  }

  Map<String, dynamic> toJson() {
    return {'url': url, 'text': text};
  }
}
