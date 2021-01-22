/**
Bryn Mawr College, Department of Computer Science <br>
Mouse click to choose a random pen color, inner circle size and inner offset
*/

float smallerRadius;
float largerRadius;
float innerOffset = 100;    // distance of the pen tip from the center of the inner circle
float outerAngle = 0;
float dOuterAngle = .01;    // step size for the outer angle
float innerAngle = 0;       // angle of rotation about the smaller circle
color penColor = color(255, 0, 0);

void setup() {
  size(500, 500);
  smooth();
  background(255);
  largerRadius = width/2.0;
  smallerRadius = width*7.0/25.0;
  frameRate(1000);
}

void mouseClicked() {
  background(255);
  // choose a new random pen color, inner circle size, and inner offset
  penColor = color(random(0, 255), random(0, 255), random(0, 255));
  smallerRadius = random(0, largerRadius);
  innerOffset = random(0, smallerRadius);
  outerAngle = innerAngle = 0;
}

void draw() {
  noFill();
  stroke(0);
  ellipse(width/2,height/2,width,height);
  translate(width/2,height/2);    // move origin to the center of larger circle
  rotate(outerAngle);             // perform first rotation
  translate(largerRadius - smallerRadius,0);  // move origin to the center of the smaller circle
  rotate(innerAngle);
  
  fill(penColor);
  stroke(penColor);
  strokeWeight(3);
  point(innerOffset,0);
  
  outerAngle += dOuterAngle;
  innerAngle = -outerAngle*largerRadius/smallerRadius;
}

