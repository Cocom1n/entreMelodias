/* Clase que nos permite animar el fondo del escenario */

class AnimacionFondo extends GameObject implements IVisualizable {
  
  /* Constructor parametrizado */
  public AnimacionFondo(float velocidad, float x, float y , String pathImage){
    this.velocidad=velocidad;
    this.x=x;
    this.y=y;
    this.imagen = loadImage(pathImage);
    this.imagen.resize(width+4,height);
  }
  
  /* Zona de metodos */
  
  /* Metodo display que permite visualizar el efecto en pantalla */
  public void display(){
    imageMode(CORNER);
    image(this.imagen,this.x,this.y);
  }
 /* Metodo que permite actualizar la poscicion de los objetos */
  public void updatePosition(float deltaTime){
    this.x-=(this.velocidad*deltaTime); 
    if(this.x<-width){
      this.x=width;
    }
  }
}
