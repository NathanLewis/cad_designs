//////////////////////////////////////////////////////////////////////////////////////////////
// Paraboloid module for OpenScad
//
// Copyright (C) 2013  Lochner, Juergen
// http://www.thingiverse.com/Ablapo/designs
//
// This program is free software. It is 
// licensed under the Attribution - Creative Commons license.
// http://creativecommons.org/licenses/by/3.0/
//////////////////////////////////////////////////////////////////////////////////////////////

use <MCAD/2Dshapes.scad>;
module paraboloid (y=10, f=5, rfa=0, fc=1, detail=44){
	// y = height of paraboloid
	// f = focus distance 
	// fc : 1 = center paraboloid in focus point(x=0, y=f); 0 = center paraboloid on top (x=0, y=0)
	// rfa = radius of the focus area : 0 = point focus
	// detail = $fn of cone

	hi = (y+2*f)/sqrt(2);								// height and radius of the cone -> alpha = 45° -> sin(45°)=1/sqrt(2)
	x =2*f*sqrt(y/f);									// x  = half size of parabola
	
   translate([0,0,-f*fc])								// center on focus 
	rotate_extrude(convexity = 10,$fn=detail )		// extrude paraboild
	translate([rfa,0,0])								// translate for focus area	 
	difference(){
		union(){											// adding square for focal area
			projection(cut = true)																			// reduce from 3D cone to 2D parabola
				translate([0,0,f*2]) rotate([45,0,0])													// rotate cone 45° and translate for cutting
				translate([0,0,-hi/2])cylinder(h= hi, r1=hi, r2=0, center=true, $fn=detail);   	// center cone on tip
			translate([-(rfa+x ),0]) square ([rfa+x , y ]);											// focal area square
		}
		translate([-(2*rfa+x ), -1/2]) square ([rfa+x ,y +1] ); 					// cut of half at rotation center 
	}
}

size=120; // was 130
fh = 700;

module dish(size, focusHeight) {
    translate([0, 0, fh+1])
        difference() {
            color("green") paraboloid (y=size,f=fh+1,rfa= 0,fc=1,detail=120);
            paraboloid (y=size,f=fh,rfa= 0,fc=1,detail=120);
        }
}

intersection() {
    intersection() {
        dish(size, fh);
        cylinder(r=150, h=160, center = true);
    }
    linear_extrude(122) pieSlice(size=600, start_angle=0, end_angle=22.5);
}

//color("blue") translate([0, 0, fh]) sphere(r=50);
//linear_extrude(122) pieSlice(size=600, start_angle=0, end_angle=45);