class Show {
  final int? id;
  final String? name;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final String? premiered;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final ShowImage? image;
  final String? summary;

  Show({
    this.id,
    this.name,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.premiered,
    this.officialSite,
    this.schedule,
    this.rating,
    this.image,
    this.summary,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] as int?,
      name: json['name'] as String?,
      language: json['language'] as String?,
      genres: (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String?,
      runtime: json['runtime'] as int?,
      premiered: json['premiered'] as String?,
      officialSite: json['officialSite'] as String?,
      schedule: json['schedule'] != null ? Schedule.fromJson(json['schedule']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
      image: json['image'] != null ? ShowImage.fromJson(json['image']) : null,
      summary: json['summary'] as String?,
    );
  }
}
class Schedule {
  final String? time;
  final List<String>? days;

  Schedule({this.time, this.days});

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      time: json['time'] as String?,
      days: (json['days'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }
}

class Rating {
  final double? average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num?)?.toDouble(),
    );
  }
}

class ShowImage {
  final String? medium;
  final String? original;

  ShowImage({this.medium, this.original});

  factory ShowImage.fromJson(Map<String, dynamic> json) {
    return ShowImage(
      medium: json['medium'] as String?,
      original: json['original'] as String?,
    );
  }
}
class SearchResult {
  final double? score;
  final Show? show;

  SearchResult({this.score, this.show});

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      score: (json['score'] as num?)?.toDouble(),
      show: json['show'] != null ? Show.fromJson(json['show']) : null,
    );
  }
}

