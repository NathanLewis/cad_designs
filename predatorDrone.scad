	// This is a simple little model of the Predator Drone for wargamers 
	// who want game pieces
	$fn=45;
	Length=40;
	TailSpan=6;	// This name is not very accurate but it is readable
	TailWidth=2.5;
	WingWidth=5;
	WingSpan=45;

	rotate([0,90,0]) cylinder(h=Length, r=2, center=true, $fn=200);
	//wings
	translate([2,0,0])	
		cube([WingWidth,WingSpan,1],center=true);

	// tail fins
	for(i=[-1,1]) {
		rotate([i*-1*45,0,0])	
			translate([Length/2-TailWidth/2,i*5,0]) 
				cube([TailWidth,TailSpan,0.5],center=true);
	}
	
	// head piece
	hull() {
		for(j=[-1,1]) {
			for(i=[2:18]) {
    				translate([i-Length/2-1.5,j,0])
					cylinder(r=0.5,h=sin(i*10)*3+1);
			}
		}
	}
	
