// keyboard UI

void mousePressed(){
}

void mouseDragged(){
  for (Sprite lol : lollipop){
    if (pointInCircle(mouseX, mouseY,lol.C, lol.r)){
      lol.C = new Pt(mouseX, mouseY);
      lol.respiration();
    }
   }
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
  }// add beat star1
  if (key == 'b' || key == 'B'){
    Sprite lol = lollipop.get(1);
    lol.addBeat();
    lol.anchor = OFF;
  }// add beat star2
  if (key == 'c' || key == 'C'){
    Sprite lol = lollipop.get(2);
    lol.addBeat();
    lol.anchor = OFF;
  }// add beat star3
  if (key == 'd' || key == 'D'){
    Sprite lol = lollipop.get(3);
    lol.addBeat();
    lol.anchor = OFF;
  }// add beat star4
  if (key == '=' || key == '+'){
    Sprite lol = new Sprite();
    lollipop.add(lol);
  }  // add circle
  if (key == ' '){
    exodus();
  }  // control divergence/convergence
}


void keyReleased(){
  
}