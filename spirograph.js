let smallerRadius;
let largerRadius;
let innerOffset = 100;    // distance of the pen tip from the center of the inner circle
let outerAngle = 0;
let dOuterAngle = .1; //01;    // step size for the outer angle
let innerAngle = 0;       // angle of rotation about the smaller circle
let penColor;

function setup() {
    createCanvas(500, 500);
    background(80);
    smooth();
    background(255);
    largerRadius = width / 2.0;
    smallerRadius = width * 7.0 /25.0;
    penColor = color(255, 0, 0);
    frameRate(50000);
}

function mouseClicked() {
  background(255);
  // choose a new random pen color, inner circle size, and inner offset
  penColor = color(random(0, 255), random(0, 255), random(0, 255));
  smallerRadius = random(0, largerRadius);
  innerOffset = random(0, smallerRadius);
  outerAngle = innerAngle = 0;
}

function draw() {
    noFill();
    stroke(0);
    ellipse(width/2, height/2, width, height);
    translate(width/2,height/2);    // move origin to the center of larger circle
    rotate(outerAngle);             // perform first rotation
    translate(largerRadius - smallerRadius,0);  // move origin to the center of the smaller circle
    rotate(innerAngle);

    fill(penColor);
    stroke(penColor);
    strokeWeight(3);
    point(innerOffset,0);

    outerAngle += dOuterAngle;
    innerAngle = (-outerAngle * largerRadius) / smallerRadius;
}

