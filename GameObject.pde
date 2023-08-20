/** Clase abstracta GameObject: Clase de la que nacen las otras clases.*/

/* Declaracion de atributos */
abstract class GameObject{
  protected float x,y;
  protected float velocidad;
  protected PVector tamanio;
  protected PImage imagen;


/* Zona de metodos accesores */

/** pocicion en X */
  public float getX() { // Permite obtener la posición de un objeto en X
    return this.x; 
  }
  public void setX(float x) { // Permite asignar una posicion al objeto
    this.x = x; 
  }
  
/** pocicion en Y */
  public float getY() { // Permite obtener la posición de un objeto en Y
    return this.y;
  }
  public void setY(float y) { // Permite asignar una posicion al objeto
    this.y = y; 
  }
  
/** VELOCIDAD */
    public float getVelocidad() { // Permite obtener la velocidad de un objeto
    return this.velocidad; 
  }

  public void setVelocidad(float velocidad) { // Permite asignar una velocidad a un objeto
    this.velocidad=velocidad; 
  }
  
/** TAMANIO */
  public PVector getTamanio(){ // Permite asignar un tamanio a un objeto
    return this.tamanio; 
  }
  public void setTamanio(PVector tamanio){ // Permite asignar un tamanio a un objeto
    this.tamanio = tamanio; 
  }
  
}
