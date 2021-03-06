part of falling;

class Menu extends State{
  
  Menu(String name,[String nextState]):super(name,nextState);
  
  run(){
	  print("Menu:Running");
	  BitmapData backgroundBitmapData = new BitmapData(800, 600, false, mainColor);
	  Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
	  stage.addChild(backgroundBitmap);

	  //backgroundBitmap.bitmapData.fillRect(new Rectangle(0,0,800,600),color_rgb_int);

	  String titleText = "Falling";
	  TextFormat titleFormat = new TextFormat('Helvetica,Arial',28,0x232B2B,bold:true,italic:true);
	  TextField title = new TextField(titleText,titleFormat)
		  ..x = 350
		  ..y = 200;

	  stage.addChild(title);

	  String controlText = "Use the left(<-) and right(->) cursor for moving";
	  String pressSpaceText = "Press Space";
	  TextFormat controlFormat = new TextFormat('Helvetica,Arial',20,Color.Black,bold:true,italic:true);
	  TextField control = new TextField(controlText,controlFormat)
	    ..width = 600
		  ..x = 180
	    ..y = 400;
	  TextField pressSpace = new TextField(pressSpaceText,controlFormat)
	    ..width = 200
		  ..x = 350
	    ..y = 500;

		stage.addChild(control);
	  stage.addChild(pressSpace);


	  const spaceBar = 32;
	  stage.onKeyDown.listen((value){
			if(value.keyCode == spaceBar){
				stage.removeEventListeners("keyDown");
			  closeStream();
			}
	  });

  }
}