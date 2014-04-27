part of falling;

class End extends State {
	End([String nextState]):super(nextState);

	run(){
		addMessage("End: The End");
		//closeStream();
	}
}
