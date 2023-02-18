import 'dart:io';

Map<String, String> classes = {
  "center": ".center {display: grid;place-items: center;align-items: center;justify-items: center;align-content: center;justify-content: center;text-align: center;margin: auto}",
  "a" : "= c^2",
};

void main(List<String> args) {
  if (args.length != 1) {
    print("ERROR: Invalid number of arguments");
    print("USAGE: ccss <file>");
    exit(1);
  }

  if (!File(args[0]).existsSync()) {
    print("ERROR: File does not exist in in the current working directory.");
    exit(1);
  }

  String source;

  try {
    source = File(args[0]).readAsStringSync();
  } catch (e) {
    print("ERROR: Could not read file.");
    exit(1);
  }

  if (source.trim() == '') print('ERROR: Empty file.');

  List<String> chars = source.split('');
  List<String> result = [];
  int line = 1;

  for (int i = 0; i < chars.length; i++) {
    if (chars[i] == '\n')
      line++;
    else if (chars[i] == '"') {
      List<String> string = [];
      i++;
      while (chars[i] != '"') {
        if (i == chars.length - 1) {
          print('ERROR in line $line: Unterminated string.');
          exit(1);
        }
        string.add(chars[i]);
        i++;
      }
      result.add(string.join());
    }
  }

  List<String> CSSResult = [];
  for (String string in result) {
    List<String> words = string.trim().split(' ');
    for (String word in words) {
      if (classes.containsKey(word)) {
        CSSResult.add(classes[word]!);
        break;
      }
    }
  }
  if (CSSResult.length != 0)
    File('style.css').writeAsStringSync(CSSResult.join('\n'));
}
