class AllergiesModel {
  final int id;
  final String name;
  final String? description;



  AllergiesModel( {
    required this.id,
    required this.name,
    this.description,

  });

  factory AllergiesModel.fromJson(Map<String, dynamic> json) {
    return AllergiesModel(



      id: json['id'],
      name: json['name'],

      description: json['description'],
    );
  }

  /// 🔹 لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,

      "description": description,
    };
  }
}
