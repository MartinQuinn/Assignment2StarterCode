class Player
{
  PVector pos;
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int  index;
  color colour;

    
  Player()
  {
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index   = index;
    this.colour  = colour;
    this.up      = up;
    this.down    = down;
    this.left    = left;
    this.right   = right;
    this.start   = start;
    this.button1 = button1;
    this.button2 = button2;
  }
 
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    if (checkKey(up))
    {
      pos.y -= 5;
    }
    if (checkKey(down))
    {
      pos.y += 5;
    }
    if (checkKey(left))
    {
      pos.x -= 5;
    }    
    if (checkKey(right))
    {
      pos.x += 5;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
      
    }
    if (checkKey(button2))
    {
      //bullet();
      println("Player " + index + " button 2");
    }    
  }
  
  void display()
  {    
    ship();
  }  
  
  void ship()
  {
    stroke(colour);
    ellipse(pos.x-70,pos.y,100,100);
    line(pos.x,pos.y,pos.x-100,pos.y);              //centre line**
    line(pos.x,pos.y,pos.x-100,pos.y+40);           //right wing inner**
    line(pos.x,pos.y,pos.x-100,pos.y-40);           //left wing inner**
    line(pos.x,pos.y,pos.x-50,pos.y+10);            //inside cockpit right
    line(pos.x-50,pos.y+10,pos.x-100,pos.y);
    line(pos.x,pos.y,pos.x-50,pos.y-10);            //inside cockpit left
    line(pos.x-50,pos.y-10,pos.x-100,pos.y);
    line(pos.x-50,pos.y+20,pos.x-100,pos.y);        //right side middle triangle
    line(pos.x-55,pos.y+20,pos.x-95,pos.y+5);
    line(pos.x-50,pos.y-20,pos.x-100,pos.y);        //left side middle triangle
    line(pos.x-55,pos.y-20,pos.x-95,pos.y-5);
    line(pos.x-50,pos.y+20,pos.x-95,pos.y+50);      //right outer wing**
    line(pos.x-50,pos.y-20,pos.x-95,pos.y-50);      //left outer wing**
    line(pos.x-100,pos.y+40,pos.x-100,pos.y-40);    // bottom line
    line(pos.x-105,pos.y+22,pos.x-105,pos.y-22);    // smaller bottom line  
    line(pos.x-100,pos.y+20,pos.x-110,pos.y+25);    //end right exhaust
    line(pos.x-100,pos.y-20,pos.x-110,pos.y-25);    //end left exhaust
    line(pos.x-95,pos.y+50,pos.x-110,pos.y+25);     //right slant
    line(pos.x-95,pos.y-50,pos.x-110,pos.y-25);     //right slant
    line(pos.x-100,pos.y+40,pos.x-115,pos.y+40);    //right boosters
    line(pos.x-115,pos.y+40,pos.x-115,pos.y+33);    //right boosters
    line(pos.x-115,pos.y+33,pos.x-104,pos.y+33);    //right boosters
    line(pos.x-100,pos.y-40,pos.x-115,pos.y-40);    // left boosters
    line(pos.x-115,pos.y-40,pos.x-115,pos.y-33);    // left boosters
    line(pos.x-115,pos.y-33,pos.x-104,pos.y-33);    // left boosters
    
    
    ps.setEmitter(pos.x-100,pos.y);
    
  }
  
  
    
}
