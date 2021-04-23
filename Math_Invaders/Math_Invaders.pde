Ship Ship;
Invader[] Invaders = new Invader[10];

public void setup() {
  size(700,700);
  spawnInvaders();
}

public void draw() {
  background(220);
  
  for (Invader v : Invaders) {
    v.draw();
  }
  
  if (Ship != null && Ship.active) {
    Ship.move();
    for (Invader v : Invaders)
      Ship.ShipVsInvader(v);
    Ship.draw();
  }
}

public void mouseReleased() {
   Ship = new Ship(mouseX, mouseY);
}

private void spawnInvaders() {
  for (int i = 0; i < Invaders.length; i++) {
    int x = (int) 150 + 1;
    int y = (int) 80 + 5;
    Invaders[i] = new Invader(x, y);
  }
}
