class Obstacles
{
  PVector pos  ;
  float   scal ;
  float   prog ;
  float   cirWidth   = 150      ;
  float   cirHeight  = 50       ;
  float   halfWidth  = width/2  ;
  float   halfHeight = height/2 ;

    
  Obstables()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Obstables(PVector pos,float scal, float prog ,float cirWidth,  float cirHeight ,  float halfWidth , float halfHeight )
  {
    this();
    this.scal       = scal;
    this.prog       = prog;
    this.cirWidth   = cirWitdh;
    this.cirHeight  = cirHeight;
    this.halfWidth  = halfwidth;
    this.halfHeight = halfHeight;
  }
  
  Obstables(int index, color colour, XML xml)
  {
    
  }
  
  void update()
  {
    
  }
  
  void display()
  {    
    scal = 1.5; 
    noFill();
    float increaseCirW = cirWidth*scal;
    float increaseCirH = cirHeight*scal;
    ellipse(halfWidth,halfHieght+prog,increaseCirW,increaseCirH);
    prog = prog +1;
    
  }  
}
