class Nivel{
  
  /* Declaracion de atributos*/
  private Enemy enemy;
  private Escenario escenario;
  private SpawnNotaMusical notamu;
  private SpawnNotaDesafinada notade;
  
  /* Constructor por defecto */
  public Nivel(){
    enemy = new Enemy();
    escenario = new Escenario();
    notamu = new SpawnNotaMusical();
    notade = new SpawnNotaDesafinada();
  }
  /* Metodo que muestra el nivel y las partes q lo componen*/
  public void mostrarNivel(){
      escenario.displayFondo(deltaTime);  // muestra el fondo del juego
      enemy.display();                    // Muestra al enemigo
      enemy.mover();                      // Llama al metodo mover de Enemy para que este se mueva en el escenario
      notamu.spawnerNotaMusical();                 //Metodo que genera las Notas Musicales
      notade.spawnerNotaDesafinada();       //Metodo que genera las Notas Desafinadas
      escenario.display();                //Muestra la interfaz del escenario
      notamu.mostrarPuntos();             //muestra los puntos 
      notade.mostrarVidas();              //muestra la vida 
  }
}
