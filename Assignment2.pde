/*
    Martin Quinn DT228/2
    C13477058
*/

ArrayList<Player>    players   = new ArrayList<Player>();
ArrayList<Obstacles> obstacles = new ArrayList<Obstacles>();
ArrayList<PowerUP> powerUP = new ArrayList<PowerUP>();
boolean[] keys = new boolean[526];
ParticleSystem ps;
PImage sprite; 
float obsWidth  = width/16;
float obsHeight = width/16;

PImage Ast;
PImage Star;
PImage MainMenu;
PImage GameInfo;
int OBSTACLE_COUNT;
int POWUP_COUNT;
boolean GameOn = false;
boolean GameOver = false;
boolean meteorDead;
boolean player1 = false;
boolean player2 = false;
boolean spawn = false;
int lives = 1;
int score = 0;
PFont gamefont; //declaring font variable

import ddf.minim.*;

Minim minim;
AudioPlayer movement;
AudioPlayer pow;
AudioPlayer crash;

boolean devMode = true;
boolean sketchFullScreen() {
  return ! devMode;
}



void setup()
{
  minim = new Minim(this);

  // this loads files from the data folder
  movement = minim.loadFile("movement.wav");
  pow = minim.loadFile("Powerup.wav");
  crash = minim.loadFile("explosion.wav");
  gamefont = loadFont("SpaceAge.vlw");
  
  
  obsWidth  = width/16;
  obsHeight = width/16;
  if (devMode)
  {
    size(800, 640,P2D);
  }
  else
  {
    size(displayWidth, displayHeight,P2D);
  }
  //size(800, 640, P2D);
  setUpPlayerControllers();
  intialiseObstacles();
  
  // Load the images
  sprite = loadImage("sprite.png");
  Ast = loadImage("ast2.png");
  Star = loadImage("starBonus.png");
  GameInfo = loadImage("menuinfo.png");
  // new particle system 
  ps = new ParticleSystem(45);
  hint(DISABLE_DEPTH_MASK);
}




void draw()
{
  if (GameOver == true)
  {
    gameOver();
  }
    
  if(GameOn==true && player1 == true && spawn == true && GameOver == false)
  {
    setUpPlayerControllers();
    spawn = false;
  }
  if(GameOn==true && player2== true && spawn == true && GameOver == false)
  {
    setUpPlayerControllers();
    spawn = false;
  }
  if(GameOver == false)
  {
    gameMenu();
  }
  if(GameOn==true && GameOver == false)
  {
   
  
    background(0);
    // Update and display system
     fill(255);      
     textSize(15);
    text("score:" + score ,width/20,height/20);
    text("lives:" + lives ,width/20,2*height/20);
    
    for(Obstacles Obstacles:obstacles)
    {
      Obstacles.display();
      Obstacles.update();
      hitDetection();
      
    }
    
    for(PowerUP PowerUP:powerUP)
    {
      PowerUP.display();
      PowerUP.update();
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
  if ("START".equalsIgnoreCase(value))
  {
    return 'q';
  }
  //  
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
  int num =0;
  //int gap = width / (children.length + 1);
  if(player1 == true)
  {
    num=1;
  }
  else if(player2 == true)
  {
    num =2;
  }
  for(int i = 0 ; i < num ; i ++)  
    {
      XML playerXML = children[i];
      Player p = new Player(i, color(255), playerXML);
      int y = (i + 1) * gap;
      p.pos.x = height/3;
      p.pos.y = y;
      players.add(p);
      if(GameOver==true)
      {
        players.remove(p);
      }      
    }
}

void intialiseObstacles()
{  
  
    OBSTACLE_COUNT = (int)random(5,10);
    POWUP_COUNT    = (int)random(1,4);
    meteorDead=false;
    for(int i = 0; i < OBSTACLE_COUNT; i++) 
    {
      obstacles.add(new Obstacles());
    } 
    
    for(int i = 0; i < POWUP_COUNT; i++) 
    {
      powerUP.add(new PowerUP());
    } 
 
}

void gameMenu()
{
  
  PImage MainMenu = loadImage("menucanvas.png");
  background(MainMenu);
    if (checkKey('q'))
    {
      if(player1 == true || player2 == true)
      {
        
      }
      else
      {
        player1 = true;
        GameOn = true;
        spawn = true;
      }
      
      
    }
    if (checkKey('e'))
    {
      if(player1 == true || player2 == true)
      {
        
      }
      else
      {
        player2 = true;
        GameOn = true;
        spawn = true;
      }
       
    }
    if (checkKey('r'))
    {
      background(GameInfo);
    }

}
  
void hitDetection()
{
    
    for(int i=0; i< players.size();i++)
    {
      
      Player player1 = players.get(i);
  
      for(int j=0; j< obstacles.size();j++)
      {
        Obstacles obstacles1 = obstacles.get(j);
        if(dist(player1.pos.x,player1.pos.y,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-70,player1.pos.y-40,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-70,player1.pos.y+40,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-90,player1.pos.y-60,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-90,player1.pos.y+60,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-110,player1.pos.y-60,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-110,player1.pos.y+60,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 20 ||
           dist(player1.pos.x-110,player1.pos.y,obstacles1.pos.x-obstacles1.prog,obstacles1.pos.y)<= 30)
        {
          obstacles1.pos.x = random(width,width*2);
          obstacles1.prog = 0;
          obstacles1.pos.y = random(0,height);
          lives--;
          
          println(meteorDead);
          println(lives);
          crash.play();
          crash.rewind();
          if(lives <= 0);
          {
            GameOver = true;
          }
          
        }
        for(int index=0; index< powerUP.size();index++)
        {
          PowerUP powerup1 = powerUP.get(index);
          if(dist(player1.pos.x,player1.pos.y,powerup1.pos.x+(obsWidth/2),powerup1.pos.y+powerup1.prog)<= 50)
          {
            score = score +1;
            
            powerup1.pos.x = random(width/2,width-obsWidth);
            powerup1.pos.y = random(-height,0-obsWidth);
            powerup1.prog = 0;
            println(score);
            pow.play();
            pow.rewind();
            
          }
        }
      }
      
    }
}

void gameOver()
{
  background(0);
  fill(255);
  textAlign(CENTER);
  textFont(gamefont, width/10);
  text("GAME OVER!", width/2, height/2);
  text("Score:"+score,width/2, 2*height/3);
  
    if (checkKey('q'))
    {
        player1 = true;
        GameOn = true;
        spawn = true;
        GameOver = false;
      
    }
    if (checkKey('e'))
    {

        player2 = true;
        GameOn = true;
        spawn = true;
        GameOver = false;
     
    }
    if (checkKey('r'))
    {
      
    }

}
