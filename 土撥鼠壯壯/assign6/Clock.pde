class Clock extends Item {

	void display(){

		if(!alive) return;

		image(clock, x, y);

	}

	void checkCollision(Player player){

		if(!alive) return;

		if(isHit(x, y, w, h, player.x, player.y, player.w, player.h)){
			addTime(CLOCK_BONUS_SECONDS);
			alive = false;
		}

	}

	Clock(float x, float y){
		super(x, y);
	}
}