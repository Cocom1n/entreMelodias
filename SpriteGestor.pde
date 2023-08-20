/* Clase que maneja los sprites de los personajes */

class SpriteGestor extends GameObject {
  
/** Declaracion de atributos */
  protected int xFrame; 
  protected int yFrame;
  protected int widthFrame;
  protected int heightFrame;     
  private float xFrameFloat;
  private float nextxFrameFloat;  
  private float velTransicion;
  
  /* Constructor por defecto */
  public SpriteGestor() {
   this.imagen = loadImage("data/chopinsprite.png");
   this.widthFrame=61;
   this.heightFrame=107;
   this.xFrame=0;
   this.yFrame=0;
   this.xFrameFloat=0;
   this.nextxFrameFloat=widthFrame;
   this.velTransicion=3;
  }
 /* Metodo que anima al MainCharacter */
  public void animarMainCharacter(float posx, float posy) {
    imageMode(CENTER);
    int framesPorSegundo = round(frameRate); //calculo del delta time
    float deltaTime = 1.0/framesPorSegundo;
    this.yFrame=0;
    image(imagen.get(this.xFrame, yFrame, widthFrame, heightFrame), posx, posy);
    xFrameFloat+=(widthFrame*velTransicion*deltaTime);
    if (xFrameFloat>=nextxFrameFloat) {
      this.xFrame+=this.widthFrame;
      nextxFrameFloat=xFrame+this.widthFrame;
    if (this.xFrame>=this.imagen.width) {
      this.xFrame=0;
      this.xFrameFloat=0;
      this.nextxFrameFloat=this.widthFrame;
    }
  }
}
  /* Metodo que anima al Enemy */
  public void animarEnemy (float posx, float posy, String imgEnemy) {
    imageMode(CENTER);
    PImage spritEnemy = loadImage(imgEnemy);
    int framesPorSegundo = round(frameRate);
    float deltaTime = 1.0/framesPorSegundo;
    this.widthFrame=84;
    this.heightFrame=117;
    this.yFrame=0;
    image(spritEnemy.get(this.xFrame, yFrame, widthFrame, heightFrame), posx, posy);
     xFrameFloat+=(widthFrame*velTransicion*deltaTime);
     if (xFrameFloat>=nextxFrameFloat) {
     this.xFrame+=this.widthFrame;
     nextxFrameFloat=xFrame+this.widthFrame;
     if (this.xFrame>=spritEnemy.width) {
       this.xFrame=0;
       this.xFrameFloat=0;
       this.nextxFrameFloat=this.widthFrame;
       }
     }
   }
}
