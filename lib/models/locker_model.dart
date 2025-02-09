class LockerModel {
  String id;
  String status;
  String location;

  LockerModel({required this.id, required this.status, required this.location});

  factory LockerModel.fromJson(Map<String, dynamic> json) {
    return LockerModel(
      id: json['id'],
      status: json['status'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'location': location,
    };
  }
}
