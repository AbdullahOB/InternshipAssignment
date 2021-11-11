final String HistoryTable = 'history';

class WinHistoryFields {
  static final List<String> values = [id, prizeName, winDate];
  static final String id = '_id';
  static final String prizeName = 'prizeName';
  static final String winDate = 'winDate';
}

class WinHistory {
  final int? id;
  final String? prizeName;
  final DateTime? winDate;

  const WinHistory({
    this.id,
    required this.prizeName,
    required this.winDate,
  });

  WinHistory copy({
    int? id,
    String? prizeName,
    DateTime? winDate,
  }) =>
      WinHistory(
        id: id ?? this.id,
        prizeName: prizeName ?? this.prizeName,
        winDate: winDate ?? this.winDate,
      );
  static WinHistory fromJson(Map<String, Object?> json) => WinHistory(
      id: json[WinHistoryFields.id] as int?,
      prizeName: json[WinHistoryFields.prizeName] as String?,
      winDate: DateTime.parse(json[WinHistoryFields.winDate] as String));
  Map<String, Object?> toJson() => {
        WinHistoryFields.id: id,
        WinHistoryFields.prizeName: prizeName,
        WinHistoryFields.winDate: winDate!.toIso8601String(),
      };
}
