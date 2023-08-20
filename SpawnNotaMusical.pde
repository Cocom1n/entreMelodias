/* Clase que manejan los la generacion y eliminacion de las notas musicales*/

class SpawnNotaMusical {
  
  /* Declaracion de atributos */
private ArrayList<NotaMusical> notasMusic;
private MainCharacter mainCharacter;
private int puntos;

/* Constructor por defecto */
public SpawnNotaMusical(){
  notasMusic = new ArrayList<NotaMusical>();
  mainCharacter = new MainCharacter();
  puntos = 0;
}

/* Metodo que gestiona la generacion de notas msuicales */
public void spawnerNotaMusical(){
  mainCharacter.mover(mouseX, height-190);
  mainCharacter.colicionador();
  mainCharacter.display();
  
  /* Crea nuevos notas musicales aleatoriamente */
  if (frameCount % 40 == 0) {
    notasMusic.add(new NotaMusical());
  }
  
  /* Actualiza y dibuja las notas musicales*/
  for (int i = notasMusic.size() - 1; i >= 0; i--) {
    NotaMusical notamu = notasMusic.get(i);
    notamu.caer();
    notamu.display();
    
    /* Verifica la colisión de las notas con el MainCharacter */
    if (mainCharacter.colisionNotaMusical(notamu)) {
      notasMusic.remove(i);
      puntos++;
    }
    
    /* Verifica si la nota ha salido de la pantalla y la elimina */
    if (notamu.y > height + 50) {
      notasMusic.remove(i);
    }
  }
  /* Si se consige determinada cantidad de puntos se cambia el estado a GANANDO_PARTIDA */
  if (puntos >= 10) {
    estado = MaquinaEstados.GANANDO_PARTIDA;
    puntos = 0;
  }
}
/* Metood que muestra los puntos en pantalla */
public void mostrarPuntos(){
  fill(0);
  textSize(30);
  text("Puntos: " + puntos, 340,height-38);
}
}
