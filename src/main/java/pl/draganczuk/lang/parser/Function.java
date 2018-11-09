package pl.draganczuk.lang.parser;

import pl.draganczuk.lang.command.Command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public abstract class Function extends Command {

	public static final HashMap<String, Function> functions = new HashMap<>();

	static {
		new Function("println", Type.types.get("void"), Type.types.get("any")){
			@Override
			public Object run(Object ...params) {
				for(var p : params){
					System.out.print(p);
				}
				System.out.println();
				return null;
			}
		};
	}

	private List<Type> paramTypes;
	private Type returnType;

	public Function(String command, Type returnType, Type ...params) {
		super(command);
		this.returnType = returnType;
		this.paramTypes = List.of(params);
	}


}
