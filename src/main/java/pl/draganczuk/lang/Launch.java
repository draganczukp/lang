package pl.draganczuk.lang;

import pl.draganczuk.lang.parser.Parser;

import java.nio.file.Path;
import java.nio.file.Paths;

public class Launch {

    public static void main(String[] args) {
        String fileName = args.length > 0 ? args[0] : "/home/killermenpl/dev/lang/test";

        Path path = Paths.get(fileName);

        var parser = new Parser(path);

        parser.parse().run();
    }
}
