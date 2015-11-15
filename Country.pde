class Country
{
  String countryName;
  int noPlayers;
  
  Country(String lines)
  {
    String[] elements = lines.split("\t");
    countryName = elements[0];
    noPlayers = Integer.parseInt(elements[1]);
  }
}

