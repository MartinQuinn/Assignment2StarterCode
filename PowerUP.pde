class PowerUP extends Obstacles
{
  PowerUP()
  {
    pos = new PVector();
    
  }
  
  PowerUP(int index,color colour,float cirWidth,  float cirHeight, float prog ,  float halfWidth , float halfHeight )
  {
    this();
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
    this.prog       = prog;
    this.halfWidth  = halfWidth;
    this.halfHeight = halfHeight;
    setupSpawn();
  }
  
 
  void update()
  {
    if(pos.y+prog >= height+cirHeight)
    {
      pos.x = random(obsWidth,width-obsWidth);
      
      
      cirWidth = obsWidth;
      cirHeight = obsHeight;
      prog=0;
    }
    else
    {
      
      cirWidth = cirWidth;
      cirHeight = cirHeight;
    }
  }
  
  void display()
  {
    
    noFill();
    image(Star,pos.x,pos.y+prog,obsWidth,obsHeight);
    prog = prog + 3f;
  }
  
  void setupSpawn()
  {
    
    this.pos = new PVector(random(width/2, width), random(-height, -obsHeight));
    this.cirWidth   = obsWidth;
    this.cirHeight  = obsHeight;
  }
}
