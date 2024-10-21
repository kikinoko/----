float EYE_X = 100;
float EYE_Y = 80;
float EYE_Z = 80;

float TARGET_X = 0;
float TARGET_Y = 0;
float TARGET_Z = 0;

float UP_X = 0;
float UP_Y = 0;
float UP_Z = -1;

float ARM_LENGTH = 30;
float ARM_WIDTH = 5;
float PERIOD1 = 5000;
float PERIOD2 = 5000;
float n1 = PI / 4; // 
float n2 = PI / 2; // 
void setup() {
  size(512, 512, P3D);
  frameRate(60);
}

void drawAxes() {
  float axisLength = 50;
  strokeWeight(5);
  noFill();
  stroke(240, 64, 64);
  line(0, 0, 0, axisLength, 0, 0);
  stroke(64, 192, 64);
  line(0, 0, 0, 0, axisLength, 0);
  stroke(64, 64, 255);
  line(0, 0, 0, 0, 0, axisLength);
}

void drawPlane() {
  int numX = 16;
  int numY = 16;
  float sideLength = 20.0;
  color[] c = {220, 200};
  noStroke();
  pushMatrix();
  translate(-(numX / 2) * sideLength, -(numY / 2) * sideLength, 0);
  for (int x = 0; x < numX; x++) {
    for (int y = 0; y < numY; y++) {
      fill(c[(x + y) % 2]);
      rect(0, 0, sideLength, sideLength);
      translate(sideLength, 0, 0);
    }
    translate(-numX * sideLength, sideLength, 0);
  }
  popMatrix();
}

void drawArm(){
  pushMatrix();
  translate(0,0, ARM_LENGTH/2);
  fill(255,255,255);
  noStroke();
  box(ARM_WIDTH,ARM_WIDTH,ARM_LENGTH);
  popMatrix();
}

void drawFinger(){
  pushMatrix();
  translate(0,0, ARM_LENGTH/4);
  fill(255,255,255);
  noStroke();
  box(ARM_WIDTH,ARM_WIDTH,ARM_LENGTH/2);
  popMatrix();
}
  

void draw() {
  background(255);
  camera(EYE_X, EYE_Y, EYE_Z, TARGET_X, TARGET_Y, TARGET_Z, UP_X, UP_Y, UP_Z);
  lights();

  drawPlane();
  drawAxes(); 
  
  /* write your code here */
 
  float theta1 = TWO_PI * millis() / PERIOD1;
  rotateZ(theta1);
  drawArm();
  
  translate(0, 0, ARM_LENGTH);
  float theta2 = n1 * sin(TWO_PI * millis() / PERIOD2); 
  rotateY(theta2);
  drawArm();
  
 
  translate(0, 0, ARM_LENGTH);
  float theta3 = n2 * sin(TWO_PI * millis() / PERIOD2); 
  
  pushMatrix();
  rotateY(-theta3/2);  
  drawFinger();
  popMatrix();
  
  rotateY(theta3/2);  
  drawFinger();
  
  
  
 
  
}
