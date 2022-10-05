import java.util.ArrayList;

class BetterToString {
  public static <T> String make(T obj) {
    if (obj instanceof String) {
      return BetterToString.handleString((String) obj);
    }
    else if (obj instanceof ArrayList) {
      return BetterToString.handleArrayList((ArrayList<?>) obj);
    }
    else {
      return obj.toString();
    }
  }

  private static String handleString(String s) {
    String buffer = "";
    char[] chars = s.toCharArray();
    for (char c : chars) {
      switch (c) {
      case '\t':
        buffer += "\\" + "t";
        break;
      case '\b':
        buffer += "\\" + "b";
        break;
      case '\n':
        buffer += "\\" + "n";
        break;
      case '\r':
        buffer += "\\" + "r";
        break;
      case '\f':
        buffer += "\\" + "f";
        break;
      case '\'':
      case '\"':
      case '\\':
        buffer += "\\" + c;
        break;
      default:
        buffer += c;
        break;
      }
    }
    return "\"" + buffer + "\"";
  }

  private static <T> String handleArrayList(ArrayList<T> arr) {
    String prelude = "new ArrayList<>(Arrays.asList(";
    String postlude = "))";
    String buffer = "" + prelude;

    for (int i = 0; i < arr.size(); i += 1) {
      buffer += BetterToString.make(arr.get(i));
      if (i != arr.size() - 1) {
        buffer += ", ";
      }
    }

    buffer += postlude;
    return buffer;
  }
}
