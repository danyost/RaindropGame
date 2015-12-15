ArrayList<Raindrop> drops;

Bucket bucket;

int time;

boolean game_over;

void setup(){
  size(480, 800);
  
  background(0, 200, 255);
  
  noStroke();
  
  textSize(32);
  
  drops = new ArrayList();
  drops.add(new Raindrop());
  
  bucket = new Bucket(50);
  
  time = 0;
  
  game_over = false;
}

void draw(){
  if(game_over) return;
  
  time++;
  
  if(time % 500 == 0 && !game_over)
     drops.add(new Raindrop());
     
  
  fill(255, 255, 255, 200);
  text(time, 0, 32);
  
  fill(0, 200, 255, 100);
  rect(0, 0, width, height);
  
  bucket.moveToMouse();
  bucket.display();
  
  for(Raindrop r : drops){
    r.fall();
    r.display();
    
    if (r.isInContactWith(bucket))
      r.reset();
    if (r.loc.y > height + r.radius) {
      r.reset();
      
      game_over = true;
      
      fill(255, 255, 255, 200);
      text("GAME OVER", 296, 32);
    }
  }
}