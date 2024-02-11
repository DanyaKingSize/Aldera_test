class DataModel {
  final String title;
  final String subTitle;
  final String image;
  final String date;
  final String id;
  final String center;
  final List<String>? keyWord;

  DataModel({
    required this.title,
    required this.center,
    required this.date,
    required this.id,
    required this.image,
    required this.keyWord,
    required this.subTitle,
  });
}
