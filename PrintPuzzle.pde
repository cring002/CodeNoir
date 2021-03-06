class PrintPuzzle
{
  FullPiece print;

  ArrayList<PartialPiece> partialChoice;
  ArrayList<BlankPiece> blankPiece;

  boolean completed;
  StringList full = new StringList();
  IntList partial = new IntList();
  int pos;
  boolean UL, UR, ML, MR, DL, DR = false;
  PImage office, printWin;

  PrintPuzzle()
  {
    full.append("arch");
    full.append("loop");
    full.append("whorl");

    for (int i = 1; i < 19; i++) {
      partial.append(i);
    }

    pos = (int)random(0, 3);
    print = new FullPiece(200, 50, "Art_Assets/In_Game/Fingerprint/" + full.get(pos) + ".jpg");

    blankPiece = new ArrayList<BlankPiece>();
    
    blankPiece.add(new BlankPiece(600, 50, 16)); //UL index 0
    blankPiece.add(new BlankPiece(700, 50, 16)); //UR index 1
    blankPiece.add(new BlankPiece(600, 150, 16));//ML index 2
    blankPiece.add(new BlankPiece(700, 150, 16)); //MR index 3
    blankPiece.add(new BlankPiece(600, 250, 16)); //DL index 4
    blankPiece.add(new BlankPiece(700, 250, 16)); //DR index 5

    partialChoice = new ArrayList<PartialPiece>();
    partial.shuffle();
    for (int i = 0; i < 18; i++) {
      if (i < 9) partialChoice.add(new PartialPiece((i*100)+100, 400, partial.get(i) + ".jpeg"));
      else partialChoice.add(new PartialPiece(((i-9)*100)+100, 500, partial.get(i) + ".jpeg"));
    }
    office = loadImage("Art_Assets/In_Game/Fingerprint/office.jpeg");
    printWin = loadImage("Art_Assets/In_Game/Fingerprint/fingerprintWin.png");
  }

  void drawPuzzle()
  {
    background(office);
    fill(255);
    textSize(15);
    text("Replicate the full print in the left 2x6 grid by dragging partial prints from the bottom!", 180, 30);
    //draw reset button
    stroke(0);
    fill(0);
    rectMode(CORNER);
    rect(900, 100, 150, 75);
    fill(255);
    textSize(38);
    text("RESET", 907, 150);

    //draws full print on left
    print.drawPiece();

    //draws right 2x6 box for user to add partials   
    for(int i = 0; i < blankPiece.size(); i++)
    {
      blankPiece.get(i).drawPiece();
    }

    //draws bottom 18x2 box for user selection
    for (int i = 0; i < partialChoice.size(); i++)
    {
      partialChoice.get(i).drawPiece();
    }
    
    //display pop up if print is correct
    if(completed == true) {
      win();
    }
  }

  void move() {
    if (mouseX > 900 && mouseX < 1050 && mouseY > 100 && mouseY < 175) {
      for (int i = 0; i < partialChoice.size(); i++) {
        partialChoice.get(i).reset();
      }
      UL = false;
      UR = false;
      ML = false;
      MR = false;
      DL = false;
      DR = false;
      return;
    }
    for (int i = 0; i < partialChoice.size(); i++) {
      partialChoice.get(i).clicked = false;
    }
    for (int i = 0; i < partialChoice.size(); i++) {
      if (partialChoice.get(i).checkMove()) return;
    }
  }

  void draggedPiece() {
    for (int i = 0; i < partialChoice.size(); i++) {
      partialChoice.get(i).dragged();
    }
  } 

  void snapPiece() {
    //when a partial piece is moved in the vicinity and released, snap the piece onto the blank piece
    //also checks if the index of the partial piece is correct once snapped
    for(int x = 0; x < blankPiece.size(); x++) {
      for (int i = 0; i < partialChoice.size(); i++)
      {
        blankPiece.get(x).checkSnap(partialChoice.get(i));
        checkCorrect(i);
      }
    }
    
    //if all pieces are in the correct place switch completed to true
    if ((UL && UR && ML && MR && DL && DR) == true) {
      completed = true;
    }
  }
  
  void win() {
    image(printWin, 300, 160);
  }
  
  void checkCorrect(int i) {
    switch(pos) {
   case 0:
     if (blankPiece.get(0).contains == true && partial.get(i) == 1) {
       UL = true;
     }
     if (blankPiece.get(1).contains == true && partial.get(i) == 2) {
       UR = true;
     }
     if (blankPiece.get(2).contains == true && partial.get(i) == 3) {
       ML = true;
     }
     if (blankPiece.get(3).contains == true && partial.get(i) == 4) {
       MR = true;
     }
     if (blankPiece.get(4).contains == true && partial.get(i) == 5) {
       DL = true;
     }
     if (blankPiece.get(5).contains == true && partial.get(i) == 6) {
       DR = true;
     }
      break;
   case 1:
     if (blankPiece.get(0).contains == true && partial.get(i) == 7) {
       UL = true;
     }
     if (blankPiece.get(1).contains == true && partial.get(i) == 8) {
       UR = true;
     }
     if (blankPiece.get(2).contains == true && partial.get(i) == 9) {
       ML = true;
     }
     if (blankPiece.get(3).contains == true && partial.get(i) == 10) {
       MR = true;
     }
     if (blankPiece.get(4).contains == true && partial.get(i) == 11) {
       DL = true;
     }
     if (blankPiece.get(5).contains == true && partial.get(i) == 12) {
       DR = true;
     }
     break;
   case 2:
     if (blankPiece.get(0).contains == true && partial.get(i) == 13) {
       UL = true;
     }
     if (blankPiece.get(1).contains == true && partial.get(i) == 14) {
       UR = true;
     }
     if (blankPiece.get(2).contains == true && partial.get(i) == 15) {
       ML = true;
     }
     if (blankPiece.get(3).contains == true && partial.get(i) == 16) {
       MR = true;
     }
     if (blankPiece.get(4).contains == true && partial.get(i) == 17) {
       DL = true;
     }
     if (blankPiece.get(5).contains == true && partial.get(i) == 18) {
       DR = true;
     }
     break;
    }
  }
}

