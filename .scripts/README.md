# Explaination Of Scripts

## ResoucreList.java

`ResourceList.java` prints all available resources in java's classpath (as specified by $CLASSPATH) to the terminal. If a resource is specified as `org/junit/runner/JUnitCore`, it'll be accessible as `import org.junit.runner.JUnitCore`. 

## run_junit.sh

`run_junit.sh` compiles a java project, then tests it using JUnit. It also outputs a cumulative `.jar`, a file, `sources.txt`, which contains all java files compiled, and a `manifest.txt`. It expects a certain filestructure, as specified as the following:

```
.
`-- src
    |-- main
    |   `-- Main.java
    |-- run_junit.sh
    `-- test
        `-- MainTest.java
```

`run_junit.sh` takes one argument pointing to the testing file. In this case, we'd write `./run_junit.sh test.MainTest`. 

### Testing and Main examples
`MainTest.java` example:

```python=
package test;

import main.Main;

import org.junit.Assert;
import org.junit.Test;

public class MainTest {
    @Test
    public void testsquare() {
        int n = 12;
        int sq = Main.squareIt(n);
        Assert.assertEquals(sq, n * n);
        System.out.println("n = " + n + " sq = " + sq);
    }
}
```

`Main.java` example:

```python=
package main;

import java.io.*;
import java.util.*;

public class Main {
    public static int squareIt(int n) {
        return n * n;
    }
}
```

Notice the package specifications, and the import statement in `MainTest.java`. It's important to manage these correctly for java to successfully compile.

