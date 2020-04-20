import "section.dart";

class Chapter {
  Chapter();

  Chapter.init(String chapter) {
    this.chapter = chapter;
    this.sections = [];
  }

  String chapter;
  double font;
  List<Section> sections;
}
