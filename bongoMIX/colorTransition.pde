int redC(color c) {return int (c >> 16 & 0xFF); } 
int greenC(color c) {return int (c >> 8 & 0xFF); }  
int blueC(color c) {return int (c & 0xFF); }

color canvas(){
  int[] rgb = new int[3];
  int exp = 30 - stps/10;
  rgb[0] = 255;
  rgb[1] = 255 - int(pow(1.14, exp));
  rgb[2] = 255 - int(pow(1.18, exp));
  return color(rgb[0], rgb[1], rgb[2]);
}

//pop = color(210, 255, 140);
color pop(int range){
  int[] rgb = new int[3];
  rgb[0] = 210 - 100 + range;
  rgb[1] = 255 - 100 + range;
  rgb[2] = 140 - 100 + range;
  //rgb[0] = 210;
  //rgb[1] = 255;
  //rgb[2] = 140;
  return color(rgb[0], rgb[1], rgb[2]);
}

color bcolor(int range){
  int[] rgb = new int[3];
  rgb[0] = 255;
  rgb[1] = 163 + (100 - range) * 3;
  rgb[2] = 144 + (100 - range) * 3;
  //rgb[0] = 255;
  //rgb[1] = 163;
  //rgb[2] = 144;
  return color(rgb[0], rgb[1], rgb[2]);
}

// fix bug of respiration
void respiration(int stp){
    stps += stp; 
    canvas();
    for (Sprite lol: lollipop){
      if (lol.i >= stps){lol.i = stps - 1; lol.di = 1;}
        else if (lol.i <= stps/2){lol.i = stps/2 + 1; lol.di = -1;}
    }
}