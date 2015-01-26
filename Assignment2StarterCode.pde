/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<Player>    players   = new ArrayList<Player>();
ArrayList<Obstacles> obstacles = new ArrayList<Obstacles>();
ArrayList<PowerUP> powerUP = new ArrayList<PowerUP>();
boolean[] keys = new boolean[526];
// Particle System object
ParticleSystem ps;
// A PImage for particle's texture
PImage sprite; 
float obsWidth  = 60;
float obsHeight = 50;
PImage crash;
PImage Ast;
PImage Star;



void setup()
{
  size(800, 640, P3D);
  setUpPlayerControllers();
  intialiseObstacles();
  
  // Load the image
  sprite = loadImage("sprite.png");
  // A new particle system with particles
  ps = new ParticleSystem(65);
 

  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
}




void draw()
{
  

  background(0);
  // Update and display system
  
  for(Obstacles Obstacles:obstacles)
  {
    
    Obstacles.update();
    Obstacles.display();
  }
  
  
  for(Player player:players)
  {
    ps.update();
    ps.display();
    player.update();
    player.display();
    
  }
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //  this.start = start;
  //  this.button1 = button1;
  //  this.button2 = button2;
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = height/3;
  //int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(i, color(255), playerXML);
    int y = (i + 1) * gap;
    p.pos.x = height/3;
    p.pos.y = y;
    players.add(p);         
  }
}

void intialiseObstacles()
{
  Obstacles o1 = new Obstacles(1,obsWidth,obsHeight);
  o1.pos.x= random(-obsWidth*2,width-(obsWidth*2));
  o1.pos.y= random(0,500);
  obstacles.add(o1);
  
  Obstacles o2 = new Obstacles(2,obsWidth,obsHeight);
  o2.pos.x= random(-obsWidth*2,width-(obsWidth*2));
  o2.pos.y= random(-125,-25);
  obstacles.add(o2);
  
  Obstacles o3 = new Obstacles(3,obsWidth,obsHeight);
  o3.pos.x= random(-obsWidth*2,width-(obsWidth*2));
  o3.pos.y= random(-125,-25);
  obstacles.add(o3);
  
  PowerUP p1 = new PowerUP(1,obsWidth,obsHeight);
  p1.pos.x= random(-obsWidth*2,width-(obsWidth*2));
  p1.pos.y= random(-125,-25);
  obstacles.add(p1);
  
  
}


