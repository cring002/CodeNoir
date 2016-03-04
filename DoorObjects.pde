//This is for the in game doors. Probably needs more work when there are more elements in 

class Door extends LargeObject
{
  String orientaion; 
  String doorType; //l = lockpick, t = terminal, f = fingerprint
  int lengthOfTumbler;
  boolean hasFingerPrint = false;
  Level parentLevel;

  LockPuzzle doorLock;
  Door(int newSX, int newSY, String orient, String type, Level parentLevel, int tumblerLength)
  {
    this.parentLevel = parentLevel;
    if (tumblerLength != 0)
    {
      doorLock = new LockPuzzle(tumblerLength, this, parentLevel);
    }
    if ((orientaion = orient).equals("v"))
    {
      startX = newSX;
      startY = newSY;
      endX = startX+20;
      endY = startY+80;
    } else {
      startX = newSX;
      startY = newSY;
      endX = startX+80;
      endY = startY+20;
    }
    locked = true;
    doorType = type;
  }
  Door(int newSX, int newSY, String orient, String type, Level parentLevel)
  {
    this( newSX, newSY, orient, type, parentLevel, 0);
  }
  void drawObj()
  {
    fill(128, 60, 15);
    rectMode(CORNERS);
    rect(startX, startY, endX, endY);
  }

  void open()
  {
    locked = false;
    if (orientaion.equals("v"))
    {
      endY = startY+20;
    } else {
      endX = startX+20;
    }
  }

  void close()
  {
    locked = true;
    if (orientaion.equals("v"))
    {
      endY = startY+80;
    } else {
      endX = startX+80;
    }
  }
}