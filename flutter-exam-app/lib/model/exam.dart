class ExAm {
  String? id;
  String? examText;
  String? date;

  ExAm({required this.id, required this.examText, required this.date});

  static List<ExAm> examList() {
    return [
      ExAm(
          id: '01',
          examText: 'Mobilni informaciski sistemi',
          date: "2022-02-21 14:18:04Z"),
    ];
  }
}
