spacing=3;
increment=0.1;
length=7;

x_lines=10;
y_lines=6;

line_w=0.75;
base_t=0.3;
line_t=0.75;

plate_x=2*x_lines*(spacing+increment)+4*length;
plate_y=2*y_lines*(spacing+increment)+7*length;

module  y_arrow()   {
    polyhedron  (
        points  =   [
            [2*line_w+length/2,0,line_t/2],     //0
            [2*line_w+length/2,0,-line_t/2],    //1

            [length/6,spacing/3,line_t/2],      //2
            [length/6,spacing/3,-line_t/2],     //3

            [length/6,-spacing/3,line_t/2],     //4
            [length/6,-spacing/3,-line_t/2]     //5
        ],
        triangles   =   [
            [0,2,4],    [4,1,0],    [0,2,1],    [1,4,5],
            [5,4,2],    [2,3,5],    [5,3,1],    [1,3,2]
        ]
    );
};

module  x_arrow()   {
    polyhedron  (
        points  =   [
            [0,2*line_w+length/2,line_t/2], //0
            [0,2*line_w+length/2,-line_t/2],    //1

            [spacing/3,length/6,line_t/2],  //2
            [spacing/3,length/6,-line_t/2], //3

            [-spacing/3,length/6,line_t/2], //4
            [-spacing/3,length/6,-line_t/2] //5
        ],
        triangles   =   [
            [0,2,4],    [4,1,0],    [0,2,1],    [1,4,5],
            [5,4,2],    [2,3,5],    [5,3,1],    [1,3,2]
        ]
    );
};


module  ref_lines_x()   {
    for (   x   =   [-x_lines   :   x_lines]    )
    {
        translate([x*spacing,   0,  0])
        cube([line_w,   length, line_t],    center=true);
    }

    x_arrow();
    mirror([0,1,0]) x_arrow();
};


module  ref_lines_y()   {
    for (   y   =   [-y_lines   :   y_lines]    )
    {
        translate([0,   y*spacing,  0])
        cube([length,line_w,line_t],    center=true);
    }

    y_arrow();
    mirror([1,0,0]) y_arrow();
};

module  comp_lines_x()  {
    for (   x   =   [-x_lines   :   x_lines]    )
    {
        translate([x*(spacing+increment),   0,  0])
        cube([line_w,length,line_t],    center=true);
    }
};

module  comp_lines_y()  {
    for (   y   =   [-y_lines   :   y_lines]    )
    {
        translate([0,   y*(spacing+increment),  0])
        cube([length,line_w,line_t],    center=true);
    }
};

module  extruder_1()    {
    translate([0,0,base_t/2])
        difference() {
            cube([plate_x,plate_y,base_t+0.1],  center=true);
            translate([4*length,4*length,0])
                cube([plate_x,plate_y,2*base_t],    center=true);


            translate([1.5*length-plate_x/2,2*length-plate_y/2,0])
                rotate([0,0,45])
                    cube([length*2, 2*line_w, 2*base_t], center=true);
            translate([1.5*length-plate_x/2,2*length-plate_y/2,0])
                rotate([0,0,-45])
                    cube([length*2, 2*line_w, 2*base_t], center=true);

            translate([3*length-plate_x/2,2*length-plate_y/2,0])
                cube([length/2, line_w*1.5, 2*base_t], center=true);

            translate([3*length-plate_x/2,length-plate_y/2,0])
                cube([length/2, line_w*1.5, 2*base_t], center=true);
            translate([3*length-plate_x/2,3*line_w+length-plate_y/2,0])
                cube([length/2, line_w*1.5, 2*base_t], center=true);
            translate([3*length-plate_x/2,length-plate_y/2-3*line_w,0])
                cube([length/2, line_w*1.5, 2*base_t], center=true);

            translate([3*length-plate_x/2,1.5*line_w+3*length-plate_y/2,0])
                cube([length/2, line_w*1.5, 2*base_t], center=true);
            translate([3*length-plate_x/2,3*length-plate_y/2-1.5*line_w,0])
                cube([length/2, line_w*1.5, 2*base_t], center=true);

            translate([2.3*length-plate_x/2,plate_y/2-length,0])
                rotate([0,0,45])
                    cube([1*length, 2*line_w, 2*base_t], center=true);
            translate([1.7*length-plate_x/2,plate_y/2-length,0])
                rotate([0,0,-45])
                    cube([1*length, 2*line_w, 2*base_t], center=true);
            translate([2*length-plate_x/2,plate_y/2-1.6*length,0])
                    cube([2*line_w, 0.707*length, 2*base_t], center=true);


            translate([2*length-plate_x/2,plate_y/2-2.5*length,0])
                cube([line_w*1.5, length/2, 2*base_t], center=true);

            translate([length-plate_x/2,plate_y/2-2.5*length,0])
                cube([line_w*1.5, length/2, 2*base_t], center=true);
            translate([3*line_w+length-plate_x/2,plate_y/2-2.5*length,0])
                cube([line_w*1.5, length/2, 2*base_t], center=true);
            translate([length-plate_x/2-3*line_w,plate_y/2-2.5*length,0])
                cube([line_w*1.5, length/2, 2*base_t], center=true);

            translate([1.5*line_w+3*length-plate_x/2,plate_y/2-2.5*length,0])
                cube([line_w*1.5, length/2, 2*base_t], center=true);
            translate([3*length-plate_x/2-1.5*line_w,plate_y/2-2.5*length,0])
                cube([line_w*1.5, length/2, 2*base_t], center=true);



        }
    color([1,0,0])  {
        translate([2*length-plate_x/2,length/2,line_t/2+base_t])
            ref_lines_y();
        translate([1.5*length,2*length-plate_y/2,line_t/2+base_t])
            ref_lines_x();      
    }
}

module  extruder_2()    {
    color([0,1,0])  {
        translate([length+0.1-plate_x/2,length/2,line_t/2+base_t])
            comp_lines_y();
        translate([1.5*length,length+0.1-plate_y/2,line_t/2+base_t])
            comp_lines_x();
    }
}

module  extruder_3()    {
    color([0,0,1])  {
        translate([3*length+0.1-plate_x/2,length/2,line_t/2+base_t])
            comp_lines_y();
        translate([1.5*length,3*length+0.1-plate_y/2,line_t/2+base_t])
            comp_lines_x();
    }
}

extruder_1();
extruder_2();
extruder_3();