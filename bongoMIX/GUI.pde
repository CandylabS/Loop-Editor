// keyboard UI

void mousePressed(){
  if (mouseY > canvas_h/2){    // lower speed, decrease stps
    if (stps < 300) {respiration(10);}
  } else {    // upper speed, increase stps
      if (stps > 30) {respiration(-10);}
  }
}

void mouseDragged(){
  
}

void keyPressed(){
  if (key == '0'){
    lollipop.clear();
    Sprite lol = new Sprite();
    lollipop.add(lol);
  }  // reset beatlist
  if (key == '1'){
    playback = 1;
  }  // play forward
  if (key == '2'){
    playback = -1;
  }  // play backward
  if (key == '3'){
    playback = 0;
  }  // stop 
  if (key == 'a' || key == 'A'){
    Sprite lol = lollipop.get(0);
    lol.addBeat();
    lol.anchor = OFF;
  }// add beat bongo1
  if (key == 'b' || key == 'B'){
    Sprite lol = lollipop.get(1);
    lol.addBeat();
    lol.anchor = OFF;
  }// add beat bongo2
  if (key == 'c' || key == 'C'){
    Sprite lol = lollipop.get(2);
    lol.addBeat();
    lol.anchor = OFF;
  }// add beat bongo2
  if (key == '=' || key == '+'){
    Sprite lol = new Sprite();
    lollipop.add(lol);
  }  // add circle
}


void keyReleased(){
  
}