// to represent a list of strings in a document
interface ILoString {
  // to return the length of the list
  int length();

  // to return the string in the list at the given index if exists, else throws
  String getAt(int index);

  ILoString toUpperCase();
}

// to represent an empty list of strings in a document
class MtLoString implements ILoString {

  // to return the length of the list
  // an empty list has length zero
  public int length() {
    return 0;
  }

  // to return the string in the list at the given index if exists, else throws
  public String getAt(int index) {
    throw new IndexOutOfBoundsException("Index out of bounds.");
  }

  public ILoString toUpperCase() {
    return this;
  }
}

// to represent a non-empty list of strings in a document
class ConsLoString implements ILoString {
  String first;
  ILoString rest;

  // to construct a non-empty list of strings
  ConsLoString(String first, ILoString rest) {
    // checks if the given string would be valid for a trigram word
    this.first = first;
    this.rest = rest;
  }

  // to return the length of the list
  // an empty list has length zero
  public int length() {
    return 1 + rest.length();
  }

  // to return the string in the list at the given index if exists, else throws
  public String getAt(int index) {
    if (index == 0) {
      return this.first;
    }
    else {
      return this.rest.getAt(index - 1);
    }
  }

  public ILoString toUpperCase() {
    return new ConsLoString(first.toUpperCase(), this.rest.toUpperCase());
  }

}
