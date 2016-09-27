// ************************************************
// class for Lollipop (loop editor)
// ************************************************

class Sprite{
  Pt C = new Pt(canvas_w/2, canvas_h/2);   // center of lollipop circle
  Pt pt;
  AudioPlayer audio;
  float vol;  // volume
  float r;    // radius of lollipop circle
  float rr;   // radius of beatList
  int[] tint = new int[3];  // color of lollipop
  int[] rgb = new int[]{255, 255, 255}; // color during transition
  int i = 0;
  int di = 1;
  int state = 0;
  int anchor = ON;
  int NUM_PARTICLES = 10;
  int stps = 300;    // transition effect with stps closest to heartrate
  
  
  float angle = 0;  // spinning state
  float dA;      // angle speed: rad per frame
  
  ArrayList<Bt> beatList = new ArrayList<Bt>();  // beats on circle
  ArrayList<Particle> particles = new ArrayList<Particle>();  // initially explosion system
  
  
  void render(int a, int b){
    r = a;
    rr = b;
    dA = 2 * PI/stps;      
    tint[0] = redC(pop(a));
    tint[1] = greenC(pop(a));
    tint[2] = blueC(pop(a));
    // anchor white point
    pt = new Pt();
    pt.add(r, 0);
  }
  
  color tintin(){
    if ((state == 0 || i > stps/2) && i < stps){
      rgb[0] = int(map(stps-i, 1, stps, tint[0], 255));
      rgb[1] = int(map(stps-i, 1, stps, tint[1], 255));
      rgb[2] = int(map(stps-i, 1, stps, tint[2], 255));
      i += di; 
    } else{
      di = -di;
      i += di;
      state = 1;
    }
    return color(rgb[0], rgb[1], rgb[2]);
  }  // color transition of lollipop
  
  void respiration(){
      if (i >= stps){i = stps - 1; di = 1;}
        else if (i <= stps/2){i = stps/2 + 1; di = -1;}
  }
  
  void update(){  // if playback == 0, stop
    stps = int(map(C.y, 0, canvas_h, 30, 500));
    respiration();
    if (playback == 1){angle += dA;}        // play forward
    else if (playback == -1){angle -= dA;}  // play backward
    dA = 2 * PI/stps;  
    vol = map(500 - dist(C.x, C.y, canvas_w/2, canvas_h/2), 0, 500, -1, 1);
    for (Bt b : beatList){
      b.vol = vol;
    }
  }
  
  
  void addBeat(){
    Bt b = new Bt();
    b.add(r, angle);
    b.angle = angle;
    b.pangle = angle;
    beatList.add(b);
    audio.setVolume(vol);
    audio.play(0);
    explode(b);
  }
  
  void explode(Pt b){
    particles = new ArrayList<Particle>();
    int i = 0;
    while (i < NUM_PARTICLES) {
      Particle p = randomParticle();
      p.x = b.x;
      p.y = b.y;
      particles.add(p);
      i += 1;
    }
  }
  
  void destroy(Pt b, int index){
    explode(b);
    beatList.remove(index);
  }
  
  void reset(){
    beatList = new ArrayList<Bt>();    
  }
} 