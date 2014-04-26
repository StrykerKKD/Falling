part of falling;

class Init extends State{
  Init([String nextState]):super(nextState);

  run(){
	  addMessage("Init:Running");
	  closeStream();
  }
}