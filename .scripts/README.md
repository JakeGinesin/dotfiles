# Explaination Of Scripts

## ResoucreList.java

`ResourceList.java` prints all available resources in java's classpath (as specified by $CLASSPATH) to the terminal. If a resource is specified as `org/junit/runner/JUnitCore`, it'll be accessible as `import org.junit.runner.JUnitCore`. 

## run_junit.sh

`run_junit.sh` compiles a java project, then tests it using JUnit. It also outputs a cumulative `.jar` and a file, `sources.txt`, which contains all java files compiled. It expects a certain filestructure, as specified as the following:

```
.
`-- src
    |-- main
    |   `-- java
    |       `-- Main.java
    |-- manifest.txt
    |-- run_junit.sh
    `-- test
        `-- java
            `-- MainTest.java
```

`run_junit.sh` takes one argument pointing to the testing file. In this case, we'd write `./run_junit.sh test.java.MainTest`. 

`manifest.txt` is required; the content directs java to the main class, which is the testing class in this case. Its content is the following:

```
Main-Class: test.java.MainTest
```

### Testing and Main examples
`MainTest.java` example:

```python=
package test.java;

import main.java.Main;

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
package main.java;

import java.io.*;
import java.util.*;

public class Main {
    public static int squareIt(int n) {
        return n * n;
    }
}
```

Notice the package specifications, and the import statement in `MainTest.java`. It's important to manage these correctly.

