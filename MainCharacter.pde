/** Clase que maneja los diferentes aspectos del MainCharacter */
class MainCharacter extends GameObject implements IVisualizable {
  /* Declaracion de atributos */
  float radio = 30;
  private SpriteGestor spriteGestor= new SpriteGestor();;

/* Metodo que permite mover al personaje */
  void mover(float mouseX, float posY) {
    setX(constrain(mouseX, 0, width));    //La posicion en X depende de la pocicion en X del mouse
    setY(constrain(posY, 0, height));    //La posicion en Y es una posicion fija
  }
  
/* Metodo que permite vizualisar al MainCharacter */
  void display(){
    spriteGestor.animarMainCharacter(x,y);
  }
  
  /** Metodo que nos indica el area de colision de MainCharacter*/
  void colicionador() {
    fill(0, 0, 255);
    noFill();
    //ellipse(x, y, radio*2, radio*2);
  }
  /* Metodo que verifica la colicion de MainCharacter con NotaMusical */
  public boolean colisionNotaMusical(NotaMusical c) {
    float distancia = dist(x, y, c.x, c.y);
    return distancia < (radio*2) / 2 + c.radio / 2;
  }
  
   /* Metodo que verifica la colicion de MainCharacter con NotaDesafinada */
  public boolean colisionNotaDesafinada(NotaDesafinada c) {
    float distancia = dist(x, y, c.x, c.y);
    return distancia < (radio*2) / 2 + c.radio / 2;
  }
}
