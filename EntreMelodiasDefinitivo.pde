import ddf.minim.*;//Importa libreria para poder reproducir musica en el juego

/* DECLARACION DE VARIABLES */
private int estado;        //Se declara la variable estado que permitira cambiar los estados de la maquina de estado
private PImage imagenMenu, imagenPerder,imagenGanar;   // Declaracion de las imagenes que seran utilizadas en las distintas pantallas
private float deltaTime;        // se delcara la variable deltaTime
private Minim minim;        //Declaracion de la clase Minim que se utilizara para reproducir musica
private AudioPlayer menuSong;        //Se declara el audio "menuSong" para reproducir la musica del menu en el menu 
private AudioPlayer level1Song;        //Se declara el audio "level1Song" para reproducir la musica del juego en el nivel1
private AudioPlayer gameWin;        //Se declara el audio "gameWin" para reproducir la musica cuando se gana el juego
private AudioPlayer gameOver;        //Se declara el audio "gameOver" para reproducir la musica cuando se pierde el juego
private Nivel nivel;

/* CONFIGURACION INICIAL */
void setup() {
  size(500, 500);
  frameRate (60);
  textSize(20);
  estado = MaquinaEstados.INSTRUCCIONANDO;
  nivel = new Nivel();
  
  /* CARGAR MUSICA */
  minim = new Minim(this);
  menuSong= minim.loadFile("data/MenuSong.mp3");
  level1Song= minim.loadFile("data/Level1Song.mp3");
  gameWin= minim.loadFile("data/GameWin.mp3");
  gameOver= minim.loadFile("data/GameOver.mp3");
  
  /* CARGAR IMAGENES */
  this.imagenMenu=loadImage("data/menuInicio.jpg");
  this.imagenPerder=loadImage("data/perderPartida.jpg");
  this.imagenGanar=loadImage("data/ganarPartida.JPG");
  
  /* CALCULO DELTA TIME*/
  int framesPorSegundo= round(frameRate);
  deltaTime= 1.0/framesPorSegundo;
}

void draw() {
  background(100);
  fill (#121111);
  
  /* Dependiendo del estado se cambia lo que se dibuja en la pantalla */
  
  switch(estado){
    /* Muestra la pantalla del menu */
    case MaquinaEstados.INSTRUCCIONANDO:{
      image(imagenMenu,0, 0, width, height);  
      text ("Pulsa ENTER para iniciar el juego!", width/2+75, height-18); 
      textAlign(CENTER);
      menuSong.play();         //Reproduce el audio correspondiente al menu
      break;
    }
    /* Muestra la pantalla para jugar */
    case MaquinaEstados.JUGANDO:{
      menuSong.close();         //Detiene la reproducion del audio correspondiente al menu
      gameWin.pause();         //Pausa el audio correspondiente a la pantalla de ganar
      gameOver.pause();         //Pausa el audio correspondiente a la pantalla de perder
      level1Song.play();         //Rreproduce el audio correspondiente al nivel del juego
      nivel.mostrarNivel();    //Llama a la clase Nivel para crear todos los objetos del juego
      break;
    }
    /* Muestra la pantalla de victoria */
    case MaquinaEstados.GANANDO_PARTIDA:{
      imageMode(CORNERS);
      textAlign(CENTER);
      image(imagenGanar,0, 0, width, height);
      text ("FELICIDADES, HAS GANADO!!", width/2,height-20);
      level1Song.pause();         //Pausa el audio correspondiente al nivel
      gameWin.play();            //Rreproduce el audio correspondiente a la pantalla de ganar
      break;
    }
    /* Muestra la pantalla de derrota */
    case MaquinaEstados.PERDIENDO_PARTIDA:{
      imageMode(CORNERS);
      textAlign(CENTER);
      image(imagenPerder,0, 0, width, height);
      text ("OH NO, FUISTE DERROTADO :(", width/2,height/2+138);
      level1Song.pause();        //Pausa el audio correspondiente al nivel
      gameOver.play();          //Rreproduce el audio correspondiente a la pantalla de perder 
      break;
    }
  } 

}

   /* Metodo que nos permite iniciar el juego cuando estamos en el menu */
public void keyPressed() {
  if (keyCode == ENTER && (estado == MaquinaEstados.INSTRUCCIONANDO || estado == MaquinaEstados.PERDIENDO_PARTIDA || estado == MaquinaEstados.GANANDO_PARTIDA)){
    estado = MaquinaEstados.JUGANDO;
  }
}
