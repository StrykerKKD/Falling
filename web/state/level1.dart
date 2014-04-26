part of falling;

class Level1 extends State {
	Level1([String nextState]):super(nextState);

	run(){
		addMessage("Level1:Running");

		BitmapData backgroundBitmapData = new BitmapData(800, 600, false, 0xC9FFE5);
		Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
		stage.addChild(backgroundBitmap);

		Player player = new Player(resourceManager.getBitmapData("player"));
		stage.addChild(player);
		stage.juggler.add(player);

		const leftArrow = 37;
		const rightArrow = 39;

		stage.onKeyDown.listen((value){
			switch(value.keyCode){
				case leftArrow:
					player.movingLeft = true;
					break;
				case rightArrow:
					player.movingRight = true;
					break;
			}
		});

		stage.onKeyUp.listen((value){

			switch(value.keyCode){
				case leftArrow:
					player.movingLeft = false;
					break;
				case rightArrow:
					player.movingRight = false;
					break;
			}

		});
		//closeStream();
	}
}
