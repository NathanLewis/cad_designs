// This is a simple little model of the Predator Drone for wargamers 
// who want game pieces

$fn=45;
Length=40;
TailSpan=6;	// This name is not very accurate but it is readable
TailWidth=2.5;
WingWidth=5;
WingSpan=35;

module head() {
	// head piece
	hull() {
		for(j=[-1,1]) {
			for(i=[2:18]) {
    				translate([(i-1.5)/1.3-Length/2,j,0])
					cylinder(r=0.25,h=sin(i*10)*3+1);
			}
		}
	}
}


module drone() {

	//body
	rotate([0,90,0]) cylinder(h=Length, r=2, center=true, $fn=200);

	
	//wings
	translate([2,0,1.4])	
		cube([WingWidth,WingSpan,1],center=true);

	// tail fins
	for(i=[-1,1]) {
		rotate([i*-1*45,0,0])	
			translate([Length/2-TailWidth/2,i*5,0]) 
				cube([TailWidth,TailSpan,0.5],center=true);
	}
	
	// commenting out the head below in order to separate into 2 pieces
	//head();

}	


module front() {
	difference() {
		drone();
		rotate([0,-45,0])	translate([12,0,0])	#mask();
	}
}

// this will print in 2 separate pieces to avoid using support material

rotate([180,0,0]) drone();

translate([-20,0,-2]) head();
