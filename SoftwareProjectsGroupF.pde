StateClass state;
Level level;
Menu menu;
SaveGame save;
PostGame postGame;
CutScreens cutScreens;
int currentLevel;
boolean paused;

void setup()
{
  size(1200, 620);
  currentLevel = 1;
  save = new SaveGame();
  state = new StateClass();
  menu = new Menu(state, currentLevel, paused);
  cutScreens = new CutScreens(currentLevel, state, paused);
  postGame = new PostGame(state, currentLevel, paused);
}

void draw()
{
  switch(state.state)
  {
  case FRONTEND:
    menu.drawMenu();
    break;
  case CUTSCREENS:
    cutScreens.drawCutScreens();
    break;
  case INGAME:
    level.drawLevel();
    break;
  case POSTGAMEWIN:
    postGame.drawWin();
    break;
  case POSTGAMELOSE:
    postGame.drawLose();
    break;
  }
}


void keyPressed()
{
  switch(state.state)
  {
  case FRONTEND:
    menu.handleKey();
    break;
  case CUTSCREENS:
    break;
  case INGAME:
    level.handleKeyOn();
    break;
  case POSTGAMEWIN:
    break;
  case POSTGAMELOSE:
    break;
  }
}

void keyReleased()
{
  switch(state.state)
  {
  case FRONTEND:
    break;
  case INGAME:
    level.handleKeyOff();
    break;
  case POSTGAMEWIN:
    break;
  case POSTGAMELOSE:
    break;
  }
}

void mousePressed()
{
  println(mouseX, mouseY);

  switch(state.state)
  {
  case FRONTEND:
    menu.handleMouse();
    break;
  case CUTSCREENS:
    cutScreens.handleMouse();
    break;
  case INGAME:
    level.handleMousePressed();
    break;
  case POSTGAMEWIN:
    postGame.handleMouseWin();
    break;
  case POSTGAMELOSE:
    postGame.handleMouseLose();
    break;
  }
}

void mouseReleased()
{
  println(mouseX, mouseY);

  switch(state.state)
  {
  case FRONTEND:
    break;
  case INGAME:
    level.handleMouseReleased();
    break;
  case POSTGAMEWIN:
    break;
  case POSTGAMELOSE:
    break;
  }
}

void mouseDragged()
{
  switch(state.state)
  {
  case FRONTEND:
    break;
  case INGAME:
    level.handleMouseDragged();
    break;
  case POSTGAMEWIN:
    break;
  case POSTGAMELOSE:
    break;
  }
}