class BlankPiece
{
  int index;
  int x;
  int y;
  boolean contains = false;
  
  BlankPiece(int x, int y, int index)
  {
    this.index = index;
    this.x = x;
    this.y = y;
  }
  
  void drawPiece()
  {
    stroke(0);
    strokeWeight(1);
    fill(11, 30, 50);
    rect(x,y,100,100);
  }
  
  void checkSnap(PartialPiece piece) {
    if(piece.x+50 > x && piece.x+50 < x+100 && piece.y+50 > y && piece.y+50 < y+100) {
      piece.x = x;
      piece.y = y;
      contains = true;
    } else {
      contains = false;
    }
  }
  
  void checkProx(PartialPiece piece) {
    if(piece.x+50 > x && piece.x+50 < x+100 && piece.y+50 > y && piece.y+50 < y+100) {
      contains = true;
    } else {
      contains = false;
    }
  }   
}

class FullPiece {
  PImage full_print;
  int x;
  int y;
  
  FullPiece(int x, int y, String name) {
    this.x = x;
    this.y = y;
    full_print = loadImage(name);
    full_print.resize(200, 300);
  }
  
  void drawPiece() {
    image(full_print, x, y);
  } 
}

class PartialPiece {
  PImage partial;
  int x;
  int y;
  int reset_x;
  int reset_y;
  boolean clicked = false;
  boolean hover = false;
  
  PartialPiece(int x, int y, String name) {
    this.x = x;
    this.y = y;
    reset_x = x;
    reset_y = y;
    partial = loadImage("Art_Assets/In_Game/Fingerprint/select/" + name);
    partial.resize(100, 100);
  }
  
  void drawPiece() {
    image(partial, x, y);
    if(mouseX > x && mouseX < x+100 && mouseY > y && mouseY < y + 100) {
      hover = true;
      if(!clicked) {
        stroke(255);
        strokeWeight(3);
        fill(0, 0);
        rect(x, y, 97, 97);
      }
    } else {
      hover = false;
    }
  }
  
  boolean checkMove() {
    if(hover) {
      clicked = true;
      return true;
    } else {
       clicked = false;
       return false;
    }
  }
  
  void dragged() {
    if(clicked) {
      x = mouseX-50;
      y = mouseY-50;
    } 
  }
  
  void reset() {
    x = reset_x;
    y = reset_y;
    clicked = false;
  }
}