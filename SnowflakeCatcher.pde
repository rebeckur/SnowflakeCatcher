Snowflake [] cluster;

void setup()
{
  //your code here
  size(400, 500);

  cluster = new Snowflake[100];
  for (int i = 0; i < cluster.length; i++)
  {
    cluster[i] = new Snowflake(); 
  }
}
void draw()
{
  //your code here
  background(0);
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
}

class Snowflake
{
  //class member variable declarations
  int snowX, snowY;
  boolean isMoving;
  Snowflake()
  {
    //class member variable initializations
    snowX = (int)(Math.random()*401);
    snowY = (int)(Math.random()*501);
    isMoving = true;
  }
  void show()
  {
    //your code here
    fill(255);
    ellipse(snowX, snowY, 5, 5);
  }
  void lookDown()
  {
    //your code here
    if ((snowY >= 0 && snowY < 500) && get(snowX, snowY+4) != color(0))
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
    fill(0);
    ellipse(snowX, snowY, 7, 7);
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
    if (snowY > 500)
    {
      snowY = 0;
      snowX = (int)(Math.random()*401);
    }
  }
}


