include <modules.scad>;

motor_cache_side = 60;
motor_side = 42.3;
motor_hole_offset = (motor_cache_side - motor_side)/2;
thickness = 3;
M3_radius = 1.5;
motor_hole_distance = 31;
cache_hole_distance = 48;
motor_cicle_radius = 11.5;
circle_radius = 30;
screw_cache_offset = 2;

difference(){
    //cache
    cube([motor_cache_side,motor_cache_side,thickness]);
   
    //hole for the nema motor
    translate([motor_hole_offset, motor_hole_offset, 0]){
        cube([motor_side, motor_side, thickness]);
    }
    

	//Holes for cache's screws
	roundExtract(motor_cache_side/2, motor_cache_side/2 + cache_hole_distance/2 + screw_cache_offset, M3_radius);	
	roundExtract(motor_cache_side/2, motor_cache_side/2 - cache_hole_distance/2 - screw_cache_offset, M3_radius);
	roundExtract(motor_cache_side/2 - cache_hole_distance/2 - screw_cache_offset, motor_cache_side/2, M3_radius);
	roundExtract(motor_cache_side/2 + cache_hole_distance/2 + screw_cache_offset, motor_cache_side/2, M3_radius);
}
