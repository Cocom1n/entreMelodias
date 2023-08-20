/* Clase que permite controlar distintos aspectos del escenario del juego */
class Escenario extends GameObject implements IVisualizable{
  private AnimacionFondo [] capas; //se establece un Array para guardar las partes del fondo
  
  /* Constructor por defecto */
  public Escenario(){
    //Se cargan las imagenes necesarias para cada parte que compone el escenario.
    capas = new AnimacionFondo[6];
    capas[0]=new AnimacionFondo(0,0,0,"data/estrellas.jpg"); 
    capas[1]=new AnimacionFondo(100, width, 0,"data/nubeMov1.png");
    capas[2]=new AnimacionFondo(100, 0,0,"data/nubeMov1.png");
    capas[3]=new AnimacionFondo(200,0,0,"data/nubeMov2.png");
    capas[4]=new AnimacionFondo(200,width,0,"data/nubeMov2.png");
    capas[5]=new AnimacionFondo(0,0,0,"data/EsenaFija1.png");
    
    /* Se cargan los datos para crear la hud sobre el escenario */
    this.imagen = loadImage("data/HUDJuego.png");
    setX(0);
    setY(0);
    setTamanio(new PVector(width,height));
  }
  
  /* Metodo que permite vizualisar y recorrer el arreglo del efecto paralax */
  public void displayFondo(float deltaTime){
    for(AnimacionFondo layer:capas){
      layer.display();
      layer.updatePosition(deltaTime);
    }
  }
  /* Metodo que permite vizualisar una interfas sobre el escenario */
  public void display (){
    imageMode(CORNER);
    image(imagen, this.x, this.y,this.tamanio.x,this.tamanio.y);
  }
}
