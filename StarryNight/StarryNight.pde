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
ArrayList<AudioPlayer> starry;


PImage image;

ArrayList<Sprite> lollipop;

color pop;
color pcolor;

int range;
int bit;

int ON = 1;
int OFF = 0;

int canvas_h = 600;
int canvas_w = 800;

int playback = 1;  // control play forward/backward/stop

void setup(){
  // draw canvas
  size(800, 600);
  image = loadImage("july.jpg");
  
  // initalize color
  pcolor = color(255);
  
  // initialize sound
  minim = new Minim(this);
  starry = new ArrayList<AudioPlayer>();
  AudioPlayer star1 = minim.loadFile("Starrynight_C_1.mp3"); starry.add(star1);
  AudioPlayer star2 = minim.loadFile("Starrynight_C_2.mp3"); starry.add(star2);
  AudioPlayer star3 = minim.loadFile("Starrynight_C_3.mp3"); starry.add(star3);
  AudioPlayer star4 = minim.loadFile("Starrynight_C_4.mp3"); starry.add(star4);

  // initial sprites
  lollipop = new ArrayList<Sprite>();
  Sprite lol = new Sprite();
  lollipop.add(lol);
  
  // inital time

}

void draw(){
  image.resize(800, 600);
  image(image, 0, 0);
  smooth();          // no edges
  
  // first lollipop loop editor
  range = 100;
  bit = 10;
  
  //
  for (int i=0; i < lollipop.size(); i++){
    Sprite lol = lollipop.get(i);
    lol.audio = starry.get(i);
    lol.render(range, bit);
    pushMatrix();
      translate(lol.C.x, lol.C.y);      // origin
    
      noStroke(); 
      fill(lol.tintin(), 95);    
      ellipse(0, 0, lol.r * 2, lol.r * 2);  // draw 1st circle
    
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
    
    collision();
    range -= 10;
    bit -= 1;
  }
  
}