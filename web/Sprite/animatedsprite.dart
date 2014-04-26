part of falling;

abstract class AnimatedSprite extends Bitmap implements Animatable{
	num vx,vy;
	bool alive = false;

	AnimatedSprite(BitmapData bitmapData,{int vx,int vy,int x,int y}):super(bitmapData) {
		pivotX = bitmapData.width / 2;
		pivotY = bitmapData.height / 2;
		this.x = x;
		this.y = y;
		this.vx = vx;
		this.vy = vy;
	}
	
}
