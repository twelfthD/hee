$fa = .2;
$fs = 1;
$fn = 128;

trigger();

module trigger() {
    difference(){
        cylinder(d=22.2+ 5, h=22, center=false);
        translate([0,0,-1]) cylinder(d=22.7, h=30, center=false);
        
        }

    difference() {
        scale([1,1,.6]) sphere(d=27.2);
        cylinder(d=22.2+ 5, h=25.75, center=false);

    }

    //sphere(r=8);
    hull(){
        translate([0,0,-1])cylinder(r=12, h=1, center=true);
        translate([0,0,1]) cylinder(r=1.3, h=1, center=true);
    }


    hull(){
        
        translate([0,0,0] )sphere(r=1.7);
        translate([0,0,3]) sphere(r=.8);
    }
}