void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  loadData();
  toggled = false;
  mode = 0;
  ballSize = 60.0f;
  ballRadius = ballSize / 2;
  ballX = width * 0.45f ;
  ballY = height * 0.15f;
  top = ballY + ballRadius;
  left = width * 0.34f;
  dirX = 5;
  dirY = 3;
  
  println(ballX);
  println(ballY);
}

//Declare Global Arraylists
ArrayList<Country> countries = new ArrayList<Country>();
ArrayList<Float> nbaData = new ArrayList<Float>();
ArrayList<Player> players = new ArrayList<Player>();

//variables needed to draw the basketball
float ballSize;
float ballRadius;
float ballX;
float ballY;
float dirX;
float dirY;

//variables for the base 
float top;
float left;

boolean toggled;
int mode;

void loadData()
{
  String[] no_lines  = loadStrings("nba.csv");
  String[] line = loadStrings("year.csv");
  String[] lists = loadStrings("roster.txt");
  
  for(int i = 0; i < no_lines.length; i++)
  {
    Country country = new Country(no_lines[i]);
    countries.add(country);
  }
  
  for(int i = 0; i < lists.length; i++)
  {
    Player player = new Player(lists[i]);
    players.add(player);
  }
  
  //Add and convert data into nbaData  
  for(String l:line)
  {
    float s = Float.parseFloat(l);
    nbaData.add(s);
  }
}

float sBallX = 0;
float sBallY = 330;
float sBallSize = 30;
float sBallRadius = 30 * 0.5f;



void draw()
{
  background(0);
  drawTrophy();
  text("1.Display the rise of international players over the years",20, 270); 
  text("2.Display the amount international players currently playing", 20, 300);
  ellipse(sBallX, sBallY, sBallSize, sBallSize);
  
  sBallX += dirX;
  sBallY += dirY;
  
  if(sBallX > (width - sBallRadius))
  {
    sBallX = 0;
    sBallY = 330;
    dirY = -dirY;
  }
  
  if(sBallY > height - sBallRadius)
  {
    dirY = - dirY;
  }
  
  
 
 /*
  if(toggled)
  {
    background(255);
    stroke(240, 85, 7);
    ellipse(ballX, ballY, ballSize, ballSize);
    
    //line(ballX, ballY - ballRadius, ballX, ballY + ballRadius);
    //line(ballX - ballRadius, ballY, ballX + ballRadius, ballY);
  }
  */
}
    



void drawTrophy()
{
  stroke(255);
  //fill(240, 85, 7);
  //draw ball
  ellipse(ballX, ballY, ballSize, ballSize);
  /*
  line(ballX, ballY - ballRadius, ballX, ballY + ballRadius);
  line(ballX - ballRadius, ballY, ballX + ballRadius, ballY);
  */
  
  //draw the trophy
  float centNet = ballX - ballRadius;
  float base= width * 0.45f;
  stroke(255);
  line(left, top, ballX, top);
  line(left, top, centNet, base);
  line(centNet, base, centNet + 25, base); 
  line(ballX + 10, top, centNet + 25, base);
  rect(left - 10, base, 93, 10);
}

void mousePressed()
{
  if(mouseX > ballX - ballRadius && mouseX < ballX + ballRadius && mouseY > ballY - ballRadius && mouseY < ballY + ballRadius)
  {
    toggled = ! toggled;
  }
  
}

