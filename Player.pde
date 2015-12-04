class Player
{
  int countryIndex;
  String country;
  String playerName;
  String team;
  
  Player(String list)
  {
    String[] elements = list.split("\t");
    countryIndex = Integer.parseInt(elements[0]);
    country = elements[1];
    playerName = elements[2];
    team = elements[3];
  }
  
}
