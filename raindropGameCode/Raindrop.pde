class Raindrop{
  PVector loc, vel;
  float radius;
  
  Raindrop(){
    reset();
  }
  
  void fall(){
    vel.y += 0.098f;
    loc.add(vel);
  }
  
  void display(){
    noStroke();
    fill(255, 255, 255, 100);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
  
  void reset(){
    radius = random(40, 50);
    
    loc = new PVector(random(width), - radius);
    
    vel = new PVector(0, 2);
  }
  
  boolean isInContactWith(PVector point){
    if(point.dist(loc) < radius)
      return true;
    else
      return false;
  }
}