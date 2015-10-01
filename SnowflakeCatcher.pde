Snowflake [] cluster;

void setup()
{
  //your code here
  size(500, 700);
  background(0);
  cluster = new Snowflake[100];
  for (int i = 0; i < cluster.length; i++)
  {
    cluster[i] = new Snowflake(); 
  }
}
void draw()
{
  //your code here
  for (int j = 0; j < cluster.length; j++)
  {
    cluster[j].erase();
    cluster[j].lookDown();
    cluster[j].move();
    cluster[j].wrap();
    cluster[j].show();
  }
}
void mouseDragged()
{
  //your code here
  stroke(155, 200, 224);
  strokeWeight(2);
  fill(155, 200, 224);
  ellipse(mouseX, mouseY, 7, 7);
}

class Snowflake
{
  //class member variable declarations
  int snowX, snowY;
  boolean isMoving;

  int opa = 1200;
  int eraseOpacity = 300;

  Snowflake()
  {
    //class member variable initializations
    snowX = (int)(Math.random()*500);
    snowY = (int)(Math.random()*701);
    isMoving = true;
  }
  void show()
  {
    //your code here
    noStroke();
    fill(255, 255, 255, opa);
    ellipse(snowX, snowY, 5, 5);
    if (isMoving == false)
    {
      opa-=25;
      if (opa < 0)
      {
        snowY = 0;
        snowX = (int)(Math.random()*501);
        opa = 1200;
      }
    }
  }
  void lookDown()
  {
    //your code here
    if ((snowY >= 0 && snowY < 700) && (get(snowX, snowY+4) != color(0,0,0,300)))
    {
      isMoving = false;
    }
    else
    {
      isMoving = true;  
    }

  }
  void erase()
  {
    //your code here
    if (isMoving = false)
    {
      eraseOpacity = -10;
    }
    else
    {
      noStroke();
      fill(0, 0, 0);
      ellipse(snowX, snowY, 7, 8);
    }
  }
  void move()
  {
    //your code here
    if (isMoving == true)
    {
      snowY++;
    }
  }
  void wrap()
  {
    //your code here
    if (snowY >= 696)
    {
      snowY = 0;
      snowX = (int)(Math.random()*501);
    }
  }
}


