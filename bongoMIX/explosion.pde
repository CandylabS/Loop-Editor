// based on http://www.cs.sfu.ca/CourseCentral/166/tjd/particle_systems.html

class explosion {
  float x;
  float y;
  float dx;
  float dy;

  void update() {
    x += dx;
    y += dy;
  }
}

class Particle extends explosion {
  float diam;
  color fillColor;

  void render() {
    pushMatrix();

    noStroke();
    fill(fillColor);

    ellipse(x, y, diam, diam);

    popMatrix();
  }
}

Particle randomParticle() {
  Particle ball = new Particle();
  ball.x = 250;
  ball.y = 250;
  ball.dx = random(-4, 4);
  ball.dy = random(-4, 4);
  ball.diam = random(3, 5);
  ball.fillColor = color(255);
  return ball;
}