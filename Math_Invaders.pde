Lazer Lazer;
Ship ship;
Invader[] Invaders = new Invader[30];
AnswerInvader[] AnswerInvaders = new AnswerInvader[30];
Button b1, b2, b3;
int k = 60;
int t = 60;
color c;
public void setup() {
  size(700, 700);
  build();
  spawnInvaders();
  //spawnAnswerInvaders();
  ship = new Ship(350, 550);
}

public void draw() {
  background(#0f001f);
  b1.draw();
  b2.draw();
  b3.draw();

  ship.draw();
  ship.update();

  for (Invader v : Invaders) {
    if (v != null && v.active)
      v.draw();
  }

  if (Lazer != null && Lazer.active) {
    Lazer.move();
    for (Invader v : Invaders) {
      if (v != null && v.active)
        Lazer.LazerVsInvader(v);
    }
    Lazer.draw();
  }
}

public void mouseReleased() {
  if (b1.isClicked()) {
    println(b1.title);
    exit();
    
  }
  if (b2.isClicked()) {
    println(b2.title);
  }
  if (b3.isClicked()) {
    println(b3.title);
  }
}

public void build() {
  b1 = new Button(200, 160, 20, 20, "10", #6a0101);
  b2 = new Button(250, 350, 150, 50, "5+5", #494f9c);
  b3 = new Button(-1, 650, 200, 50, "Use A and D to move, W to shoot" , #4b2970);
}
public void keyPressed() {

  if (keyCode == 68) {
    ship.move(5);
  } else if (keyCode == 65) {
    ship.move(-5);
  } else if (keyCode == 87) {
    Lazer = new Lazer((int) ship.pos.x + 9, (int) ship.pos.y - 20);
  }
}

public void keyReleased() {
  if (keyCode == 65) {
    ship.move(0);
  } else if (keyCode == 68) {
    ship.move(0);
  }
}

private void spawnInvaders() {
  int n = 0;
  for (int i = 0; i < 5; i++) {
    for ( int j = 0; j < 6; j++) {
      int x = j*k + 200;
      int y = i*t + 40;
      Invaders[n] = new Invader(x, y);
      n += 1;
    }
  }
}
