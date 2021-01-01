Circle circ;
int[] circArray;
int nIteraciones = 1;

void setup() 
{
  size(1080, 1080);
  background(40);
  colorMode(HSB, 360, 100, 100, 255);
  circ = new Circle();
  circArray = new int[10];
}


void draw() 
{
  for (int j = 0; j < nIteraciones; j++)
  {
    background(40);
    for (int i = 0; i < circArray.length; i++)
    {
      circ.col(230 + (j * 10), 2*i);
      circ.render((int)random(width), (int)random(height), 10, 100, true);
    }
    saveFrame("frame" + random(10) + ".jpg");
  }
  noLoop();
  exit();
}
