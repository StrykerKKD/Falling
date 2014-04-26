part of falling;

class Level1 extends State {
	Level1([String nextState]):super(nextState);

	run(){
		addMessage("Level1:Running");
		closeStream();
	}
}
