class Raindrop{
  PVector loc, vel;
  float radius;
  
  Raindrop(){
    reset();
  }
  
  void fall(){
    radius += (40-radius)*0.01f;
    
    vel.y += 0.098f;
    
    loc.add(vel);
  }
  
  void display(){
    fill(255, 255, 255, 250);
    ellipse(loc.x, loc.y, radius*2, radius*2);
  }
  
  void reset(){
    radius = 10;
    
    loc = new PVector(random(width), -radius);
    
    vel = new PVector(0, 2);
  }
  
  boolean isInContactWith(Bucket bucket){
    if(bucket.pos.dist(loc) < radius + bucket.radius)
      return true;
    else
      return false;
  }
}