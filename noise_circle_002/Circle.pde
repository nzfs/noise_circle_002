class Circle {

  float rad = 0; 
  float angulo;
  float x = 0;
  float y = 0;
  float centerX = 0;
  float centerY = 0;
  float radNoise = random(10);
  float radNoiseDev = 100;
  float lastX = -999;
  float lastY = -999;

  float strokeCol;
  float strokeNoise;
  float brg;

  float centerNoiseX = random(10);
  float centerNoiseY = random(10);

  int hue = 0;
  int hueVar = 0;

  Circle() 
  {
    centerX = width/2;
    centerY = height/2;
    strokeWeight(0.7);
  }

  void col(int _hue, int _hueVar) 
  {
    hueVar = _hueVar;
    hue = _hue;
  }

  void render(int _centerX, int _centerY, int _rep, int _freq, boolean _centerNoise)
  {

    for (int j = 0; j < _rep; j++)
    {

      if (_centerNoise == true)
      {
        _centerX += noise(centerNoiseX) * 6 - 3;
        _centerY += noise(centerNoiseY) * 6 - 3;
        centerNoiseX += 0.01;
        centerNoiseY += 0.02;
      }

      // reestablezco los valores para el proximo circulo
      rad = 100;
      x = 0;
      y = 0;
      lastX = -999;
      lastY = -999;
      radNoiseDev += 10;

      // dibujo un circulo completo la cantidad de veces que determina la variable freq
      for (int i = 0; i < 360 * _freq; i+=1)
      {
        float radius = rad + (noise(radNoise)*radNoiseDev)-radNoiseDev/2;
        x = _centerX + radius * cos(radians(i));
        y = _centerY + radius * sin(radians(i));


        strokeCol = -sin(radians(i)) * hueVar + hue;

        brg = cos(radians(i)) * 25 + 75;

        stroke(strokeCol, 100, brg, 4); // HSBA

        if (lastX > -999) 
        {
          line(x, y, lastX, lastY);
        }
        lastX = x;
        lastY = y;

        radNoise += 0.005;
        rad += 0.01;
      }
    }
  }
}
