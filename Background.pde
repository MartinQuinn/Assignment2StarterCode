class Background extends Obstacles
{
  PVector pos;
  color   colour;
  float   scal ;
  float   prog ;
  float   cirWidth ;
  float   cirHeight ;
  float   halfWidth  = width/2  ;
  float   halfHeight = height/2 ;
  int     index ;
  
  Background()
  {
    pos = new PVector();
  }
  
  Background(int index,color colour,float cirWidth,  float cirHeight,float scal, float prog ,  float halfWidth , float halfHeight )
  {
    this();
    this.index      = index;
    this.colour     = colour;
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
    this.scal       = scal;
    this.prog       = prog;
    this.halfWidth  = halfWidth;
    this.halfHeight = halfHeight;
  }
  
  Background(int index,float cirWidth, float cirHeight )
  {
    this(); 
    this.index      = index;
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
    PImage Star = loadImage("starBonus.png");
    noFill();
    image(Star,pos.x,pos.y+prog,cirWidth,cirHeight);
    prog = prog + 3f;
  }
}