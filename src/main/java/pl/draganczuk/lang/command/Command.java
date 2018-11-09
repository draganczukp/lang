package pl.draganczuk.lang.command;

public abstract class Command {
	private String command;

	public Command(String command){
		this.command = command;
	}

	public abstract Object run(Object... params);

	public String getCommand() {
		return command;
	}

	public Command setCommand(String command) {
		this.command = command;
		return this;
	}
}
