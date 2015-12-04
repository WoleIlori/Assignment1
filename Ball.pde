class Ball
{
  PVector pos;
  float ballSize;
  float ballRadius;
  color c;
  
  //using default constructor
  Ball()
  {
    pos = new PVector(0, 0);
    ballSize = 0.0f;
    ballRadius = 0.0f;
  }
  
  //using parameterised constructor
  Ball(float x, float y, color c)
  {
    pos = new PVector(x, y);
    ballSize = 25.0f;
    ballRadius = ballSize * 0.5f;
    this.c = c;
  }
 
  void render()
  {
    stroke(c);
    fill(c);
    ellipse(pos.x, pos.y, ballSize, ballSize);
  }
  
  //void update()
  
  
}
  
  
