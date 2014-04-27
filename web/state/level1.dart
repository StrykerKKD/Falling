part of falling;

class Level1 extends State {
	Level1(String name,[String nextState]):super(name,nextState);

	run(){
		print("Level1:Running");

		BitmapData backgroundBitmapData = new BitmapData(800, 600, false, 0xFFFFFF);
		Bitmap backgroundBitmap = new Bitmap(backgroundBitmapData);
		stage.addChild(backgroundBitmap);










		int coloRed = 255;
		int coloGreen = 255;
		int colorBlue = 255;

		Rectangle rect = new Rectangle(0,0,800,600);
		new Timer.periodic(new Duration(seconds:0.14),(_){
			String a_hex_str   = 255.toRadixString(16); // 255 is ff, or fully opaque
			String r_hex_str   = coloRed.toRadixString(16);
			String g_hex_str   = coloGreen.toRadixString(16);
			String b_hex_str   = colorBlue.toRadixString(16);
			String rgb_hex_str = '0x$a_hex_str$r_hex_str$g_hex_str$b_hex_str';

			int color_rgb_int = int.parse(rgb_hex_str);

			backgroundBitmap.bitmapData.fillRect(rect,color_rgb_int);

			coloRed-=1;
			coloGreen-=1;
			colorBlue-=1;
		});

		int score = 0;
		String scoreTitle = "Score:";
		String scoreText = "$score";
		TextFormat textFormat = new TextFormat('Helvetica,Arial',28,0x232B2B,bold:true,italic:true);
		TextField titleTextField = new TextField(scoreTitle,textFormat)
			..x = 10
			..y = 10;
		TextField scoreTextField = new TextField(scoreText,textFormat)
			..x = 100
			..y = 10;
		stage.addChild(titleTextField);
		stage.addChild(scoreTextField);

		Timer scoreTimer = new Timer.periodic(new Duration(seconds:0.5),
			(_){ score+=150; scoreTextField.text="$score"; });

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
		int xCoorBlock;
		int randomNumber;
		Timer timer = new Timer.periodic(new Duration(seconds:1),(_){
			deadBlockList.addAll(blockList.where((value)=>!value.alive));

			randomNumber = random.nextInt(700);
			if(randomNumber <= 64){
				xCoorBlock = randomNumber + 100;
			}else{
				xCoorBlock = randomNumber;
			}

			block = deadBlockList[random.nextInt(deadBlockList.length)]
			..x = xCoorBlock
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
		num i = 0;
		List<Block> aliveBlockList = new List<Block>();

		stage.onEnterFrame.listen((_){

			if(score > 9000){
				stage..removeEventListeners("enterFrame")
					..removeEventListeners("keyDown")
					..removeEventListeners("keyUp");
				timer.cancel();
				scoreTimer.cancel();

				nextState = "victory";
				closeStream();
			}


			aliveBlockList.addAll(blockList.where((value)=>value.alive));

			aliveBlockList.forEach((block){
				if(player.hitTestObject(block)){
					stage..removeEventListeners("enterFrame")
						..removeEventListeners("keyDown")
						..removeEventListeners("keyUp");
					timer.cancel();
					scoreTimer.cancel();

					//closeStream();
					if(i==0){
						pauseStream();
					}
					i++;
				}
			});
		});

	}


}
