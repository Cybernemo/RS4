include <modules.scad>;

width = 110;
length = 70;
thickness = 2.8;
plate_fill_width = 22.5;
cable_extract_width = 12;
IMU_width = 16;
IMU_length = 28;
IMU_width_offset = 2;//Offset of the sensor on the PCB

union() {
	difference(){
		cube(size = [width, length, thickness]);
	
		//Corner extract
		squareExtract(0,0, thickness, plate_fill_width);		
		squareExtract(0,length-plate_fill_width,thickness, plate_fill_width);
		squareExtract(width-thickness,0,thickness, plate_fill_width);	
		squareExtract(width-thickness,length-plate_fill_width,thickness, plate_fill_width);

			

	}

	screwAttach(thickness, 10, thickness, 10, 10, 10, 270);	
	screwAttach(thickness, 70, thickness, 10, 10, 10, 270);
	screwAttach(width-thickness - 10, 10, thickness, 10, 10, 10, 270);
	screwAttach(width-thickness-10, 70, thickness, 10, 10, 10, 270);
}