class Obj {
  private int lado;
  private int altura;
  private color cor;
  private int posicaoX;
  private int posicaoY;
  private PImage img;

  Obj(int plado, int paltura, color pcor, int px, int py, PImage pimg) {
    this.lado = plado;
    this.altura = paltura;
    this.cor = pcor;
    this.posicaoX = px;
    this.posicaoY = py;
    this.img = pimg;
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
    //rect(this.posicaoX, this.posicaoY, this.lado, this.altura);
    this.img.resize(this.lado, this.altura);
    image(this.img, this.posicaoX, this.posicaoY);
  }
}

ArrayList <Obj> arrayObj = new ArrayList <Obj> ();
PImage passarin, back;

void setup() {
  size(displayWidth, displayHeight);
  textSize(42);
  rectMode(CENTER);
  passarin = loadImage("imagens/passarin.png");
  back = loadImage("imagens/back.jpg");
  back.resize(displayWidth, displayHeight);
}

void draw() {
  background(back);
  for (int n = 0; n < arrayObj.size(); n++) {
    text(arrayObj.size(), 30, 60);
    int x = arrayObj.get(n).getPositionX();
    int y = arrayObj.get(n).getPositionY();
    if (y > height) {
      arrayObj.remove(n);
    } else {
      arrayObj.get(n).setPosition(x, y+5);
      //fill(arrayObj.get(n).getCor());
      arrayObj.get(n).axou();
    }
  }
}

void mousePressed() {
  float r = random(.0f, 255.0f); 
  float g = random(.0f, 255.0f);
  float b = random(.0f, 255.0f);
  arrayObj.add(new Obj(55, 40, color(r, g, b), mouseX, mouseY, passarin));
}