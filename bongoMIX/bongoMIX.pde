// ****************************************************
// TITLE:        Lollipop Forest
// DESCRIPTION:  Demo functions and classes
// AUTHOR:       ALICE CHEN
// DATE:         Nov 2015
// ****************************************************
// import Minim
import ddf.minim.*;

// set up the sound variables
Minim minim;
AudioSnippet[] drums;

ArrayList<Sprite> lollipop;

color pop;
color bcolor;
color pcolor;

int range;
int bit;

int ON = 1;
int OFF = 0;

int canvas_h = 600;
int canvas_w = 800;
int stps = 150;    // transition effect with stps closest to heartrate

int playback = 1;  // control play forward/backward/stop

void setup(){
  // draw canvas
  size(800, 600);
  
  // initalize color
  pcolor = color(255);
  
  // initialize sound
  minim = new Minim(this);
  drums = new AudioSnippet[3];
  drums[0] = minim.loadSnippet("bongo7.wav");
  drums[1] = minim.loadSnippet("bongo1.wav");
  drums[2] = minim.loadSnippet("bicycle.wav");
  
  // initial sprites
  lollipop = new ArrayList<Sprite>();
  Sprite lol = new Sprite();
  lollipop.add(lol);
  
  // inital time

}

void draw(){
  background(canvas());
  smooth();          // no edges
  
  // first lollipop loop editor
  range = 100;
  bit = 7;
  
  //
  for (int i=0; i < lollipop.size(); i++){
    Sprite lol = lollipop.get(i);
    lol.audio = drums[i];
    lol.render(range, bit);
    pushMatrix();
      translate(lol.C.x, lol.C.y);      // origin
    
      noStroke(); 
      fill(lol.tintin());    
      ellipse(0, 0, lol.r * 2, lol.r * 2);  // draw 1st circle
    
      stroke(200);
      strokeWeight(3);
      line(0, 0, 0, lol.r * 2);       // draw playhead
    
      // draw beatdots
      rotate(lol.angle);
      lol.update();
      for (Bt b : lol.beatList){
        b.show(bcolor(range));
        b.audio = lol.audio;
        b.beating(lol.angle);
      }
      if (lol.anchor == ON){lol.pt.show(pcolor);} // show white anchor point
      
      // render and update all the particles
      for (Particle p : lol.particles) {
        p.render();
        p.update();
      }
    popMatrix();
    range -= 15;
    bit -= 1;
  }
  
}