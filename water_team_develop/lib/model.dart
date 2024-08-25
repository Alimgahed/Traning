class VCode {
  int vCode;

  VCode({required this.vCode});

  // Create a VCode from JSON data
  factory VCode.fromJson(Map<String, dynamic> json) {
    return VCode(
      vCode: json['vCode'],
    );
  }

  // Convert a VCode to JSON data
  Map<String, dynamic> toJson() {
    return {
      'vCode': vCode,
    };
  }
}
