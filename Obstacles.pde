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
  
  Obstacles(float cirWidth,  float cirHeight,float scal, float prog ,  float halfWidth , float halfHeight )
  {
    this();
    this.cirWidth   = cirWidth;
    this.cirHeight  = cirHeight;
    this.scal       = scal;
    this.prog       = prog;
    this.halfWidth  = halfWidth;
    this.halfHeight = halfHeight;
    setupSpawn();
  }
  
  
  void update()
  {
    if(pos.x-prog+obsWidth <= 0 )
    {
      
      pos.x = random(width,width*2);
      pos.y = random(0,height);
      scal = 1.005;
      prog=0;
      
    }
    
    else if( meteorDead == true)
    {
      pos.x = random(width,width*2);
      pos.y = random(0,height);
      scal = 1.005;
      prog=0;
      println(meteorDead);
      meteorDead=false;
    }
    
  }
  
  void display()
  {
    
    fill(0);
    stroke(255);
   // ellipse(pos.x+(cirWidth/2),pos.y+prog+(cirHeight/2),cirWidth-3,cirHeight-3);
    noFill();
    image(Ast,pos.x-prog,pos.y,obsWidth,obsHeight);
    
    prog = prog + 5 ;
  }
  
  void setupSpawn()
  {
    
    this.pos = new PVector(random(width, width *2), random(0, height));
    this.cirWidth   = obsWidth;
    this.cirHeight  = obsHeight;
  }
}
