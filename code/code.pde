
int previousMouseX, previouseMouseY;
color color1 = (int)random(0, 255);

void setup() {
  size(800, 800);
  background(255);
  
  strokeWeight(20);
}

void draw() {
  color1 = (int)random(0, 255);
  fill(255, 255, 255, 10);
  rect(0, 0, width, height);
  
  fill(#08B7FA);
line(mouseX, mouseY, previousMouseX, previouseMouseY);
previousMouseX = mouseX;
previouseMouseY = mouseY;
}
