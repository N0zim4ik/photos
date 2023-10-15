
import 'package:dio/dio.dart';

class Pinterest {
  int? total;
  int? total_pages;
  List<Results>? results;

  Pinterest({
    required this.total,
    required this.total_pages,
    required this.results,
  });

  factory Pinterest.fromJSon(Map<String, Object?> json) {
    return Pinterest(
      total: json['total'] != null ? json['total'] as int : null,
      total_pages:
          json['total_pages'] != null ? json['total_pages'] as int : null,
      results: json['results'] != null
          ? (json["results"] as List).map((e) => Results.fromJson(e)).toList()
          : null,
    );
  }

  @override
  String toString() {
    return 'Pinterest{total: $total, total_pages: $total_pages, results: $results}';
  }
}

class Results {
  String? id;
  String? slug;
  String? created_at;
  String? updated_at;
  String? promoted_at;
  int? width;
  int? height;
  String? color;
  String? blur_hash;
  String? description;
  String? alt_description;
  List? breadcrumbs;
  Urlss? urls;
  Links? links;
  int? likes;
  bool? liked_by_user;
  List? current_user_collections;
  String? sponsorship;
  Map<String, Object?>? topic_submissions;
  Map<String, Object?>? user;
  List? tags;

  Results({
    required this.id,
    required this.slug,
    required this.created_at,
    required this.updated_at,
    required this.promoted_at,
    required this.width,
    required this.height,
    required this.color,
    required this.blur_hash,
    required this.description,
    required this.alt_description,
    required this.breadcrumbs,
    required this.urls,
    required this.links,
    required this.likes,
    required this.liked_by_user,
    required this.current_user_collections,
    required this.sponsorship,
    required this.topic_submissions,
    required this.user,
    required this.tags,
  });

  factory Results.fromJson(Map<String, Object?> map) {
    return Results(
      id: map['id'] as String?,
      slug: map['slug'] as String?,
      created_at: map['created_at'] as String?,
      updated_at: map['updated_at'] as String?,
      promoted_at: map['promoted_at'] as String?,
      width: map['width'] as int?,
      height: map['height'] as int?,
      color: map['color'] as String?,
      blur_hash: map['blur_hash'] as String?,
      description: map['description'] as String?,
      alt_description: map['alt_description'] as String?,
      breadcrumbs: map['breadcrumbs'] as List?,
      urls: Urlss.fromMap(map["urls"] as Map<String, Object?>),
      links: map['links'] != null
          ? Links.fromJson(map["links"] as Map<String, Object?>)
          : null,
      likes: map['likes'] as int,
      liked_by_user: map['liked_by_user'] as bool,
      current_user_collections: map['current_user_collections'] as List,
      sponsorship: map['sponsorship'] as String?,
      topic_submissions: map['topic_submissions'] as Map<String, Object?>?,
      user: map['user'] as Map<String, Object?>,
      tags: map['tags'] as List,
    );
  }

  @override
  String toString() {
    return 'Results{id: $id, slug: $slug, created_at: $created_at, updated_at: $updated_at, promoted_at: $promoted_at, width: $width, height: $height, color: $color, blur_hash: $blur_hash, description: $description, alt_description: $alt_description, breadcrumbs: $breadcrumbs, urls: $urls, links: $links, likes: $likes, liked_by_user: $liked_by_user, current_user_collections: $current_user_collections, sponsorship: $sponsorship, topic_submissions: $topic_submissions, user: $user, tags: $tags}';
  }
}

class Urlss {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? small_s3;

  Urlss({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.small_s3,
  });


  factory Urlss.fromMap(Map<String, dynamic> map) {
    return Urlss(
      raw: map['raw'] as String?,
      full: map['full'] as String?,
      regular: map['regular'] as String?,
      small: map['small'] as String?,
      thumb: map['thumb'] as String?,
      small_s3: map['small_s3'] as String?,
    );
  }

  @override
  String toString() {
    return 'Urls{raw: $raw, full: $full, regular: $regular, small: $small, thumb: $thumb, small_s3: $small_s3}';
  }
}

class Links {
  String self;
  String html;
  String download;
  String download_location;

  Links({
    required this.self,
    required this.html,
    required this.download,
    required this.download_location,
  });

  factory Links.fromJson(Map<String, Object?> json) {
    return Links(
      self: json['self'] as String,
      html: json['html'] as String,
      download: json['download'] as String,
      download_location: json['download_location'] as String,
    );
  }

  @override
  String toString() {
    return 'Links{self: $self, html: $html, download: $download, download_location: $download_location}';
  }
}

Map<String, String> head2 = {
  "Authorization": "Client-ID Sfg_Dz7Rv40j7edTfjQrRTMGQ9gZV1G2V9cXfGAXdMU"
};


