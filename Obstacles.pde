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
  int     index;
  
  Obstacles()
  {
    pos = new PVector();
    
  }
  
  Obstacles(int index,color colour,float cirWidth,  float cirHeight,float scal, float prog ,  float halfWidth , float halfHeight )
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
  
  Obstacles(int index,float cirWidth, float cirHeight )
  {
    this(); 
    this.index      = index;
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
  }
  
  void update()
  {
    if(pos.y+prog< halfHeight/2)
    {
      pos.x *= 1.001;
    }
    else if((pos.y+prog< halfHeight))
    {
      pos.x *= 1.002;
    }
    else if(pos.y+prog > halfHeight)
    {
      pos.x /= 1.001;
    }
    else if((pos.y+prog > (3*(halfHeight/2))))
    {
      pos.x *= 1.003;
    }
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
    PImage Ast = loadImage("ast2.png");
    noFill();
    image(Ast,pos.x,pos.y+prog,cirWidth,cirHeight);
    prog = prog + 3f;
  }
}
