class FlameEffect extends Effect{
  ParticleSystem ps;
public FlameEffect(String soundFile, int id, float offset, float effectWidth, int red, int green, int blue) throws IOException{
  super(soundFile, id, offset, effectWidth, red, green,blue);
  ps = new ParticleSystem(new PVector(effectWidth/2, 50));
}
    
 
public void drawEffect(){
    translate(offset, 0);
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


// A simple Particle class

class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    position = l.copy();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update position
  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 1.0;
   
  }

  // Method to display
  void display() {
    stroke(255, 255, 51, 50);
    strokeWeight(1);
    fill(255, 51, 51);
    ellipse(position.x, position.y, 8, 8);
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
