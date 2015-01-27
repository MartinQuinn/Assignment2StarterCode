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
float obsWidth  = width/16;
float obsHeight = width/16;
PImage crash;
PImage Ast;
PImage Star;
PImage MainMenu;
int OBSTACLE_COUNT;
boolean GameOn = true;
boolean meteorDead;
int lives = 0;
int score = 0;


void setup()
{
  obsWidth  = width/16;
  obsHeight = width/16;
  size(800, 640, P2D);
  setUpPlayerControllers();
  intialiseObstacles();
  
  // Load the image
  sprite = loadImage("sprite.png");
  Ast = loadImage("ast2.png");
  Star = loadImage("starBonus.png");
  // A new particle system with particles
  ps = new ParticleSystem(65);
 

  // Writing to the depth buffer is disabled to avoid rendering
  // artifacts due to the fact that the particles are semi-transparent
  // but not z-sorted.
  hint(DISABLE_DEPTH_MASK);
}




void draw()
{
  gameMenu();
  if(GameOn==true)
  {
          
    
  
    background(0);
    // Update and display system
    
    for(Obstacles Obstacles:obstacles)
    {
      Obstacles.display();
      Obstacles.update();
      hitDetection();
      
    }
    
    
    for(Player player:players)
    {
      ps.update();
      ps.display();
      player.update();
      player.display();
      
    }
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
  
  for(int i = 0 ; i < 1 ; i ++)  
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
  OBSTACLE_COUNT = 10;
  meteorDead=false;
  for(int i = 0; i < OBSTACLE_COUNT; i++) 
  {
    obstacles.add(new Obstacles());
  } 
  
  PowerUP p1 = new PowerUP(1,obsWidth,obsHeight);
  p1.pos.x= random(-obsWidth*2,width-(obsWidth*2));
  p1.pos.y= random(-125,-25);
  obstacles.add(p1);
  
  
}

void gameMenu()
{
  background(0);
  PImage MainMenu = loadImage("MainMenu.png");
  image(MainMenu,width/6,height/10,2*height/3,width/5);
  
  rect(width/4,2*height/5,width/2,height/10,width/100);
  
  rect(width/4,3*(height/5),width/2,height/10,width/100);
  rect(width/4,4*(height/5),width/2,height/10,width/100);
  
  
}
  
void hitDetection()
{
    
    for(int i=0; i< players.size();i++)
    {
      
      Player player1 = players.get(i);
  
      for(int j=0; j< obstacles.size();j++)
      {
        Obstacles obstacles1 = obstacles.get(j);
        if(dist(player1.pos.x,player1.pos.y,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 50)
        {
          lives = lives -1;
          meteorDead = true;
          println(meteorDead);
          
        }
      }
      for(int j=0; j< powerUP.size();j++)
      {
        PowerUP powerup1 = powerUP.get(j);
        if(dist(player1.pos.x,player1.pos.y,powerup1.pos.x,powerup1.pos.y+powerup1.prog)<= 5)
        {
          score = score +1;
          println(lives);
          
        }
      }
    }
}

