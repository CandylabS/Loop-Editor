// for convergence 
void exodus(){ 
    for(Sprite lol : lollipop){
      lol.C = new Pt(canvas_w/2, canvas_h/2);
    }
}  
void collision(){
  for (Sprite A : lollipop){
    for (Sprite B : lollipop){
      if (A!=B) {isCollide(A, B);}
    }
  }
}

void isCollide(Sprite A, Sprite B){
  for (int i=0; i < A.beatList.size(); i++){
    for (int j=0; j < B.beatList.size(); j++){
      Bt b1 = A.beatList.get(i);
      Bt b2 = B.beatList.get(j);
      float x1 = XY(b1, A).x;
      float y1 = XY(b1, A).y;
      float x2 = XY(b2, B).x;
      float y2 = XY(b2, B).y;
      if (dist(x1, y1, x2, y2) <= (A.rr + B.rr)){
        A.destroy(b1, i);
        B.destroy(b2, j);
      }
    }
  }
}

Pt XY(Bt b, Sprite lol){
  float x = lol.C.x + lol.r * sin(b.angle + lol.angle);
  float y = lol.C.y + lol.r * cos(b.angle + lol.angle);
  return new Pt(x, y);
}  // turn relative xy to real xy

// each frame has collision

boolean pointInCircle(float a, float b, Pt C, float r)
{  if (dist(a, b, C.x, C.y) <= r) {return true;} 
   else {return false;}
}