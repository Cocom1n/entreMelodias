/* Clase que maneja diferentes acciones de las notas musicales*/

class NotaMusical extends GameObject implements IVisualizable {
  
  /* Declaracion de atributos */
  float radio;
  
  /* Constructor por defecto */
public NotaMusical(){
  this.imagen = loadImage("data/NotaMusical.png");
  radio=21;
  setX(random(45,width-45));
  setY(-50);
  setVelocidad(random(3, 5));
}

/* Método que permite desplazar la nota en el eje Y */
  void caer() {
    y += velocidad;
  }

/* Metodo que permite vizualisar la nota musical en la posicion y con el tamaño corespondiente */
  void display() {
    imageMode(CENTER);
    image(imagen, x, y,radio*2,radio*2);
  }
}
