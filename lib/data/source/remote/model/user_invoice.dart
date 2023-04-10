class InvoiceData {
  String? name;
  int? cost;
  String? status;
  int? createdDate;
  bool? isSaved;
  String? id;

  InvoiceData({
    this.name,
    this.cost,
    this.status,
    this.createdDate,
    this.isSaved,
    this.id,
  });

  InvoiceData.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String?;
    cost = json['cost'] as int?;
    status = json['status'] as String?;
    createdDate = json['createdDate'] as int?;
    isSaved = json['isSaved'] as bool?;
    id = json['id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['name'] = name;
    json['cost'] = cost;
    json['status'] = status;
    json['createdDate'] = createdDate;
    json['isSaved'] = isSaved;
    json['id'] = id;
    return json;
  }
}