use <modules.scad>;
width = 10;
height = 10;
length = 10;


difference() {
		  halfCube(length, width, height);
        cylinder (h = 4, r=1, center = true, $fn=100);
        rotate ([90,0,0]) cylinder (h = 4, r=0.9, center = true, $fn=100);
}

