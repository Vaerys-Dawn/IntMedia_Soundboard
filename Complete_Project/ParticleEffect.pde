class ParticleEffect extends Effect{
  
  ParticleSystem ps;
  
  public ParticleEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{
    super(soundFile, id, offset, effectWidth,red,green,blue);
    ps = new ParticleSystem(new PVector(effectWidth, 50));
  }
    
  public void drawEffect(){
    translate(offset,0 );
    if (isActive){ps.addParticle();}
    ps.run();
  }
  
class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(PVector position) {
    origin = position.copy();
    particles = new ArrayList<Particle>();
  }

  void addParticle() {
    particles.add(new Particle(origin));
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float x;
  float y;
  float yspeed;
  float z;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    x  = random(effectWidth);
    y  = random(-500, -50);
    z  = random(0, 20);
    lifespan = 255;
  }

  void run() {
    update();
    display();
  }

  void update() {
    velocity.add(acceleration);
    y = y + yspeed;
    float grav = map(z, 0, 20, 0, 0.2);
    yspeed = yspeed + grav;

    if (y > height) {
      y = random(-50, -50);
      yspeed = map(z, 0, 20, 4, 10);
    }
    lifespan -= 2;
  }

  // Method to display
  void display() {
    stroke(0);
    strokeWeight(1);
    fill(22,187,62,255);
    ellipse(x, y, 8, 8);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
}
