void setup()
{
  size(500, 500);
  //create arraylist
  ArrayList<Float> nbaData = new ArrayList<Float>();
  
  //load data
  String[] chart = loadStrings("nba.csv");
  
  for(String s:chart)
  {
    //Add each element from the string array into the arraylist
    float f = Float.parseFloat(s);
    nbaData.add(f);
  }
  
}



void draw()
{
}
