include <../MCAD/regular_shapes.scad>

height= 5;
radius = 9.75;
inner_radius = 4.25;
difference(){
 hexagon_prism(height,radius);
 cylinder(h=height, r=inner_radius, center=false);
}

