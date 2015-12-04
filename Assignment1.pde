void setup()
{
  size(500, 500);
  background(0);
  stroke(255);
  centX = width / 2;
  centY = height / 2;
  ballIndex = 0;
  check = 0;
  toggled = false;
  animate = false;
  border = width * 0.1f; 
  windowRange = width - (border * 2.0f);  
  loadData();
  sumPlayers();
  maxIndex();
}

//Declare Global Arraylists
ArrayList<Country> countries = new ArrayList<Country>();
ArrayList<Data> data  = new ArrayList<Data>();
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Ball> balls = new ArrayList<Ball>();




boolean toggled;
boolean animate;
int mode = 1;
float centX, centY; 
int storeIndex = 0;
int ballIndex;
int check;
float border;
float windowRange;

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
  
  for(String l:line)
  {
    Data s = new Data(l);
    data.add(s);
  }
}

//finding the sum of current international players
float sumPlayers()
{
  float sum = 0;
  for(int i= 0; i < countries.size(); i ++)
  {
    sum = sum + countries.get(i).noPlayers;
  }
  return sum;
}

int maxIndex()
{
  float maxPlayers = countries.get(0).noPlayers;
  int maxIndex = 0;
  for(int i = 0; i < countries.size(); i++)
  {
    if(countries.get(i).noPlayers > maxPlayers)
    {
      maxPlayers = countries.get(i).noPlayers;
      maxIndex = i;
    }
  }
  println(maxPlayers, countries.get(maxIndex).country);
  return maxIndex;
}

void draw()
{
  background(0);
  float lineWidth = width / data.size();
  switch(mode)
  {
    case 1:
    { 
      check = 1;
      if(animate)
      {
        drawAxis(11, 110);
        for(int i = 0; i < data.size() - 1; i ++)
        {
          float linex1 = map(i, 0, data.size(), border, border + windowRange);
          float linex2 = map(i + 1, 0, data.size(), border, border + windowRange);
          float liney1 = map(data.get(i).noPlayer, 0, 110, height - border, (height - border) - windowRange);
          float liney2 = map(data.get(i + 1).noPlayer, 0, 110, height - border, (height - border) - windowRange);
          line(linex1, liney1, linex2, liney2);
        }
        
        for(int i = 0; i < data.size(); i ++)
        {
          balls.get(i).render();
      
          if(i == ballIndex)
          {
            balls.get(i).c = 255;
            println(balls.get(i).pos.y, i);
          }
          else
          {
            balls.get(i).c = color (240, 85, 7) ;
          }
          
        }//end first for
        
      }
      else
      {
        drawAxis(11, 110);
        
        for(int i = 0; i < data.size() - 1; i ++)
        {
          float x1 = map(i, 0, data.size(), border, border + windowRange);
          float x2 = map(i + 1, 0, data.size(), border, border + windowRange);
          float y1 = map(data.get(i).noPlayer, 0, 110, height - border, (height - border) - windowRange);
          float y2 = map(data.get(i + 1).noPlayer, 0, 110, height - border, (height - border) - windowRange);
          line(x1, y1, x2, y2);
        }
        
        for(int i = 0; i < data.size(); i ++)
        {
          float ballX = map(i, 0, data.size(), border, border + windowRange);
          float ballY = map(data.get(i).noPlayer, 0, 110, height - border, (height - border) - windowRange);
          Ball ball = new Ball(ballX, ballY, color(240, 85, 7));
          balls.add(ball);
          balls.get(i).render();
        }
        
        balls.get(ballIndex).c = color(240, 85, 7) ;
      }//end else
       
      break;
    }
    
    case 2:
    {
      check = 2;
      if(toggled)
      {
         println("Yoohooooo");
         displayPlayer(storeIndex);
      }
      else
      {
        
        float sum = sumPlayers(); 
        int maxIndex = maxIndex();
        
        //call drawPieChart()
        drawPieChart(sum, maxIndex);
        break;
      }
        
    }
    
  }//end switch
  
}

