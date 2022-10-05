import java.util.ArrayList;

class ArrList {
  ArrayList<String> list;
  int x;

  ArrList(ArrayList<String> list, int x) {
    this.list = list;
    this.x = x;
  }
}

class ArrCycle {
  ArrayList<ArrCycle> cyc;
  String s;

  ArrCycle(ArrayList<ArrCycle> cyc, String s) {
    this.cyc = cyc;
    this.s = s;
  }
}

class ExamplesArrList {
  ArrList c = new ArrList(new ArrayList<>(Arrays.asList("a", "abs", "dfs")), 1);
}