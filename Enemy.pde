
/* Clase que se encrga de controlar diferentes aspectos del enemigo */

class Enemy extends GameObject implements IVisualizable{
  
  private SpriteGestor spriteGestor; //Se llama a la clase SpriteGestor
  
  /* Constructor por defecto */
  public Enemy(){
    setX(width/2);
    setY(100);
    setTamanio(new PVector(84,117));
    this.spriteGestor = new SpriteGestor();
  }
  
  /* Metodo que permite vizualisar al enemigo y su animacion */
  public void display(){
    spriteGestor.animarEnemy(x,y,"data/betoSprite.png");
  }
  
  /* Metodo mueve al enemigo en la pantalla */
  public void mover(){
    this.velocidad = 2 ;
    this.x +=1*this.velocidad;
    if(this.x == width-30){ //si la posicion del enemigo es igual al borde de la pantalla
      this.x = 30;          //se mueve hasta el otro borde de la pantalla contrario
    }
  }
}
