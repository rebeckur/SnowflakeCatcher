Snowflake [] cluster;

void setup()
{
  //your code here
  size(400, 500);
  background(0);
  cluster = new Snowflake[80];
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
  stroke(25,100, 50);
  strokeWeight(2);
  fill(25,100, 50);
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
    snowX = (int)(Math.random()*400);
    snowY = (int)(Math.random()*501);
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
      opa-=20;
    }
  }
  void lookDown()
  {
    //your code here
    if ((snowY >= 0 && snowY < 500) && (get(snowX, snowY+4) != color(0)))
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
    noStroke();
    fill(0, 0, 0, eraseOpacity);
    ellipse(snowX, snowY, 8, 8);
    if (isMoving = false)
    {
      eraseOpacity-=100;
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
    if (snowY >= 496)
    {
      snowY = 0;
      snowX = (int)(Math.random()*401);
    }
  }
}


