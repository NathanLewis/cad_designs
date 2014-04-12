$fn=45;
thick=0.5;
for(x=[1:50]) {
	// sq = x * x;
	translate([0,x*0.5,0])	cylinder(r=0.5,h=x*x/20);
	translate([x*0.5,0,0])	cylinder(r=0.5,h=x*x/20);
}