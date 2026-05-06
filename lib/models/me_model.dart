class MeResponseModel {
  final bool? success;
  final MeData? data;

  MeResponseModel({this.success, this.data});

  factory MeResponseModel.fromJson(Map<String, dynamic> json) =>
      MeResponseModel(
        success: json["success"],
        data: json["data"] == null ? null : MeData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"success": success, "data": data?.toJson()};
}

class MeData {
  final Employee? employee;
  final Codes? codes;

  MeData({this.employee, this.codes});

  factory MeData.fromJson(Map<String, dynamic> json) => MeData(
    employee: json["employee"] == null
        ? null
        : Employee.fromJson(json["employee"]),
    codes: json["codes"] == null ? null : Codes.fromJson(json["codes"]),
  );

  Map<String, dynamic> toJson() => {
    "employee": employee?.toJson(),
    "codes": codes?.toJson(),
  };
}

class Employee {
  final int? id;
  final int? userId;
  final String? nomorKtp;
  final String? nomorNpwp;
  final String? namaLengkap;
  final String? jenisKelamin;
  final String? tempatLahir;
  final DateTime? tanggalLahir;
  final String? alamatLengkap;
  final String? kodePos;
  final String? statusPerkawinan;
  final String? jumlahPasangan;
  final String? jumlahAnak;
  final String? ibuKandung;
  final String? pendidikanFormal;
  final String? jurusanPendidikanFormal;
  final String? pendidikanNonformal1;
  final String? pendidikanNonformal2;
  final String? pendidikanNonformal3;
  final String? nomorAbsen;
  final String? nomorKaryawan;
  final String? nomorCif;
  final DateTime? tanggalBekerja;
  final DateTime? tanggalKontrak;
  final DateTime? tanggalMutasi;
  final DateTime? tanggalKeluar;
  final String? jabatan;
  final String? nomorSk;
  final String? statusBekerja;
  final String? kantor;
  final String? teleponRumah;
  final String? nomorHandphone;
  final String? nomorWhatsapp;
  final String? alamatEmail;
  final String? createdBy;
  final String? updatedBy;
  final String? authorizedBy;
  final String? deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? authorizedAt;
  final DateTime? deletedAt;

