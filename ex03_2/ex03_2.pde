float EYE_X = 100;
float EYE_Y = 80;
float EYE_Z = 80;

float TARGET_X = 0;
float TARGET_Y = 0;
float TARGET_Z = 0;

float UP_X = 0;
float UP_Y = 0;
float UP_Z = -1;

int numCubes = 12; 
float radius = 30;  
float speed = TWO_PI / 10;  // 1周10秒で回転
float cubeSize = 10;  
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

void draw() {
  background(255);
  camera(EYE_X, EYE_Y, EYE_Z, TARGET_X, TARGET_Y, TARGET_Z, UP_X, UP_Y, UP_Z);
  lights();

  drawPlane();
  drawAxes(); 
  

  float currentTime = millis() / 1000.0; // millis->1/1000[s]
  float currentAngle = currentTime * speed;  // 回転角度を計算

  for (int i = 0; i < numCubes; i++) {
    float angle = currentAngle + i * TWO_PI / numCubes;  
    float y = radius * cos(angle);  
    float z = radius * sin(angle) + 40;  // 中心を40に

    pushMatrix();
    translate(0, y, z);  
    rotateY(angle); 
    noStroke();
    fill(0);  
    box(cubeSize); 
    popMatrix();
  }
}
