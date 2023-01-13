extension Capitalize on String {
  String capitalize() {
    List<String> splitName = split(' ');

    splitName = splitName.map<String>((element) {
      if (element.length > 2) {
        element =
            "${element[0].toUpperCase()}${element.substring(1).toLowerCase()}";
      }
      return element;
    }).toList();

    return splitName.join(" ");
  }
}

class Utils {}
