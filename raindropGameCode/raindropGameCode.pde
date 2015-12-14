PVector mouse;

ArrayList<Raindrop> drops;

int time;

void setup() {
  size(640, 480);
  
  mouse = new PVector();
  
  drops = new ArrayList();
  drops.add(new Raindrop());
  
  time  = 0;
}

void draw() {
  background(0, 200, 255);
  
  mouse.set(mouseX, mouseY);
  
  for(Raindrop r : drops){
    r.fall();
    r.display();
    
    if (r.isInContactWith(mouse))
      r.reset();
    if (r.loc.y > height + r.radius) 
      r.reset();
  }
  
  time++;
  
  if(time >= 500){
     drops.add(new Raindrop()); 
     time = 0;
  }
}