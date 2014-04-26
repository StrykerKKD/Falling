part of falling;

class Init extends State{
  Init([String nextState]):super(nextState);

  run(){
	  addMessage("Init:Running");
	  
	  BitmapData backgroundBitmapData = new BitmapData(800, 600, false, 0xC9FFE5);
	  Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
    stage.addChild(backgroundBitmap);

	  String loadingText = "loading";
	  TextFormat loadingFormat = new TextFormat('Helvetica,Arial',28,0x5D8AA8,bold:true,italic:true);
	  TextField loading = new TextField(loadingText,loadingFormat)
		  ..x = 400
	    ..y = 300;
	  stage.addChild(loading);

	  resourceManager..addBitmapData("player","images/player64x64.png")
	    ..addBitmapData("point","images/greenBall64x64.png")
	    ..addBitmapData("trap","images/redBall64x64.png")
	    ..addBitmapData("life","images/greenBall32x32.png");


		resourceManager.load().then((_){closeStream();});
	  //closeStream();
  }
}