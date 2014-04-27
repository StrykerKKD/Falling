part of falling;

class Init extends State{
  Init(String name,[String nextState]):super(name,nextState);

  run(){
	  print("Init:Running");
	  
	  BitmapData backgroundBitmapData = new BitmapData(800, 600, false, 0xC9FFE5);
	  Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
    stage.addChild(backgroundBitmap);

	  String loadingText = "loading";
	  TextFormat loadingFormat = new TextFormat('Helvetica,Arial',28,0x5D8AA8,bold:true,italic:true);
	  TextField loading = new TextField(loadingText,loadingFormat)
		  ..x = 400
	    ..y = 300;
	  stage.addChild(loading);

	  resourceManager..addBitmapData("player","images/ball/player64x64.png")
	    ..addBitmapData("point","images/ball/greenBall64x64.png")
	    ..addBitmapData("trap","images/ball/redBall64x64.png")
	    ..addBitmapData("life","images/ball/greenBall32x32.png")
	    ..addBitmapData("part1Block","images/block/sprite_1.png")
		  ..addBitmapData("part2Block","images/block/sprite_2.png")
		  ..addBitmapData("part3Block","images/block/sprite_3.png")
		  ..addBitmapData("supriseBlock","images/block/sprite_4.png");

		resourceManager.load().then((_){closeStream();});
  }
}