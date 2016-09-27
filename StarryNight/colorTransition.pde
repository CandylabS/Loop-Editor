int redC(color c) {return int (c >> 16 & 0xFF); } 
int greenC(color c) {return int (c >> 8 & 0xFF); }  
int blueC(color c) {return int (c & 0xFF); }

color pop(int range){
  int[] rgb = new int[3];
  rgb[0] = 14 + 100 - range;
  rgb[1] = 48 + 100 - range;
  rgb[2] = 100 + 100 - range;
  //rgb[0] = 14;
  //rgb[1] = 48;
  //rgb[2] = 100;
  return color(rgb[0], rgb[1], rgb[2]);
}

color bcolor(int range){
  int[] rgb = new int[3];
  rgb[0] = 255;
  rgb[1] = 163 + (100 - range) * 2;
  rgb[2] = 144 - (100 - range) * 2;
  //rgb[0] = 255;
  //rgb[1] = 163;
  //rgb[2] = 144;
  return color(rgb[0], rgb[1], rgb[2]);
}