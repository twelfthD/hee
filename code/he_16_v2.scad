// he_16_v1
use <trigger.scad>;
use <16_shot.scad>;

$fa = .2;
$fs = 1;
$fn = 128;

//ver= "16KUHE1-P+";

cut_view();

module cut_view(){
 difference() {
    union(){
        color("Grey")he_16();
        color("Red")rotate([180,0,0]) translate([0,0,-221.5 -4.5]) trigger();
        rotate([180,0,0]) translate([0,0,-221.5 - .4]) 16_shot();
    }

    translate([0,-50,0])cube(size=[80, 80, 240], center=false);
}

}

//text



    /* difference() {
        he_16();
        text_ku();
        //text_mod_ver();

    } */

    




  
module text_ku() {
    difference() {
        intersection() {
            union(){
            translate([4,-22,100.5]) rotate([90,-90,0]) linear_extrude(6)
            scale([.8,.8,.8]) text("KUKILAND", font = "Squares Bold");

            mirror([1,0,0]) translate([-4,27,100.5+65.2]) rotate([90,90,0]) linear_extrude(6)
            scale([.8,.8,.8]) text("KUKILAND", font = "Squares Bold");
            }
            

            cylinder(r=24.8, h=500, center=true);

        }

        cylinder(r=24.2, h=500, center=true);


    }
}
module text_mod_ver() {
   difference() {
        intersection() {
           
            union(){
            rotate([0, 0, 16]) translate([4,-22,114]) rotate([90,-90,0]) linear_extrude(6)
            scale([.4,.4,.4]) text(ver, font = "Squares Bold");

            rotate([0, 0, -16]) mirror([1,0,0]) translate([-4,27,100.5+65.2-14]) rotate([90,90,0]) linear_extrude(6)
            scale([.4,.4,.4]) text(ver, font = "Squares Bold");
            }
            

            cylinder(r=24.8, h=500, center=true);

        }

        cylinder(r=24.2, h=500, center=true);


    }
   
}

module polar_array(radius, count, axis)
{
    for (i = [1:360 / count:360])
    {
        rotate([ 0, 0, i ]) translate([ radius, 0, 0 ]) children();
    }
}




module he_16(){
// wings
//translate([0,0,31.5/2]) polar_array(0,6) cube(size=[2.5, 49, 31.5], center=true); // 2.5 mm
translate([0,0,31.5/2]) polar_array(0,6) cube(size=[2.4, 49, 31.5], center=true); // 2.2 mm



//wings pillar
translate([0,0,55/2]) cylinder(r=7.5, h=55, center=true);

//slope wings pillar to load
hull(){
translate([0,0,55]) cylinder(r=7.5, h=.1, center=true);
translate([0,0,55+42]) cylinder(r=49/2, h=.1, center=true);
}

//load
difference() {
   translate([0,0,116.8+16]) cylinder(r=49/2, h=71.6, center=true); 
   translate([0,0,116.8+16]) cylinder(r=49/2-2.5, h=72, center=true); 

}

//load cap

difference() {
    hull(){
    translate([0,0,116.8+35.85+16]) cylinder(r=24.5, h=.1, center=true); 
    translate([0,0,116.8+35.85+42]) cylinder(r=11.08, h=.1, center=true); 
    }
    hull(){
    translate([0,0,116.8+35.85+16]) cylinder(r=22, h=.1, center=true); 
    translate([0,0,116.8+35.85+42]) cylinder(d=17.5, h=.1, center=true); 
    }
    translate([0,0,116.8+35.85+42+14]) cylinder(d=19.2, h=50, center=true);


}

//detonator
difference(){
translate([0,0,116.8+35.85+42+12.8]) cylinder(r=11.1, h=25.75, center=true);
translate([0,0,116.8+35.85+42+14]) cylinder(d=19.2, h=30, center=true);
//#translate([0,0,116.8+35.85+42+14]) cylinder(d=19, h=30, center=true);

}



}





