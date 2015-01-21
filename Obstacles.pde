class Obstacles
{
  PVector pos;
  color colour;
  float   scal ;
  float   prog ;
  float   cirWidth ;
  float   cirHeight ;
  float   halfWidth  = width/2  ;
  float   halfHeight = height/2 ;
  
  Obstacles()
  {
    pos = new PVector(halfWidth,halfHeight);
    this.scal       = scal;
    this.prog       = prog;
  }
  
  Obstacles(float scal, float prog ,float cirWidth,  float cirHeight ,  float halfWidth , float halfHeight )
  {
    this();
   
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
    this.halfWidth  = halfWidth;
    this.halfHeight = halfHeight;
  }
  
  Obstacles(float cirWidth, float cirHeight ,color colour)
  {
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
  }
  
  void update()
  {
    scal = 1.5;
    
    cirWidth = cirWidth*scal;
    cirHeight = cirHeight*scal;
  }
  
  void display()
  {    
    
    noFill();   
    ellipse(pos.x,pos.y+prog,cirWidth,cirHeight);
    prog = prog + 0.5f;
  }  
}
