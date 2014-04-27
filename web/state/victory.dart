part of falling;

class Victory extends State {
	Victory(String name,[String nextState]):super(name,nextState);

	run(){
		print("Victory");

		BitmapData backgroundBitmapData = new BitmapData(800, 600, false, mainColor);
		Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
		stage.addChild(backgroundBitmap);

		String theEndText = "The End";
		String over9000Text = "IT'S OVER 9000";
		String easterEggText = "Easter Egg";

		TextFormat theEndTextFormat = new TextFormat('Helvetica,Arial',48,Color.Black,bold:true,italic:true);
		TextFormat over9000TextFormat = new TextFormat('Helvetica,Arial',36,Color.Red,bold:true,italic:true);
		TextFormat easterEggTextFormat = new TextFormat('Helvetica,Arial',20,Color.Black,bold:true,italic:true);


		TextField theEndTextField = new TextField(theEndText,theEndTextFormat)
			..width = 400
			..x = 260
			..y = 125;
		TextField over9000TextField = new TextField(over9000Text,over9000TextFormat)
			..width = 400
			..x = 260
			..y = 300;
		TextField easterEggTextField = new TextField(easterEggText,easterEggTextFormat)
			..width = 400
			..x = 350
			..y = 400;

		stage.addChild(theEndTextField);
		stage.addChild(over9000TextField);
		stage.addChild(easterEggTextField);

		Block block = new Block(resourceManager.getBitmapData("supriseBlock"),x:400,y:500)..scaleX=2.8..scaleY=2.8;
		stage.addChild(block);

	}
}
