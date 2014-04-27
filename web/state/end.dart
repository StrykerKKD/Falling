part of falling;

class End extends State {
	End(String name,[String nextState]):super(name,nextState);

	run(){
		print("End: The End");

		BitmapData backgroundBitmapData = new BitmapData(800, 600, false, mainColor);
		Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
		stage.addChild(backgroundBitmap);


		String pressSpaceText = "Press Space";
		TextFormat controlFormat = new TextFormat('Helvetica,Arial',20,Color.Black,bold:true,italic:true);
		TextField pressSpace = new TextField(pressSpaceText,controlFormat)
			..width = 200
			..x = 350
			..y = 500;

		stage.addChild(pressSpace);

		const spaceBar = 32;
		stage.onKeyDown.listen((value){
			if(value.keyCode == spaceBar){
				stage.removeEventListeners("keyDown");
				pauseStream();
			}
		});

		//closeStream();
	}
}
