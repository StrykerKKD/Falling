part of falling;

class Block extends AnimatedSprite{
	Block(BitmapData bitmapData,{vy:200,int x,int y:600}):super(bitmapData,vy:vy,x:x,y:y){
		scaleX=2.4;
		scaleY=2.4;
	}

	bool advanceTime(num time){
		if(y <= 0){
			stage.removeChild(this);
			stage.juggler.remove(this);
			alive = false;
		}
		y = y - vy * time;
	}

}
