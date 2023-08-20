/** Clase que manejan los la generacion y eliminacion de las notas desafinadas*/
class SpawnNotaDesafinada {
  
  /* Declaracion de atributos */
private ArrayList<NotaDesafinada> notasDes;  //Se crea un ArrayList para generar las notas desafinadas
private MainCharacter mainCharacter;
private int vida;    // Variable vida que guarda las vidas del jugador

/* Constructor por defecto */
public SpawnNotaDesafinada(){
  notasDes = new ArrayList<NotaDesafinada>();
  mainCharacter = new MainCharacter();
  vida = 5;
}

/* Metodo que gestiona la generacion de notas desafinadas */
public void spawnerNotaDesafinada(){
  mainCharacter.mover(mouseX, height-190);
  mainCharacter.colicionador();
  
  /* Crea nuevos notas musicales aleatoriamente */
  if (frameCount % 100 == 0) {
    notasDes.add(new NotaDesafinada());
  }
  
  /* Actualiza y dibuja las notas musicales*/
  for (int i = notasDes.size() - 1; i >= 0; i--) {
    NotaDesafinada notade = notasDes.get(i);
    notade.caer();
    notade.display();
    
    /* Verifica la colisión de las notas con el MainCharacter */
    if (mainCharacter.colisionNotaDesafinada(notade)) {
      notasDes.remove(i);
      vida--;
    }
    
    /* Verifica si la nota ha salido de la pantalla y la elimina */
    if (notade.y > height + 50) {
      notasDes.remove(i);
    }
  }
  /* Si se tiene 0 vidas se cambia el estado a PERDIENDO_PARTIDA */
  if (vida <= 0) {
    estado = MaquinaEstados.PERDIENDO_PARTIDA;
    vida = 5; // Se reinicia el contador de vidas
  }

}
/* Metodo que muestra los puntos en pantalla */
  public void mostrarVidas(){
    fill(0);
    textSize(30);
    text("Vidas: " + vida, 150,height-38);
  }
}
