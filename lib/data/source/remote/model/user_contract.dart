class UserContractData {
  String? fullName;
  String? status;
  int? amount;
  int? lastInvoice;
  int? numberOfInvoice;
  String? adress;
  int? itn;
  int? createdData;
  int? currentInvoice;
  bool? isSaved;
  String? id;

  UserContractData({
    this.fullName,
    this.status,
    this.amount,
    this.lastInvoice,
    this.numberOfInvoice,
    this.adress,
    this.itn,
    this.createdData,
    this.currentInvoice,
    this.isSaved,
    this.id,
  });

  UserContractData.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'] as String?;
    status = json['status'] as String?;
    amount = json['amount'] as int?;
    lastInvoice = json['lastInvoice'] as int?;
    numberOfInvoice = json['numberOfInvoice'] as int?;
    adress = json['adress'] as String?;
    itn = json['itn'] as int?;
    createdData = json['createdData'] as int?;
    currentInvoice = json['currentInvoice'] as int?;
    isSaved = json['isSaved'] as bool?;
    id = json['id'] as String?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['fullName'] = fullName;
    json['status'] = status;
    json['amount'] = amount;
    json['lastInvoice'] = lastInvoice;
    json['numberOfInvoice'] = numberOfInvoice;
    json['adress'] = adress;
    json['itn'] = itn;
    json['createdData'] = createdData;
    json['currentInvoice'] = currentInvoice;
    json['isSaved'] = isSaved;
    json['id'] = id;
    return json;
  }
}