include <modules.scad>;

thickness = 3;
height = 160;
width = 70;
radius = width/2;
motor_cache_side = 60;
motor_side = 44;//Slightly bigger (normal 43.2)
motor_hole_offset = (motor_cache_side - motor_side)/2;
M3_radius = 1.7;//Slightly bigger (normal 1.5)
cache_hole_distance = 48;
pos_y_motor_extract = height-30;
pos_x_motor_extract = (width-motor_side)/2;
plate_hole_width = 25;
plate_hole_height = 3.5;//Slightly bigger (normal 3)
plate_hole_distance_from_border = 22;
plate_hole_distance_from_bottom1 = 110;
plate_hole_distance_from_bottom2 = 60;
plate_hole_distance_from_bottom3 = 5;
distance_sensor = true;
screw_cache_offset = 2;
//Stepper motor distances
stepper_round_hole_radius = 11.5;
stepper_screw_distance = 31;

//TODO add holes to screw in the plate
difference(){
	union(){
		translate([radius,height,0])
			cylinder(h = thickness, r = radius);
		polyhedron(
			points=[ 	
				[0,0,0],
				[width-10,0,0],
				[width+10,20,0],
				[width+10,height/2-10,0],
				[width,height/2,0],
				[width,height,0],
				[0,height,0],											
				[0,0,thickness],
				[width-10,0,thickness],
				[width+10,20,thickness],
				[width+10,height/2-10,thickness],
				[width,height/2,thickness],
				[width,height,thickness],
				[0,height,thickness]
			],                                 
  				faces=[ 
				[0,1,2,3,4,5,6],
				[13,12,11,10,9,8,7],
				[0,7,8,1], 
				[1,8,9,2], 
				[2,9,10,3], 
				[3,10,11,4], 
				[4,11,12,5],
				[5,12,13,6],
				[6,13,7,0]
			]                        
 		);
	}
    
    //Hole for the stepper motor
    roundExtract(width/2, 160, stepper_round_hole_radius);

	//Hole for the stepper motor screws
    roundExtract(width/2 + stepper_screw_distance/2, 160+stepper_screw_distance/2,M3_radius);
    roundExtract(width/2 + stepper_screw_distance/2, 160-stepper_screw_distance/2,M3_radius);
    roundExtract(width/2 - stepper_screw_distance/2, 160+stepper_screw_distance/2,M3_radius);
    roundExtract(width/2 - stepper_screw_distance/2, 160-stepper_screw_distance/2,M3_radius);
	
	//Hole for the screws for the motor plate
    	//Holes for cache's screws
	roundExtract(width/2, height - motor_cache_side/2 + motor_hole_offset/2, M3_radius);	
    roundExtract(width/2, height + motor_cache_side/2 - motor_hole_offset/2, M3_radius);	
    roundExtract(motor_hole_offset, 160, M3_radius);
    roundExtract(2*motor_hole_offset + motor_side, 160, M3_radius);
	

	//Holes for plates
	squareExtract(
		plate_hole_distance_from_border,
		plate_hole_distance_from_bottom1,
		plate_hole_width, 
		plate_hole_height);
	squareExtract(
		plate_hole_distance_from_border, 
		plate_hole_distance_from_bottom2, 
		plate_hole_width, 
		plate_hole_height);		
	squareExtract(
		plate_hole_distance_from_border,
		plate_hole_distance_from_bottom3, 
		plate_hole_width, 
		plate_hole_height);
	
	//Hole for distance sensors
	if(distance_sensor==true){
		ultrasonicExtract(47.5, 80, 180);
	}
	
}	
