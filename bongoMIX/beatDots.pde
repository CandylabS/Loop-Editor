class Pt{
  float x;
  float y;
  
  Pt(){}
  Pt(float px, float py){
    x = px;
    y = py;
  }
  Pt add(float r, float angle){
    x = r * sin(angle);
    y = r * cos(angle);
    return this;
  }
  void show(color c){
    pushMatrix();
      translate(x, y);
      noStroke();
      fill(c);
      ellipse(0, 0, bit * 2, bit * 2);
    popMatrix();
  }
}

class Bt extends Pt{
  float pangle;
  AudioSnippet audio;
  
  void beating(float angle){
    if (abs(angle - pangle) > 2 * PI || angle == pangle){
      audio.play(0);
      pangle = angle;
    }
  }
}