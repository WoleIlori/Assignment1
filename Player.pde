class Player
{
  String country;
  String playerName;
  String team;
  
  Player(String list)
  {
    String[] elements = list.split("\t");
    country = elements[0];
    playerName = elements[1];
    team = elements[2];
  }
}
