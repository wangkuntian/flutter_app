class Section {
  Section();

  Section.init(String section, String url, String page) {
    this.section = section;
    this.url = url;
    this.page = page;
  }

  String page;
  String section;
  String url;
}
