$fa = .2;
$fs = 1;
$fn = 128;


he();
//cut_view();
intersection() {
    union(){
    translate([4,-24,100.5]) rotate([90,-90,0]) linear_extrude(4)
    scale([.8,.8,.8]) text("KUKILAND", font = "Squares Bold");

    mirror([1,0,0]) translate([-4,27,100.5+65.2]) rotate([90,90,0]) linear_extrude(4)
    scale([.8,.8,.8]) text("KUKILAND", font = "Squares Bold");
    }
    

    cylinder(r=25, h=500, center=true);

}

module polar_array(radius, count, axis)
{
    for (i = [1:360 / count:360])
    {
        rotate([ 0, 0, i ]) translate([ radius, 0, 0 ]) children();
    }
}

module cut_view(){
difference() {
    he();
    translate([0,-50,0])cube(size=[80, 80, 240], center=false);
}
}


module he_12(){
// wings
translate([0,0,31.5/2]) polar_array(0,6) cube(size=[2.5, 49, 31.5], center=true);


//wings pillar
translate([0,0,55/2]) cylinder(r=7.5, h=55, center=true);

//slope wings pillar to load
hull(){
#translate([0,0,55]) cylinder(r=7.5, h=.1, center=true);
#translate([0,0,55+42]) cylinder(r=49/2, h=.1, center=true);
}

//load
difference() {
   translate([0,0,116.8+16]) cylinder(r=49/2, h=71.6, center=true); 
   translate([0,0,116.8+16]) cylinder(r=49/2-2.5, h=72, center=true); 

}

//load cap

difference() {
    hull(){
    translate([0,0,116.8+35.85+16]) cylinder(r=49/2, h=.1, center=true); 
    translate([0,0,116.8+35.85+42]) cylinder(r=26/2, h=.1, center=true); 
    }
    hull(){
    translate([0,0,116.8+35.85+16]) cylinder(r=49/2-2.5, h=.1, center=true); 
    translate([0,0,116.8+35.85+42]) cylinder(r=26/2.5, h=.1, center=true); 
    }


}

//detonator
difference(){
translate([0,0,116.8+35.85+42+6.5]) cylinder(r=13, h=13, center=true);
translate([0,0,116.8+35.85+42+6.5]) cylinder(r=10.4, h=15, center=true);

}

}




