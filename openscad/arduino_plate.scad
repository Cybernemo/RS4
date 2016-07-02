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

		//Extracts for the step motor's cable
		squareExtract(25,42, thickness, cable_extract_width);		
		squareExtract(82,16, thickness, cable_extract_width);		

		//Extracts for the sensor board holes
		IMUExtract((width-IMU_width)/2-IMU_width_offset, (length-IMU_length)/2, 0);

		//Extracts for the stepper board holes
		stepperExtraction(thickness,plate_fill_width,0);
		stepperExtraction(width-thickness,length-plate_fill_width,180);		

	}

	screwAttach(thickness, 10, thickness, 10, 10, 10, 270);	
	screwAttach(thickness, 70, thickness, 10, 10, 10, 270);
	screwAttach(width-thickness - 10, 10, thickness, 10, 10, 10, 270);
	screwAttach(width-thickness-10, 70, thickness, 10, 10, 10, 270);
}