  Employee({
    this.id,
    this.userId,
    this.nomorKtp,
    this.nomorNpwp,
    this.namaLengkap,
    this.jenisKelamin,
    this.tempatLahir,
    this.tanggalLahir,
    this.alamatLengkap,
    this.kodePos,
    this.statusPerkawinan,
    this.jumlahPasangan,
    this.jumlahAnak,
    this.ibuKandung,
    this.pendidikanFormal,
    this.jurusanPendidikanFormal,
    this.pendidikanNonformal1,
    this.pendidikanNonformal2,
    this.pendidikanNonformal3,
    this.nomorAbsen,
    this.nomorKaryawan,
    this.nomorCif,
    this.tanggalBekerja,
    this.tanggalKontrak,
    this.tanggalMutasi,
    this.tanggalKeluar,
    this.jabatan,
    this.nomorSk,
    this.statusBekerja,
    this.kantor,
    this.teleponRumah,
    this.nomorHandphone,
    this.nomorWhatsapp,
    this.alamatEmail,
    this.createdBy,
    this.updatedBy,
    this.authorizedBy,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.authorizedAt,
    this.deletedAt,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    id: json["id"],
    userId: json["user_id"],
    nomorKtp: json["nomor_ktp"],
    nomorNpwp: json["nomor_npwp"],
    namaLengkap: json["nama_lengkap"],
    jenisKelamin: json["jenis_kelamin"],
    tempatLahir: json["tempat_lahir"],
    tanggalLahir: json["tanggal_lahir"] == null
        ? null
        : DateTime.tryParse(json["tanggal_lahir"]),
    alamatLengkap: json["alamat_lengkap"],
    kodePos: json["kode_pos"],
    statusPerkawinan: json["status_perkawinan"],
    jumlahPasangan: json["jumlah_pasangan"],
    jumlahAnak: json["jumlah_anak"],
    ibuKandung: json["ibu_kandung"],
    pendidikanFormal: json["pendidikan_formal"],
    jurusanPendidikanFormal: json["jurusan_pendidikan_formal"],
    pendidikanNonformal1: json["pendidikan_nonformal_1"],
    pendidikanNonformal2: json["pendidikan_nonformal_2"],
    pendidikanNonformal3: json["pendidikan_nonformal_3"],
    nomorAbsen: json["nomor_absen"],
    nomorKaryawan: json["nomor_karyawan"],
    nomorCif: json["nomor_cif"],
    tanggalBekerja: json["tanggal_bekerja"] == null
        ? null
        : DateTime.tryParse(json["tanggal_bekerja"]),
    tanggalKontrak: json["tanggal_kontrak"] == null
        ? null
        : DateTime.tryParse(json["tanggal_kontrak"]),
    tanggalMutasi: json["tanggal_mutasi"] == null
        ? null
        : DateTime.tryParse(json["tanggal_mutasi"]),
    tanggalKeluar: json["tanggal_keluar"] == null
        ? null
        : DateTime.tryParse(json["tanggal_keluar"]),
    jabatan: json["jabatan"],
    nomorSk: json["nomor_sk"],
    statusBekerja: json["status_bekerja"],
    kantor: json["kantor"],
    teleponRumah: json["telepon_rumah"],
    nomorHandphone: json["nomor_handphone"],
    nomorWhatsapp: json["nomor_whatsapp"],
    alamatEmail: json["alamat_email"],
    createdBy: json["created_by"],
    updatedBy: json["updated_by"],
    authorizedBy: json["authorized_by"],
    deletedBy: json["deleted_by"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.tryParse(json["updated_at"]),
    authorizedAt: json["authorized_at"],
    deletedAt: json["deleted_at"] == null
        ? null
        : DateTime.tryParse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "nomor_ktp": nomorKtp,
    "nomor_npwp": nomorNpwp,
    "nama_lengkap": namaLengkap,
    "jenis_kelamin": jenisKelamin,
    "tempat_lahir": tempatLahir,
    "tanggal_lahir": tanggalLahir != null
        ? "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}"
        : null,
    "alamat_lengkap": alamatLengkap,
    "kode_pos": kodePos,
    "status_perkawinan": statusPerkawinan,
    "jumlah_pasangan": jumlahPasangan,
    "jumlah_anak": jumlahAnak,
    "ibu_kandung": ibuKandung,
    "pendidikan_formal": pendidikanFormal,
    "jurusan_pendidikan_formal": jurusanPendidikanFormal,
    "pendidikan_nonformal_1": pendidikanNonformal1,
    "pendidikan_nonformal_2": pendidikanNonformal2,
    "pendidikan_nonformal_3": pendidikanNonformal3,
    "nomor_absen": nomorAbsen,
    "nomor_karyawan": nomorKaryawan,
    "nomor_cif": nomorCif,
    "tanggal_bekerja": tanggalBekerja != null
        ? "${tanggalBekerja!.year.toString().padLeft(4, '0')}-${tanggalBekerja!.month.toString().padLeft(2, '0')}-${tanggalBekerja!.day.toString().padLeft(2, '0')}"
        : null,
    "tanggal_kontrak": tanggalKontrak?.toIso8601String(),
    "tanggal_mutasi": tanggalMutasi?.toIso8601String(),
    "tanggal_keluar": tanggalKeluar?.toIso8601String(),
    "jabatan": jabatan,
    "nomor_sk": nomorSk,
    "status_bekerja": statusBekerja,
    "kantor": kantor,
    "telepon_rumah": teleponRumah,
    "nomor_handphone": nomorHandphone,
    "nomor_whatsapp": nomorWhatsapp,
    "alamat_email": alamatEmail,
    "created_by": createdBy,
    "updated_by": updatedBy,
    "authorized_by": authorizedBy,
    "deleted_by": deletedBy,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "authorized_at": authorizedAt,
    "deleted_at": deletedAt?.toIso8601String(),
  };
}

class Codes {
  final int? id;
  final int? userId;
  final String? alias;
  final String? kodeMso;
  final String? kodeKolektor;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;

  Codes({
    this.id,
    this.userId,
    this.alias,
    this.kodeMso,
    this.kodeKolektor,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Codes.fromJson(Map<String, dynamic> json) => Codes(
    id: json["id"],
    userId: json["user_id"],
    alias: json["alias"],
    kodeMso: json["kode_mso"],
    kodeKolektor: json["kode_kolektor"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.tryParse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.tryParse(json["updated_at"]),
    deletedAt: json["deleted_at"] == null
        ? null
        : DateTime.tryParse(json["deleted_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "alias": alias,
    "kode_mso": kodeMso,
    "kode_kolektor": kodeKolektor,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt?.toIso8601String(),
  };
}
