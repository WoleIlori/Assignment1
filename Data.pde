class Data
{
  String year;
  int noPlayer;
  
  Data(String line)
  {
    String[] els = line.split("\t");
    year = els[0];
    noPlayer = Integer.parseInt(els[1]);
  }
  
}
  
