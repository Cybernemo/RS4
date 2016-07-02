include <modules.scad>;

width = 110;
height = 70;
thickness = 2.8;
plate_fill_width = 22.5;
raspberry_hole_radius = 1.3;


difference() {
	cube(size = [width, height, thickness],center=false);

	squareExtract(0,0, thickness, plate_fill_width);		
	squareExtract(0,height-plate_fill_width,thickness, plate_fill_width);
	squareExtract(width-thickness,0,thickness, plate_fill_width);	
	squareExtract(width-thickness,height-plate_fill_width,thickness, plate_fill_width);
	squareExtract(15,15,80, 40);
}
	screwAttach(thickness, 10, thickness, 10, 10, 10, 270);	
	screwAttach(thickness, 70, thickness, 10, 10, 10, 270);
	screwAttach(width-thickness - 10, 10, thickness, 10, 10, 10, 270);
	screwAttach(width-thickness-10, 70, thickness, 10, 10, 10, 270);