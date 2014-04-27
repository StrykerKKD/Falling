part of falling;

class Player extends AnimatedSprite{
	bool movingLeft = false;
  bool movingRight = false;
  
  Player(BitmapData bitmapData,{int vx:250}):super(bitmapData,vx:vx,x:400,y:75);
	
	bool advanceTime(num time){
	  if(movingLeft && x > width/2){
      x = x - vx * time;
    }else if(movingRight && (800-width/2) > x){
      x = x + vx * time;
    }  
	}
}
