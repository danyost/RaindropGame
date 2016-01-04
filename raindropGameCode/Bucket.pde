class Bucket{
  PVector pos;
  
  float radius;
  
  Bucket(float radius){
    pos = new PVector();
    
    this.radius = radius;
  }
  
  void moveToMouse(){
    pos.x -= (pos.x - mouseX)*0.5f;
    pos.y -= (pos.y - mouseY)*0.5f;
  }
  
  void display(){
    translate(0, radius/2);
    
    fill(255, 255, 255, 255);
    
    rect(pos.x - radius, pos.y - radius*2, radius*2, radius*2);
    ellipse(pos.x, pos.y, radius*2, radius);
    
    resetMatrix();
  }
}