ArrayList<Raindrop> drops;

Bucket bucket;

int time;

boolean game_over;
boolean levl_over;

int levl_num;

void setup(){
  size(480, 800);
  
  background(0, 200, 255);
  
  noStroke();
  
  textSize(32);
  
  drops = new ArrayList();
  drops.add(new Raindrop());
  
  bucket = new Bucket(50);
  
  time = 0;
  levl_num = 1;
  
  game_over = false;
  levl_over = false;
}

void draw(){
  if(game_over)
    return;
  
  time++;
  
  if(time % 700 == 0 && !game_over)
     drops.add(new Raindrop());  
  
  fill(0, 200, 255, 200);
  rect(0, 0, width, height);
  
  float water_height = time/2.0f;
  
  if(water_height >= height/2 && levl_over == false){
    levl_over = true;
    levl_num++;
  }
  else if(water_height == 0)
    levl_over = false;
    
  if(levl_over == true){
    time -= 4;
    
    if(water_height <= 0)
      levl_over = false;
  }
  
  fill(255, 255, 255, 250);
  text("LEVEL " + levl_num, width/2, height-water_height-32);
    
  
  fill(255, 255, 255, 250);
  rect(0, height-water_height, width, height);
  
  fill(255, 255, 255, 250);
  text(time, 0, 32);
  
  bucket.moveToMouse();
  bucket.display();
  
  for(Raindrop r : drops){
    r.fall();
    r.display();
    
    if (r.isInContactWith(bucket))
      r.reset();
    if (r.loc.y > height + r.radius - water_height) {
      r.reset();
      
      game_over = true;
      
      fill(255, 255, 255, 250);
      text("GAME OVER", 296, 32);
    }
  }
}

void keyPressed(){
  if(game_over) setup();
}