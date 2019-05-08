/*
Goal Processing formal lab:

1. Make a repo: 
MKS22X-ProcessingBasics
Use the Processing IDE to create and save 2 sketches.
When you save a sketch, it makes a folder with all the files inside of it. This is required, do not rename the folder.
Name them so I can tell which is which: 
e.g.
Section1
Section2

They will then be placed in your repo like this:
MKS22X-ProcessingBasics/Section1/Section1.pde
/*https://processing.org/tutorials/drawing/
Section 2 Fractals: (recursion is your friend here)
a) Sierpinski's Gasket
b) Koch Curve [CHALLENGE PROBLEM! Try it but don't worry if you get stuck]*/

int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
        fill(255, 0, 0);
        stroke(0);
        
        if (levels > 0){
          gasket(levels-1,v1x,v1y,v1x+(v2x-v1x)/2.0,v2y,v1x+(v3x-v1x)/2.0,v3y+(v1y-v3y)/2.0);
          gasket(levels-1,v1x+(v2x-v1x)/2.0,v1y,v2x,v2y,v2x-(v2x-v3x)/2.0,v3y+(v2y-v3y)/2.0);
          gasket(levels-1,v1x+(v3x-v1x)/2.0,v3y+(v1y-v3y)/2.0,v2x-(v2x-v3x)/2.0,v3y+(v2y-v3y)/2.0,v3x,v3y);
        }
       
        line(v1x,v1y,v2x,v2y);
        line(v2x,v2y,v3x,v3y);
        line(v3x,v3y,v1x,v1y);
      
    
}

void draw() { 
  background(100);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
