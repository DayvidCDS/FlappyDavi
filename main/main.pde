class Obj {
  private int lado;
  private int altura;
  private color cor;
  private int posicaoX;
  private int posicaoY;
  
  Obj(int plado, int paltura, color pcor, int px, int py) {
    this.lado = plado;
    this.altura = paltura;
    this.cor = pcor;
    this.posicaoX = px;
    this.posicaoY = py;
  }
  public void setPosition(int x, int y) {
    this.posicaoX = x;
    this.posicaoY = y;
  }
  public int getPositionX() {
    return this.posicaoX;
  }
  public int getPositionY() {
    return this.posicaoY;
  }
  public color getCor() {
    return this.cor;
  }
  public void axou() {
    rect(this.posicaoX, this.posicaoY, this.lado, this.altura);
  }
}

ArrayList <Obj> arrayObj = new ArrayList <Obj> ();

void setup() {
  size(displayWidth, displayHeight);
  textSize(42);
  rectMode(CENTER);
}

void draw() {
  background(0,0,0);
  for(int n = 0; n < arrayObj.size(); n++) {
    text(arrayObj.size(), 10, 30);
    int x = arrayObj.get(n).getPositionX();
    int y = arrayObj.get(n).getPositionY();
    if (y > height) {
      arrayObj.remove(n);
    }
    else {
       arrayObj.get(n).setPosition(x, y+10);
       fill(arrayObj.get(n).getCor());
       arrayObj.get(n).axou();
    }
  }
}

void mousePressed() {
  float r = random(.0f, 255.0f); 
  float g = random(.0f, 255.0f);
  float b = random(.0f, 255.0f);
  arrayObj.add(new Obj(150, 150, color(r, g, b), mouseX, mouseY));
}