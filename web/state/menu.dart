part of falling;

class Menu extends State{
  
  Menu([String nextState]):super(nextState);
  
  run(){
	  addMessage("Menu:Running");
    closeStream();
  }
}