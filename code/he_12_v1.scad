// he_16_v1



$fa = .2;
$fs = 1;
$fn = 128;
// settings
wings_thickness = 2;

ver= "12KUHE1-P+";


//translate([0,52,0]) he_12();
//cut_view();

//text

difference() {
    he_12();
    text_ku();
    text_mod_ver();

}
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

module cut_view(){
difference() {
    he_12();
    translate([0,-50,0])cube(size=[80, 80, 240], center=false);
}
}

module he_12() {
    // wings
    translate([0,0,31.5/2]) polar_array(0,6) cube(size=[wings_thickness, 49, 31.5], center=true);


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
        translate([0,0,116.8+35.85+16]) cylinder(r=49/2, h=.1, center=true); 
        translate([0,0,116.8+35.85+42]) cylinder(r=14, h=.1, center=true); 
        }
        hull(){
        translate([0,0,116.8+35.85+16]) cylinder(r=49/2-2.5, h=.1, center=true); 
        translate([0,0,116.8+35.85+42]) cylinder(r=26/2.5, h=.1, center=true); 
        }


    }

    //detonator
    difference(){
    translate([0,0,116.8+35.85+42+12.5]) cylinder(r=14, h=25, center=true);
    translate([0,0,116.8+35.85+42+12.5]) cylinder(r=10.4, h=27, center=true);

    }

}





