class Obstacles
{
  PVector pos;
  color   colour;
  float   scal ;
  float   prog ;
  float   cirWidth ;
  float   cirHeight ;
  float   halfWidth  = width/2  ;
  float   halfHeight = height/2 ;
  
  Obstacles()
  {
    pos = new PVector();
    
  }
  
  Obstacles(color colour,float cirWidth,  float cirHeight,float scal, float prog ,  float halfWidth , float halfHeight )
  {
    this();
    this.colour     = colour;
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
    this.scal       = scal;
    this.prog       = prog;
    this.halfWidth  = halfWidth;
    this.halfHeight = halfHeight;
  }
  
  Obstacles(float cirWidth, float cirHeight )
  {
    this(); 
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
  }
  
  void update()
  {
    if(pos.y+prog >= height+cirHeight)
    {
      pos.x = random(obsWidth,width-obsWidth);
      scal = 1.005;
      
      cirWidth = obsWidth;
      cirHeight = obsHeight;
      prog=0;
    }
    else
    {
      scal = 1.003;
      
      cirWidth = cirWidth*scal;
      cirHeight = cirHeight*scal;
    }
  }
  
  void display()
  {
    noFill();
    ellipse(pos.x,pos.y+prog,cirWidth,cirHeight);
    prog = prog + 3f;
  }
}
