part of falling;

class Block extends AnimatedSprite{
	Block(BitmapData bitmapData,{vy:300,int x,int y:600}):super(bitmapData,vy:vy,x:x,y:y){
		scaleX=2.2;
		scaleY=2.2;
	}

	bool advanceTime(num time){
		if(y <= -width){
			stage.removeChild(this);
			stage.juggler.remove(this);
			alive = false;
		}
		y = y - vy * time;
	}

}