void drawAxis(int verticalIntervals, float vertDataRange)
{
  stroke(200, 200, 200);
  fill(200, 200, 200);  
  
  // Draw the horizontal azis  
  line((border - 13), height - border, width - border, height - border);
  
  float horizInterval =  windowRange / (data.size() - 1);
  float tickSize = border * 0.1f;
  
    
  for (int i = 0 ; i < data.size() ; i ++)
  {   
   // Draw the ticks
   float axisX = (border - 13) + (i * horizInterval);
   line(axisX, height - (border - tickSize), axisX, (height - border));
   float TextY = height - (border * 0.5f);
   
   // Print the text 
   textAlign(CENTER, CENTER);
   text(data.get(i).year, axisX, TextY);
  }
  
  // Draw the vertical axis
  line((border - 13), border , (border - 13), height - border);
  
  float verticalDataGap = vertDataRange / verticalIntervals;
  float verticalWindowRange = height - (border * 2.0f);
  float verticalWindowGap = verticalWindowRange / verticalIntervals; 
  for (int i = 0 ; i <= verticalIntervals ; i ++)
  {
    float axisY = (height - border) - (i * verticalWindowGap);
    line((border - 13) - tickSize, axisY, (border - 13), axisY);
    float hAxisLabel = verticalDataGap * i;
        
    textAlign(RIGHT, CENTER);  
    text((int)hAxisLabel, (border - 13) - (tickSize * 2.0f), axisY);
  }
}

void displayPlayer(int coIndex)
{  
  float textY = 20.0f;
  textAlign(LEFT, TOP);
  text("Country", 0, 20);
  text("Name", 200, 20);
  text("Team", 350, 20);
  for(int i = 0; i < players.size(); i ++)
  {
    if(players.get(i).countryIndex == coIndex)
    {
      float textX = 0;
      textY += 30;
      text(players.get(i).country, textX, textY);
      text(players.get(i).playerName, textX + 200, textY);
      text(players.get(i).team, textX + 350, textY);
    }
    
  }
    
}

void drawPieChart(float sum, int maxIndex)
{
  float radius = centX ;
  float toMouseX = mouseX - radius;
  float toMouseY = mouseY - radius;  
  float angle = atan2(toMouseY, toMouseX);  
  
  if (angle < 0)
  {
    angle = map(angle, -PI, 0, PI, TWO_PI);
  }
  println(angle);
  
  // The last angle
  float last = 0;
  
  // The cumulative sum of the dataset 
  float cumulative = 0;
  
  for(int i = 0 ; i < countries.size() ; i ++)
  {
    cumulative += countries.get(i).noPlayers;
    
    // Calculating the current angle
    float current = map(cumulative, 0, sum, 0, TWO_PI);
    
    //Draw the pie segment
    stroke(255);
    fill(255);
    
    float r = radius;
 
    // Checking if the mouse angle is inside the pie segment
    if (angle > last && angle < current)
    {
      r = radius * 1.5f;
      text(countries.get(i).country, 220, 40);
    }
    
    // Draw the arc
    arc(radius, radius, r, r, last, current);
    last = current;       
  }
  stroke(255, 0, 0);
  line(radius, radius, mouseX, mouseY);
  

}

void mousePressed()
{
  if(check == 1)
  {
    for(int i = 0; i < data.size(); i++)
    {
      
      if(dist(mouseX, mouseY, balls.get(i).pos.x, balls.get(i).pos.y) < balls.get(i).ballRadius)
      {
        ballIndex = i;
        animate = ! animate;
        
      }
      
    }//end for
  }
        
  if(check == 2)
  {
    
    // Calculating the sum
    float sum = 0.0f;
    for(int i = 0; i < countries.size(); i++)
    {
      sum += countries.get(i).noPlayers;
    }
    
    
    // Calculate the angle to the mouse
    float radius = centX ;
    float toMouseX = mouseX - radius;
    float toMouseY = mouseY - radius;  
    float angle = atan2(toMouseY, toMouseX);  
    
    if (angle < 0)
    {
      angle = map(angle, -PI, 0, PI, TWO_PI);
    }
    
    float last = 0;
    float cumulative = 0;
    
    for(int i = 0 ; i < countries.size() ; i ++)
    {
      cumulative += countries.get(i).noPlayers;
       // Calculate the current angle
      float current = map(cumulative, 0, sum, 0, TWO_PI);
      
      // If the mouse angle is inside the pie segment
      if (angle > last && angle < current)
      {
          storeIndex = i;
          toggled = ! toggled;
      }     
      
      last = current;
    }//end for
    
  }//end if
  
}

void keyPressed()
{
  if (key >= '1' && key <='2')
  {
    mode = key - '0';
  }
  println(mode);
}



    
