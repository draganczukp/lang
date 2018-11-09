package pl.draganczuk.lang.parser;

import pl.draganczuk.lang.command.Command;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Stack;
import java.util.stream.Stream;

public class Parser {
	private Path path;

	private ArrayList<Command> commands = new ArrayList<>();
	private Stack<Command> commandStack = new Stack<>();

	public static HashMap<String, Function> functions = new HashMap<>();

	public Parser(Path path) {
		this.path = path;
	}

	public Runnable parse() {
		try(Stream<String> lines = Files.lines(this.path)) {
			lines.forEachOrdered( line -> {



			});
		}catch (IOException e) {
			e.printStackTrace();
		}

		return () -> {
			commands.forEach(Command::run);
		};
	}
}

