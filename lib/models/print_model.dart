class PrintResponse {
  final String? success;
  final Data? data;

  PrintResponse({required this.success, required this.data});

  factory PrintResponse.fromJson(Map<String, dynamic> json) => PrintResponse(
    success: json['success'],
    data: json['data'] != null ? Data.fromJson(json['data']) : null,
  );
}

class Data {
  final int id;
  final String number;
  final String trans_id;
  final String refid;
  final String name;
  final String source;
  final String destination;
  final int amount;
  final int previous_balance;
  final int ending_balance;
  final String description;
  final String office_code;
  final String collector_code;
  final String teller_code;
  final int print;
  final String created_at;
  final String updated_at;
  final String synced_at;
  final String deleted_at;

  Data({
    required this.id,
    required this.number,
    required this.trans_id,
    required this.refid,
    required this.name,
    required this.source,
    required this.destination,
    required this.amount,
    required this.previous_balance,
    required this.ending_balance,
    required this.description,
    required this.office_code,
    required this.collector_code,
    required this.teller_code,
    required this.print,
    required this.created_at,
    required this.updated_at,
    required this.synced_at,
    required this.deleted_at,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json['id'],
    number: json['number'],
    trans_id: json['trans_id'],
    refid: json['refid'],
    name: json['name'],
    source: json['source'],
    destination: json['destination'],
    amount: json['amount'],
    previous_balance: json['previous_balance'],
    ending_balance: json['ending_balance'],
    description: json['description'],
    office_code: json['office_code'],
    collector_code: json['collector_code'],
    teller_code: json['teller_code'],
    print: json['print'],
    created_at: json['created_at'],
    updated_at: json['updated_at'],
    synced_at: json['synced_at'],
    deleted_at: json['deleted_at'],
  );
}
