float a;                 // Angle of rotation
float offset = PI/24.0;  // Angle offset between boxes
int num = 30;            // Number of boxes


int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 500.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() { 
  size(640, 360, P3D);
  noStroke();  
  background(0, 0, 26);
  
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
} 
 

void draw() {
 background(0);
  calcWave();
  renderWave();

//stroke(255);

  
  if(mousePressed){
  
  lights();
  
  background(0, 0, 26);
  translate(width/2, height/2); 
 
  
  for(int i = 0; i < num; i++) {
    float gray = map(i, 0, num-1, 0, 255);
    pushMatrix();
    fill(250);
    rotateY(a + offset*i);
    rotateX(a/2 + offset*i);
    box(160);
    popMatrix();
  }

  a += 0.05;    
 
} 

 
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 16, 16);
  }
}
