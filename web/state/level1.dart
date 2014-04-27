part of falling;

class Level1 extends State {
	Level1([String nextState]):super(nextState);

	run(){
		addMessage("Level1:Running");

		BitmapData backgroundBitmapData = new BitmapData(800, 600, false, 0xA0785A);
		Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
		stage.addChild(backgroundBitmap);

		Player player = new Player(resourceManager.getBitmapData("player"));
		stage.addChild(player);
		stage.juggler.add(player);


		List<Block> blockList = new List<Block>();
		for(var i=0;i < 2;i++){
			blockList.add(new Block(resourceManager.getBitmapData("part1Block")));
			blockList.add(new Block(resourceManager.getBitmapData("part2Block")));
			blockList.add(new Block(resourceManager.getBitmapData("part3Block")));
		}

		Random random = new Random();
		Block block;
		List<Block> deadBlockList = new List<Block>();
		Timer timer = new Timer.periodic(new Duration(seconds:2),(_){
			deadBlockList.addAll(blockList.where((value)=>!value.alive));

			block = deadBlockList[random.nextInt(deadBlockList.length)]
			..x = random.nextInt(800)
			..y = 600
			..alive = true;
			stage.addChild(block);
			stage.juggler.add(block);
			deadBlockList.clear();

		});



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

		List<Block> aliveBlockList = new List<Block>();
		stage.onEnterFrame.listen((_){
			aliveBlockList.addAll(blockList.where((value)=>value.alive));

			aliveBlockList.forEach((block){
				if(player.hitTestObject(block)){
					stage..removeEventListeners("enterFrame")
						..removeEventListeners("keyDown")
						..removeEventListeners("keyUp");
					timer.cancel();

					closeStream();
				}
			});
		});

	}


}
