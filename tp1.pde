int pantallaActual = 1;
int tiempoTransicion = 5000; //5 swgundos 

PImage[] imagenes = new PImage [3];
String [] texto = {"jet Shark,\n  el mini submarino de 600 CV que \n 'salta' por el agua \n como si fuese una moto acuática","este peculiar híbrido entre moto de agua y submarino,\n fabricado en fibra de vidrio y fibra de carbono,\n está propulsado por una versión marina \n de propulsión a chorro del motor Corvette V8 de 6,2 litros.\n El prototipo actual alcanza los 72 km/h,\n cifra que aumentará hasta los 89 km/", "\n según sus creadores en la versión definitiva,\n que tendrá un motor de 600 CV.\nEn cualquier caso,\n  una potencia más que suficiente\n para adentrarse en el mar,\n girar, deslizarse y dar saltos como lo haría un delfín.\n"};
float[] textoX = new float[3];
float[] textoY = new float[3];
float[] textosVelX = new float[3];
float[] textosVelY = new float[3];
int textoColor;

int botonX, botonY, botonAncho, botonAlto;

void setup() {
  size(640, 480);
  frameRate(60);
  
  imagenes[0] = loadImage("jetshark1.jpg");
  imagenes[1] = loadImage("jetshark2.jpg");
  imagenes[2] = loadImage("jetshark3.jpg");
  
  textoX[0] = 100;
  textoY[0] = 50;
  textosVelX[0] = 1;
  textosVelY[0] = 1;
  
  textoX[1] = 450;
  textoY[1] = 150;
  textosVelX[1] = 1;
  textosVelY[1] = 1;

  textoX[2] = width / 2;
  textoY[2] = height / 2;
  textosVelX[2] = -1.5;
  textosVelY[2] = -1;
  
  textoColor = color(#F06A6D);
  
  botonX = width - 100;
  botonY = height - 50;
  botonAncho = 80;
  botonAlto = 30;
}

void draw() {
  background(255);
  
  image(imagenes[pantallaActual - 1], 0, 0, width, height);
  fill(#F06A6D);
  textAlign(CENTER, CENTER);
  textSize(24);
  textFont(createFont("times new Roman", 30));
  text(texto[pantallaActual - 1], textoX[pantallaActual - 1], textoY[pantallaActual - 1]);
  
  // Animación del tex
  textoX[pantallaActual - 1] += textosVelX[pantallaActual - 1];
  textoY[pantallaActual - 1] += textosVelY[pantallaActual - 1];
  
   // rebote 
  if (textoX[pantallaActual - 1] <= 0 || textoX[pantallaActual - 1] >= width) {
    textosVelX[pantallaActual - 1] *= -1;
     }
  if (textoY[pantallaActual - 1] <= 0 || textoY[pantallaActual - 1] >= height) {
    textosVelY[pantallaActual - 1] *= -1;
  }
    
  
  
 if (millis() >= tiempoTransicion && pantallaActual < 3) {
    pantallaActual++;
    tiempoTransicion = millis() + 5000; 
  }
  
 // Botón 
  if (pantallaActual == 3) {
    fill(255, 0, 0);
    rect(botonX, botonY, botonAncho, botonAlto);
    fill(255);
    textSize(16);
    textAlign(CENTER, CENTER);
    text("Reiniciar", botonX + botonAncho / 2, botonY + botonAlto / 2);
  }
}

void mouseClicked() {
  
  if (mouseX >= botonX && mouseX <= botonX + botonAncho && mouseY >= botonY && mouseY <= botonY + botonAlto) {
    pantallaActual = 1;
    tiempoTransicion = millis() + 5000; 
  }
}
