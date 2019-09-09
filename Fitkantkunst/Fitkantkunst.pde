// importer PeasyCam et libary som gør at man kan styre firkanten ved at trække med musen og zoome ved at scrolle
import peasy.*;
PeasyCam cam;

//fordi at min computer er en gammel macbook fra 2011 så er der en bug når mna kører P3D som kun lige findes på dens gamle drivere... hmmm bad luck
// jeg har fundet et workaround ved at køre programmet med en tom draw funktion første omgang så vil den gerne derfor bliver der nu lavet en boolean som kun bruges en gang
boolean init = false;

int cubes = 3; //variabel der styrer hvor mange rækker med cuber der skal være

void setup() {
  size(600, 600, P3D);// da vi skal arbejde i 3D så skal vi tilføje P3D i slutningen af size
  
  cam = new PeasyCam(this, 400);// sæt et nyt kamera op så vi kan se firkanten
}


void draw() {
  if (init) {// mit lille workaround
    background(0);

    directionalLight(126, 126, 126, 0, -1, 0);
    directionalLight(126, 126, 126, -1, 0, 0);// lav lidt lys så vi kan se hvad vi arbejder med :)
    directionalLight(126, 126, 126, 0, 0, -1);
    ambientLight(102, 102, 102);
    
//et fix lille for lykke som jeg har fundet lidt inspiration hos vores allesammens favorit youtuber
    for (int i = 0; i < cubes; i++) {
      for (int j = 0; j < cubes; j++) {
        for (int k = 0; k < cubes; k++) {
          float len = 50; //længde variable på hvor langt der er mellem hver kasse
          float offset = (cubes - 1)* len * 0.5; //måden firkanterne bilver tegnet på gør at vi er nødt til at offsette dem lidt
          float x = len * i - offset;//x, y og z varibler for hver kasse
          float y = len * j - offset;
          float z = len * k - offset;
          pushMatrix();//pushmatrix og popmatrix sørger for at når vi translater kasserne til deres posistion så er de uafhængige af hindanden
          translate(x, y, z);// vi flytter vores kasse fra 0,0,0 til x,y,z værdien
          stroke(0);
          fill(255, 100, 0);
          box(45);//tegn kassen her
          popMatrix();
        }
      }
    }
  } else {//mere af mit lille workaround :)
    init = true;
  }
}
