public class Node {
  PVector pos;
  color c;
  float r;
  PVector vel;
  
  public Node(PVector pos, color c, float r, PVector vel) {
    this.pos = pos;
    this.c = c;
    this.r = r;
    this.vel = vel;
  }
  
  public void show() {
    fill(c,100);
    ellipse(pos.x,pos.y,2*r,2*r);
  }
  
  public void update() {
    pos.x+=vel.x;
    pos.y+=vel.y;

    if (pos.x+r > width || pos.x-r < 0) {
      vel.x*=-1;
    }
    if (pos.y+r > height || pos.y-r < 0) {
      vel.y*=-1;
      
    }
    
    // agario intersection
    
  }
  
  // because we are removing things from an ArrayList, we must ITERATE BACKWARS.
  // start at index being high and end index being low.
  // now everything must iterate BACKWARDS.
  public void checkCollision() {
    for (int i = nodes.size()-1; i >= 0; i--) {
      Node n = nodes.get(i);
      if (!n.equals(this)) {
        if (dist(n.pos.x,n.pos.y,this.pos.x,this.pos.y) < (n.r+this.r)/1.25) {
          if (n.r > this.r) {
            n.r+=this.r;
            nodes.remove(this);
          } else {
            this.r+=n.r;
            nodes.remove(n);
          }
        }
      }
    }
  }
}
