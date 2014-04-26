part of falling;

class Player extends Bitmap implements Animatable{
	num _vx;
	bool movingLeft = false;
  bool movingRight = false;
  
  Player(BitmapData bitmapData,[this._vx = 150]):super(bitmapData) {
	  pivotX = bitmapData.width / 2;
    pivotY = bitmapData.height / 2;
	  x = 400;
	  y = 75;
	}
	
	bool advanceTime(num time){
	  if(movingLeft){
      x = x - _vx * time;
    }else if(movingRight){
      x = x + _vx * time;
    }  
	}
}
