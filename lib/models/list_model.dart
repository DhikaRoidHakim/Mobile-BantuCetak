class ListResponse {
  final bool? success;
  final List<ListResponseData> data;

  ListResponse({required this.success, required this.data});

  factory ListResponse.fromJson(Map<String, dynamic> json) => ListResponse(
    success: json['success'],
    data: json['data']
        .map<ListResponseData>((x) => ListResponseData.fromJson(x))
        .toList(),
  );
}

class ListResponseData {
  final int id;
  final String number;
  final String? trans_id;
  final String? refid;
  final String name;
  final String source;
  final String destination;
  final int amount;
  final int previous_balance;
  final int ending_balance;
  final String description;
  final String office_code;
  final String collector_code;
  final String? teller_code;
  final int print;
  final DateTime? created_at;
  final DateTime? updated_at;
  final DateTime? synced_at;
  final DateTime? deleted_at;

  ListResponseData({
    required this.id,
    required this.number,
    this.trans_id,
    this.refid,
    required this.name,
    required this.source,
    required this.destination,
    required this.amount,
    required this.previous_balance,
    required this.ending_balance,
    required this.description,
    required this.office_code,
    required this.collector_code,
    this.teller_code,
    required this.print,
    this.created_at,
    this.updated_at,
    this.synced_at,
    this.deleted_at,
  });

  factory ListResponseData.fromJson(Map<String, dynamic> json) =>
      ListResponseData(
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
        created_at: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
        updated_at: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
        synced_at: json['synced_at'] != null ? DateTime.tryParse(json['synced_at']) : null,
        deleted_at: json['deleted_at'] != null ? DateTime.tryParse(json['deleted_at']) : null,
      );
}
