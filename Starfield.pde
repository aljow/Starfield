Particle []p = new Particle[50];
void setup() {
  size(500,500);
  background(0,0,0);
  noStroke();
  p[0] = new Oddball();
  for (int i = 1; i < p.length; i ++) {
    p[i]= new Particle();
  }
}

void draw() {
  background(0);
  for (int i = 0; i < p.length; i++) {
    p[i].move();
    p[i].show();
  }
}

class Particle {
  double myX, myY,myAngle,mySpeed,mySize;
  int myColor;
  Particle() {
    myX = 250;
    myY = 250;
    mySize = 5;
    mySpeed = (Math.random()*10) +2;
    myAngle = Math.random()*2*Math.PI;
    myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
  }
  void move() {
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
    mySize = mySize + 0.5;
    if (myX > 500 || myX < 0) {
      myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
      mySize = 5;
      myX = 250;
      myY = 250;
    }
    if (myY > 500 || myY < 0) {
      myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
      mySize = 5;
      myY = 250;
      myX = 250;
    }
    myAngle = myAngle + 0.01;
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, (float)mySize,(float)mySize);
  }
}

class Oddball extends Particle {
  Oddball() {
    myAngle = 0;
    mySpeed = 0.5;
    mySize = 20;
    myColor = color(256,256,256);
  }
  //ask about this 
  void move() {
    if (myX > 500 || myX < 0) {
      myX = 250;
      myY = 250;
    }
    if (myY > 500 || myY < 0) {
      myY = 250;
      myX = 250;
    }
    myX = myX + ((int)(Math.random()*11)-5);
    myY = myY + ((int)(Math.random()*11)-5);
  }
  void show() {
    rect((float)myX,(float)myY,(float)mySize,(float)mySize);
  }
}
