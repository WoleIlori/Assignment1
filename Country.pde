class Country
{
  String country;
  int noPlayers;
  int countryIndex;
  
  Country(String lines)
  {
    String[] elements = lines.split("\t");
    country = elements[0];
    noPlayers = Integer.parseInt(elements[1]);
    countryIndex = Integer.parseInt(elements[2]);
  }
  
}

