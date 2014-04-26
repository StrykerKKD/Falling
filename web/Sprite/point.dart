part of falling;

class Point extends AnimatedSprite{

	Point(BitmapData bitmapData,{vy:150}):super(bitmapData,vy:vy);

	bool advanceTime(num time){
		if(y <= height){
			stage.removeChild(this);
			stage.juggler.remove(this);
			alive = false;
		}
		y = y - vy * time;
	}
}
