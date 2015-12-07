class Ball
{
  PVector pos;
  float ballSize;
  float ballRadius;
  float prevPos;
  float ySpeed;
  color c;
  
  //using default constructor
  /*
  Ball()
  {
    pos = new PVector(0, 0);
    ballSize = 0.0f;
    ballRadius = 0.0f;
  }
  */
  
  //using parameterised constructor
  Ball(float x, float y, color c)
  {
    pos = new PVector(x, y);
    this.c = c;
    ballSize = 25.0f;
    ballRadius = ballSize * 0.5f;
    ySpeed = 1.0f;
    prevPos = pos.y;
 
  }
 
  void render()
  {
    stroke(c);
    fill(c);
    ellipse(pos.x, pos.y, ballSize, ballSize);

  }
  
  void update()
  {
    ySpeed += 0.8f;
    pos.y +=  ySpeed;
  }
  
    
  
}
  
  
