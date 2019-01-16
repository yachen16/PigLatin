public void setup() 
{
	/*String[] lines = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) 
	{
	  System.out.println(pigLatin(lines[i]));
	}*/
  String[] words = loadStrings("LowellHymn.txt");
  System.out.println("there are " + words.length + " lines");
  for (int i = 0 ; i < words.length; i++){
    String[] list = split(words[i], ' ');
    for (int j = 0 ; j < list.length; j++){
      if(!punc(list[j])){
        System.out.print(pigLatin(list[j]) + " ");
      }else{
        System.out.print(pigLatin(list[j]) + "\n");
      }
    }
  }
}
public void draw()
{
        //not used
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
  for(int i = 0; i < sWord.length(); i ++){
    if(sWord.substring(i, i+1).equals("a")){
      return i;
    }
    if(sWord.substring(i, i+1).equals("e")){
      return i;
    }
    if(sWord.substring(i, i+1).equals("i")){
      return i;
    }
    if(sWord.substring(i, i+1).equals("o")){
      return i;
    }
    if(sWord.substring(i, i+1).equals("u")){
      return i;
    }
  }
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
  if(punc(sWord) && sWord.length() >0){
    if(sWord.length() > 0){
      if(sWord.substring(0, 2).equals("qu")){
        return sWord.substring(2,sWord.length()-1) + "quay" + sWord.substring(sWord.length()-1);
      }
    }
    if(findFirstVowel(sWord) == 0){
      return sWord.substring(0, sWord.length()-1) + "way" + sWord.substring(sWord.length()-1);
    }
    if(findFirstVowel(sWord) != -1){
      return sWord.substring(findFirstVowel(sWord), sWord.length() -1) + sWord.substring(0, findFirstVowel(sWord)) + "ay" + sWord.substring(sWord.length()-1);
    }
    if(findFirstVowel(sWord) == -1)
    {
      return sWord.substring(0, sWord.length() -1) + "ay" + sWord.substring(sWord.length()-1);
    }
    else
    {
      return "ERROR!";
    }
  }
  if(sWord.length() > 0){
    if(sWord.substring(0, 2).equals("qu")){
      return sWord.substring(2,sWord.length()) + "quay";
    }
  }
  if(findFirstVowel(sWord) == 0){
    return sWord + "way";
  }
  if(findFirstVowel(sWord) != -1){
    return sWord.substring(findFirstVowel(sWord)) + sWord.substring(0, findFirstVowel(sWord)) + "ay";
  }
	if(findFirstVowel(sWord) == -1){
		return sWord + "ay";
	}else{
    return "ERROR";
  }
}
public boolean punc(String word){
  for(int i = 0; i < word.length(); i ++){
    if(word.substring(i, i+1).equals(",")){
      return true;
    }
    if(word.substring(i, i+1).equals(".")){
      return true;
    }
  }
  return false;
}
