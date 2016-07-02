thickness = 3;
ultrasonic_hole_radius = 8.25;
ultrasonic_hole_distance = 25.5;
pin_side = 2.5;



module roundExtract(pos_x, pos_y, radius) {
     translate([pos_x, pos_y,0]) 
		cylinder(h = thickness, r = radius);
 }

module squareExtract(pos_x, pos_y, width, length) {
	translate([pos_x, pos_y,0])
		cube(size = [width, length, thickness]);
}

module ultrasonicExtract(pos_x, pos_y, rotation) {
	translate([pos_x,pos_y,0]){
		rotate([0,0,rotation]) {
			union(){ 
				translate([0,0,0])
					cylinder(h = thickness, r = ultrasonic_hole_radius);
				translate([ultrasonic_hole_distance,0,0])
					cylinder(h = thickness, r = ultrasonic_hole_radius);
				translate([ultrasonic_hole_distance/2-3.75,-9,0])
					cube(size = [7.5, 2, thickness]);
				translate([ultrasonic_hole_distance/2-4.75,6,0])
					cube(size = [10, 4, thickness]);
			}
		}
	}
}

module IMUExtract(pos_x,pos_y, rotation) {
	translate([pos_x,pos_y,0]){
		rotate([0,0,rotation]) {
			union(){ 
				roundExtract(13,3,2);
				roundExtract(13,25,2);
				squareExtract(0,0,pin_side,pin_side*11);
			}
		}
	}
}

module stepperExtraction(pos_x,pos_y, rotation) {
	translate([pos_x,pos_y,0]){
		rotate([0,0,rotation]) {
			union(){ 
				roundExtract(14,9,2);
				roundExtract(10,33,2);
				squareExtract(1.5,1.5,pin_side,pin_side*3);//3 pins
				squareExtract(20-pin_side-1.5,1.5,pin_side,pin_side*2);//2 pin
				squareExtract(20-pin_side-1.5,32,pin_side,pin_side*4);//4 pins
			}
		}
	}

}

module screwAttach(pos_x, pos_y, pos_z, width, length, height, rotation) {
translate([pos_x,pos_y, pos_z]){
		rotate([0,0,rotation]) {
			difference(){ 
				cube(width,length,height);
				translate([width/2, 0,height/2]) {
					rotate([270,0,0]) {
						cylinder(h = 10, r=2);
					}
				}
				
			}
		}
	}


}
