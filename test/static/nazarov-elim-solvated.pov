// File generated with CYLview v1.0 BETA

global_settings { charset utf8 }

camera {
  location <0.0, 0.0, -100.0>
  angle 21.5926238491
  right x*798/524
}

fog {
    distance 4 // density of the fog
    color rgbf<1.00, 1.00, 1.00, 0.0>
    rotate <-90,0,0>
    fog_type 2
    fog_offset 0.000000 // starting z coordinate
    fog_alt 0.75 // gradiant between clear and foggy
  }

light_source { <-22.7047111, 24.2746506, -21.7685696> color rgb<1,1,1>}

background {color rgb<1.00,1.00,1.00>}

  #declare F_normal = finish { specular 0.400
                        roughness 0.020
                        diffuse 0.500
                        ambient 0.600 }

  #declare F_flat = finish { specular 0.001
                             roughness 0.020
                             diffuse 0.800
                             ambient 0.800 }

// Section containing the normal atoms and bonds

sphere {<-1.8297761, 2.3775881, 0.6706238> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.8297761, 2.3775881, 0.6706238>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.8297761, 2.3775881, 0.6706238>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.8297761, 2.3775881, 0.6706238>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.8297761, 2.3775881, 0.6706238>,
  <-2.3164345, 2.0535534, 1.0609915>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3164345, 2.0535534, 1.0609915>,
  <-2.8030928, 1.7295186, 1.4513592>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8297761, 2.3775881, 0.6706238>,
  <-2.1336395, 2.6136608, 0.0556022>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1336395, 2.6136608, 0.0556022>,
  <-2.4375029, 2.8497336, -0.5594194>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8297761, 2.3775881, 0.6706238>,
  <-1.1072545, 2.4557969, 0.8202891>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1072545, 2.4557969, 0.8202891>,
  <-0.3847329, 2.5340058, 0.9699544>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.8030928, 1.7295186, 1.4513592> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.8030928, 1.7295186, 1.4513592>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.8030928, 1.7295186, 1.4513592>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.8030928, 1.7295186, 1.4513592>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.8030928, 1.7295186, 1.4513592>,
  <-3.4736881, 1.8512273, 1.1088000>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4736881, 1.8512273, 1.1088000>,
  <-4.1442833, 1.9729359, 0.7662408>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.8030928, 1.7295186, 1.4513592>,
  <-2.7383354, 1.5618799, 2.1730243>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.7383354, 1.5618799, 2.1730243>,
  <-2.6735780, 1.3942411, 2.8946895>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.1442833, 1.9729359, 0.7662408> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.1442833, 1.9729359, 0.7662408>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.1442833, 1.9729359, 0.7662408>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.1442833, 1.9729359, 0.7662408>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.1442833, 1.9729359, 0.7662408>,
  <-3.9652975, 2.2887403, 0.1104852>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9652975, 2.2887403, 0.1104852>,
  <-3.7863117, 2.6045447, -0.5452705>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1442833, 1.9729359, 0.7662408>,
  <-4.4466103, 2.3260440, 1.0587987>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4466103, 2.3260440, 1.0587987>,
  <-4.7489373, 2.6791521, 1.3513567>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1442833, 1.9729359, 0.7662408>,
  <-4.4498760, 1.5230661, 0.7075319>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4498760, 1.5230661, 0.7075319>,
  <-4.7554686, 1.0731962, 0.6488230>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.7863117, 2.6045447, -0.5452705> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.7863117, 2.6045447, -0.5452705>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.7863117, 2.6045447, -0.5452705>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.7863117, 2.6045447, -0.5452705>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.7863117, 2.6045447, -0.5452705>,
  <-3.1119073, 2.7271391, -0.5523449>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1119073, 2.7271391, -0.5523449>,
  <-2.4375029, 2.8497336, -0.5594194>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7863117, 2.6045447, -0.5452705>,
  <-4.2633109, 2.7312408, -1.0844364>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.2633109, 2.7312408, -1.0844364>,
  <-4.7403100, 2.8579370, -1.6236023>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.7489373, 2.6791521, 1.3513567> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.7489373, 2.6791521, 1.3513567>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.7489373, 2.6791521, 1.3513567>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.7489373, 2.6791521, 1.3513567>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.4375029, 2.8497336, -0.5594194> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.4375029, 2.8497336, -0.5594194>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.4375029, 2.8497336, -0.5594194>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.4375029, 2.8497336, -0.5594194>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.4375029, 2.8497336, -0.5594194>,
  <-2.0793832, 3.1477170, -1.0487336>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.0793832, 3.1477170, -1.0487336>,
  <-1.7212636, 3.4457004, -1.5380478>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.7212636, 3.4457004, -1.5380478> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-1.7212636, 3.4457004, -1.5380478>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-1.7212636, 3.4457004, -1.5380478>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-1.7212636, 3.4457004, -1.5380478>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.7212636, 3.4457004, -1.5380478>,
  <-1.4231169, 3.0337209, -2.2302108>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4231169, 3.0337209, -2.2302108>,
  <-1.1249701, 2.6217414, -2.9223739>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.1249701, 2.6217414, -2.9223739> 0.4162500
   pigment{color rgbt <0.9,0.8,0.6,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.416, 0.011 rotate <90,0,0> translate <-1.1249701, 2.6217414, -2.9223739>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.416, 0.005 rotate <-30,0,0> translate <-1.1249701, 2.6217414, -2.9223739>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.416, 0.005 rotate <-30,0,90> translate <-1.1249701, 2.6217414, -2.9223739>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.1249701, 2.6217414, -2.9223739>,
  <-1.8208031, 2.4070535, -3.5105327>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8208031, 2.4070535, -3.5105327>,
  <-2.5166361, 2.1923656, -4.0986914>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1249701, 2.6217414, -2.9223739>,
  <-0.5341945, 3.2342484, -3.3096721>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.5341945, 3.2342484, -3.3096721>,
  <0.0565812, 3.8467553, -3.6969703>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1249701, 2.6217414, -2.9223739>,
  <-0.6998263, 1.8417167, -2.6270735>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6998263, 1.8417167, -2.6270735>,
  <-0.2746824, 1.0616921, -2.3317730>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.5166361, 2.1923656, -4.0986914> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.5166361, 2.1923656, -4.0986914>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.5166361, 2.1923656, -4.0986914>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.5166361, 2.1923656, -4.0986914>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.5166361, 2.1923656, -4.0986914>,
  <-2.3026970, 1.9928273, -4.5610859>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3026970, 1.9928273, -4.5610859>,
  <-2.0887578, 1.7932889, -5.0234804>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5166361, 2.1923656, -4.0986914>,
  <-2.8532407, 1.8136270, -3.8925173>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.8532407, 1.8136270, -3.8925173>,
  <-3.1898452, 1.4348884, -3.6863433>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5166361, 2.1923656, -4.0986914>,
  <-2.8181711, 2.6303627, -4.2259198>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.8181711, 2.6303627, -4.2259198>,
  <-3.1197060, 3.0683599, -4.3531482>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.0887578, 1.7932889, -5.0234804> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.0887578, 1.7932889, -5.0234804>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.0887578, 1.7932889, -5.0234804>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.0887578, 1.7932889, -5.0234804>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1898452, 1.4348884, -3.6863433> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.1898452, 1.4348884, -3.6863433>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.1898452, 1.4348884, -3.6863433>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.1898452, 1.4348884, -3.6863433>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1197060, 3.0683599, -4.3531482> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.1197060, 3.0683599, -4.3531482>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.1197060, 3.0683599, -4.3531482>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.1197060, 3.0683599, -4.3531482>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.0565812, 3.8467553, -3.6969703> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.0565812, 3.8467553, -3.6969703>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.0565812, 3.8467553, -3.6969703>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.0565812, 3.8467553, -3.6969703>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.0565812, 3.8467553, -3.6969703>,
  <0.4748929, 3.9684398, -3.3665741>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.4748929, 3.9684398, -3.3665741>,
  <0.8932047, 4.0901243, -3.0361778>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0565812, 3.8467553, -3.6969703>,
  <0.2625332, 3.6400174, -4.1612509>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.2625332, 3.6400174, -4.1612509>,
  <0.4684853, 3.4332795, -4.6255315>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0565812, 3.8467553, -3.6969703>,
  <-0.2020520, 4.3129877, -3.8237187>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2020520, 4.3129877, -3.8237187>,
  <-0.4606852, 4.7792200, -3.9504671>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.8932047, 4.0901243, -3.0361778> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.8932047, 4.0901243, -3.0361778>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.8932047, 4.0901243, -3.0361778>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.8932047, 4.0901243, -3.0361778>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.4684853, 3.4332795, -4.6255315> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.4684853, 3.4332795, -4.6255315>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.4684853, 3.4332795, -4.6255315>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.4684853, 3.4332795, -4.6255315>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.4606852, 4.7792200, -3.9504671> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.4606852, 4.7792200, -3.9504671>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.4606852, 4.7792200, -3.9504671>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.4606852, 4.7792200, -3.9504671>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.2746824, 1.0616921, -2.3317730> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.2746824, 1.0616921, -2.3317730>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.2746824, 1.0616921, -2.3317730>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.2746824, 1.0616921, -2.3317730>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.2746824, 1.0616921, -2.3317730>,
  <-0.0575280, 0.8011186, -2.7615994>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.0575280, 0.8011186, -2.7615994>,
  <0.1596265, 0.5405451, -3.1914257>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2746824, 1.0616921, -2.3317730>,
  <0.1295299, 1.1665698, -1.9791882>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.1295299, 1.1665698, -1.9791882>,
  <0.5337423, 1.2714475, -1.6266034>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2746824, 1.0616921, -2.3317730>,
  <-0.6269573, 0.7208941, -2.0879773>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6269573, 0.7208941, -2.0879773>,
  <-0.9792321, 0.3800962, -1.8441816>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.1596265, 0.5405451, -3.1914257> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.1596265, 0.5405451, -3.1914257>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.1596265, 0.5405451, -3.1914257>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.1596265, 0.5405451, -3.1914257>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.5337423, 1.2714475, -1.6266034> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.5337423, 1.2714475, -1.6266034>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.5337423, 1.2714475, -1.6266034>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.5337423, 1.2714475, -1.6266034>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.9792321, 0.3800962, -1.8441816> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.9792321, 0.3800962, -1.8441816>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.9792321, 0.3800962, -1.8441816>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.9792321, 0.3800962, -1.8441816>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.3847329, 2.5340058, 0.9699544> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.3847329, 2.5340058, 0.9699544>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.3847329, 2.5340058, 0.9699544>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.3847329, 2.5340058, 0.9699544>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.3847329, 2.5340058, 0.9699544>,
  <-0.1144023, 2.0649936, 0.8813173>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1144023, 2.0649936, 0.8813173>,
  <0.1559283, 1.5959814, 0.7926802>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3847329, 2.5340058, 0.9699544>,
  <-0.1639435, 2.9187123, 0.6522751>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1639435, 2.9187123, 0.6522751>,
  <0.0568459, 3.3034188, 0.3345958>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3847329, 2.5340058, 0.9699544>,
  <-0.3079152, 2.6589990, 1.4973805>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3079152, 2.6589990, 1.4973805>,
  <-0.2310975, 2.7839922, 2.0248067>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.1559283, 1.5959814, 0.7926802> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.1559283, 1.5959814, 0.7926802>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.1559283, 1.5959814, 0.7926802>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.1559283, 1.5959814, 0.7926802>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.0568459, 3.3034188, 0.3345958> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.0568459, 3.3034188, 0.3345958>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.0568459, 3.3034188, 0.3345958>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.0568459, 3.3034188, 0.3345958>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.2310975, 2.7839922, 2.0248067> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.2310975, 2.7839922, 2.0248067>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.2310975, 2.7839922, 2.0248067>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.2310975, 2.7839922, 2.0248067>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.6735780, 1.3942411, 2.8946895> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.6735780, 1.3942411, 2.8946895>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.6735780, 1.3942411, 2.8946895>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.6735780, 1.3942411, 2.8946895>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.6735780, 1.3942411, 2.8946895>,
  <-2.1096389, 1.0449031, 3.1278776>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1096389, 1.0449031, 3.1278776>,
  <-1.5456997, 0.6955650, 3.3610657>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6735780, 1.3942411, 2.8946895>,
  <-3.1815846, 1.5515588, 3.3523302>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1815846, 1.5515588, 3.3523302>,
  <-3.6895911, 1.7088765, 3.8099709>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.5456997, 0.6955650, 3.3610657> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.5456997, 0.6955650, 3.3610657>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.5456997, 0.6955650, 3.3610657>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.5456997, 0.6955650, 3.3610657>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.5456997, 0.6955650, 3.3610657>,
  <-1.4883635, 0.5232488, 4.0335561>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4883635, 0.5232488, 4.0335561>,
  <-1.4310273, 0.3509326, 4.7060465>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5456997, 0.6955650, 3.3610657>,
  <-1.1606817, 0.5376694, 3.0139914>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1606817, 0.5376694, 3.0139914>,
  <-0.7756637, 0.3797737, 2.6669171>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.6895911, 1.7088765, 3.8099709> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.6895911, 1.7088765, 3.8099709>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.6895911, 1.7088765, 3.8099709>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.6895911, 1.7088765, 3.8099709>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.6895911, 1.7088765, 3.8099709>,
  <-3.6311388, 1.5336669, 4.4819404>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6311388, 1.5336669, 4.4819404>,
  <-3.5726865, 1.3584573, 5.1539099>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6895911, 1.7088765, 3.8099709>,
  <-4.1330475, 1.9728069, 3.6422808>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1330475, 1.9728069, 3.6422808>,
  <-4.5765039, 2.2367372, 3.4745906>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.4310273, 0.3509326, 4.7060465> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.4310273, 0.3509326, 4.7060465>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.4310273, 0.3509326, 4.7060465>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.4310273, 0.3509326, 4.7060465>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.4310273, 0.3509326, 4.7060465>,
  <-1.9361099, 0.5160389, 5.1581003>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9361099, 0.5160389, 5.1581003>,
  <-2.4411925, 0.6811452, 5.6101541>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4310273, 0.3509326, 4.7060465>,
  <-0.9913497, 0.0792161, 4.8736397>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9913497, 0.0792161, 4.8736397>,
  <-0.5516721, -0.1925005, 5.0412328>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.7756637, 0.3797737, 2.6669171> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.7756637, 0.3797737, 2.6669171>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.7756637, 0.3797737, 2.6669171>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.7756637, 0.3797737, 2.6669171>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-3.5726865, 1.3584573, 5.1539099> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.5726865, 1.3584573, 5.1539099>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.5726865, 1.3584573, 5.1539099>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.5726865, 1.3584573, 5.1539099>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.5726865, 1.3584573, 5.1539099>,
  <-3.0069395, 1.0198012, 5.3820320>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.0069395, 1.0198012, 5.3820320>,
  <-2.4411925, 0.6811452, 5.6101541>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5726865, 1.3584573, 5.1539099>,
  <-3.9709772, 1.4879984, 5.4998451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9709772, 1.4879984, 5.4998451>,
  <-4.3692680, 1.6175395, 5.8457802>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.5765039, 2.2367372, 3.4745906> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.5765039, 2.2367372, 3.4745906>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.5765039, 2.2367372, 3.4745906>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.5765039, 2.2367372, 3.4745906>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.4411925, 0.6811452, 5.6101541> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.4411925, 0.6811452, 5.6101541>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.4411925, 0.6811452, 5.6101541>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.4411925, 0.6811452, 5.6101541>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.4411925, 0.6811452, 5.6101541>,
  <-2.3971201, 0.5440231, 6.1338136>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3971201, 0.5440231, 6.1338136>,
  <-2.3530477, 0.4069010, 6.6574732>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.5516721, -0.1925005, 5.0412328> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.5516721, -0.1925005, 5.0412328>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.5516721, -0.1925005, 5.0412328>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.5516721, -0.1925005, 5.0412328>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.3692680, 1.6175395, 5.8457802> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.3692680, 1.6175395, 5.8457802>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.3692680, 1.6175395, 5.8457802>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.3692680, 1.6175395, 5.8457802>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.3530477, 0.4069010, 6.6574732> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.3530477, 0.4069010, 6.6574732>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.3530477, 0.4069010, 6.6574732>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.3530477, 0.4069010, 6.6574732>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.7403100, 2.8579370, -1.6236023> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.7403100, 2.8579370, -1.6236023>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.7403100, 2.8579370, -1.6236023>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.7403100, 2.8579370, -1.6236023>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.7403100, 2.8579370, -1.6236023>,
  <-5.1997559, 2.3622351, -1.8159477>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1997559, 2.3622351, -1.8159477>,
  <-5.6592017, 1.8665332, -2.0082931>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7403100, 2.8579370, -1.6236023>,
  <-4.7329430, 3.4704573, -1.9677502>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7329430, 3.4704573, -1.9677502>,
  <-4.7255760, 4.0829777, -2.3118980>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.6592017, 1.8665332, -2.0082931> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.6592017, 1.8665332, -2.0082931>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.6592017, 1.8665332, -2.0082931>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.6592017, 1.8665332, -2.0082931>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.6592017, 1.8665332, -2.0082931>,
  <-6.0961349, 1.9805258, -2.5385642>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.0961349, 1.9805258, -2.5385642>,
  <-6.5330680, 2.0945184, -3.0688354>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6592017, 1.8665332, -2.0082931>,
  <-5.6529860, 1.3833932, -1.7619563>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6529860, 1.3833932, -1.7619563>,
  <-5.6467704, 0.9002531, -1.5156194>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.7255760, 4.0829777, -2.3118980> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.7255760, 4.0829777, -2.3118980>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.7255760, 4.0829777, -2.3118980>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.7255760, 4.0829777, -2.3118980>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.7255760, 4.0829777, -2.3118980>,
  <-5.1719835, 4.1984410, -2.8332128>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1719835, 4.1984410, -2.8332128>,
  <-5.6183910, 4.3139043, -3.3545275>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7255760, 4.0829777, -2.3118980>,
  <-4.3675944, 4.4637364, -2.1666177>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.3675944, 4.4637364, -2.1666177>,
  <-4.0096129, 4.8444951, -2.0213373>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.5330680, 2.0945184, -3.0688354> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-6.5330680, 2.0945184, -3.0688354>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-6.5330680, 2.0945184, -3.0688354>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-6.5330680, 2.0945184, -3.0688354>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-6.5330680, 2.0945184, -3.0688354>,
  <-6.5264852, 2.7066152, -3.4041167>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.5264852, 2.7066152, -3.4041167>,
  <-6.5199024, 3.3187120, -3.7393980>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.5330680, 2.0945184, -3.0688354>,
  <-6.8713410, 1.7009701, -3.2253380>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.8713410, 1.7009701, -3.2253380>,
  <-7.2096140, 1.3074217, -3.3818407>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.6467704, 0.9002531, -1.5156194> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.6467704, 0.9002531, -1.5156194>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.6467704, 0.9002531, -1.5156194>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.6467704, 0.9002531, -1.5156194>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-5.6183910, 4.3139043, -3.3545275> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.6183910, 4.3139043, -3.3545275>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.6183910, 4.3139043, -3.3545275>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.6183910, 4.3139043, -3.3545275>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.6183910, 4.3139043, -3.3545275>,
  <-6.0691467, 3.8163082, -3.5469628>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.0691467, 3.8163082, -3.5469628>,
  <-6.5199024, 3.3187120, -3.7393980>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6183910, 4.3139043, -3.3545275>,
  <-5.6117729, 4.7909964, -3.6141564>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6117729, 4.7909964, -3.6141564>,
  <-5.6051547, 5.2680885, -3.8737852>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.0096129, 4.8444951, -2.0213373> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.0096129, 4.8444951, -2.0213373>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.0096129, 4.8444951, -2.0213373>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.0096129, 4.8444951, -2.0213373>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-6.5199024, 3.3187120, -3.7393980> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-6.5199024, 3.3187120, -3.7393980>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-6.5199024, 3.3187120, -3.7393980>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-6.5199024, 3.3187120, -3.7393980>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-6.5199024, 3.3187120, -3.7393980>,
  <-6.8623320, 3.4063791, -4.1517394>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.8623320, 3.4063791, -4.1517394>,
  <-7.2047615, 3.4940462, -4.5640809>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-7.2096140, 1.3074217, -3.3818407> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.2096140, 1.3074217, -3.3818407>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.2096140, 1.3074217, -3.3818407>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.2096140, 1.3074217, -3.3818407>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-5.6051547, 5.2680885, -3.8737852> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.6051547, 5.2680885, -3.8737852>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.6051547, 5.2680885, -3.8737852>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.6051547, 5.2680885, -3.8737852>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-7.2047615, 3.4940462, -4.5640809> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.2047615, 3.4940462, -4.5640809>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.2047615, 3.4940462, -4.5640809>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.2047615, 3.4940462, -4.5640809>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.7554686, 1.0731962, 0.6488230> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.7554686, 1.0731962, 0.6488230>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.7554686, 1.0731962, 0.6488230>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.7554686, 1.0731962, 0.6488230>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.4438738, 0.4809959, 0.8835322> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.4438738, 0.4809959, 0.8835322>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.4438738, 0.4809959, 0.8835322>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.4438738, 0.4809959, 0.8835322>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.4438738, 0.4809959, 0.8835322>,
  <-2.3009638, -0.0876585, 0.7111300>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3009638, -0.0876585, 0.7111300>,
  <-2.1580537, -0.6563130, 0.5387278>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.2982415, -1.6401822, 0.2288494> 0.3825000
   pigment{color rgbt <1.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.383, 0.011 rotate <90,0,0> translate <-3.2982415, -1.6401822, 0.2288494>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.383, 0.005 rotate <-30,0,0> translate <-3.2982415, -1.6401822, 0.2288494>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.383, 0.005 rotate <-30,0,90> translate <-3.2982415, -1.6401822, 0.2288494>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.2982415, -1.6401822, 0.2288494>,
  <-2.7281476, -1.1482476, 0.3837886>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.7281476, -1.1482476, 0.3837886>,
  <-2.1580537, -0.6563130, 0.5387278>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2982415, -1.6401822, 0.2288494>,
  <-3.8319631, -1.3559523, -0.1828729>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.8319631, -1.3559523, -0.1828729>,
  <-4.3656846, -1.0717224, -0.5945951>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2982415, -1.6401822, 0.2288494>,
  <-3.6933980, -1.7998026, 1.0606651>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6933980, -1.7998026, 1.0606651>,
  <-4.0885545, -1.9594230, 1.8924808>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2982415, -1.6401822, 0.2288494>,
  <-2.9942671, -2.2800083, 0.0195774>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.9942671, -2.2800083, 0.0195774>,
  <-2.6902926, -2.9198345, -0.1896946>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.1580537, -0.6563130, 0.5387278> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-2.1580537, -0.6563130, 0.5387278>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-2.1580537, -0.6563130, 0.5387278>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-2.1580537, -0.6563130, 0.5387278>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.3656846, -1.0717224, -0.5945951> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-4.3656846, -1.0717224, -0.5945951>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-4.3656846, -1.0717224, -0.5945951>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-4.3656846, -1.0717224, -0.5945951>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.0885545, -1.9594230, 1.8924808> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.0885545, -1.9594230, 1.8924808>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.0885545, -1.9594230, 1.8924808>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.0885545, -1.9594230, 1.8924808>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.0885545, -1.9594230, 1.8924808>,
  <-4.4476343, -1.4233543, 2.0677852>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4476343, -1.4233543, 2.0677852>,
  <-4.8067141, -0.8872856, 2.2430896>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.0885545, -1.9594230, 1.8924808>,
  <-3.6274855, -2.0739983, 2.3584049>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6274855, -2.0739983, 2.3584049>,
  <-3.1664164, -2.1885735, 2.8243289>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.0885545, -1.9594230, 1.8924808>,
  <-4.4905452, -2.4874964, 1.8401874>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4905452, -2.4874964, 1.8401874>,
  <-4.8925358, -3.0155698, 1.7878940>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.8067141, -0.8872856, 2.2430896> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-4.8067141, -0.8872856, 2.2430896>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-4.8067141, -0.8872856, 2.2430896>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-4.8067141, -0.8872856, 2.2430896>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1664164, -2.1885735, 2.8243289> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-3.1664164, -2.1885735, 2.8243289>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-3.1664164, -2.1885735, 2.8243289>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-3.1664164, -2.1885735, 2.8243289>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.8925358, -3.0155698, 1.7878940> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-4.8925358, -3.0155698, 1.7878940>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-4.8925358, -3.0155698, 1.7878940>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-4.8925358, -3.0155698, 1.7878940>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-1.8137968, -2.6186518, -1.9142845> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.8137968, -2.6186518, -1.9142845>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.8137968, -2.6186518, -1.9142845>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.8137968, -2.6186518, -1.9142845>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.8137968, -2.6186518, -1.9142845>,
  <-1.5366234, -2.4532118, -2.3089995>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5366234, -2.4532118, -2.3089995>,
  <-1.2594500, -2.2877717, -2.7037145>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.2594500, -2.2877717, -2.7037145> 0.2812500
   pigment{color rgbt <0.4,0.4,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.281, 0.011 rotate <90,0,0> translate <-1.2594500, -2.2877717, -2.7037145>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.281, 0.005 rotate <-30,0,0> translate <-1.2594500, -2.2877717, -2.7037145>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.281, 0.005 rotate <-30,0,90> translate <-1.2594500, -2.2877717, -2.7037145>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.2594500, -2.2877717, -2.7037145>,
  <-0.5914465, -2.2599705, -2.5994131>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.5914465, -2.2599705, -2.5994131>,
  <0.0765570, -2.2321693, -2.4951117>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.2594500, -2.2877717, -2.7037145>,
  <-1.6303029, -2.0488153, -3.2486814>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6303029, -2.0488153, -3.2486814>,
  <-2.0011557, -1.8098589, -3.7936484>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.0765570, -2.2321693, -2.4951117> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.0765570, -2.2321693, -2.4951117>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.0765570, -2.2321693, -2.4951117>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.0765570, -2.2321693, -2.4951117>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.0765570, -2.2321693, -2.4951117>,
  <0.4420742, -2.3566372, -1.9067360>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.4420742, -2.3566372, -1.9067360>,
  <0.8075915, -2.4811050, -1.3183604>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0765570, -2.2321693, -2.4951117>,
  <0.6944988, -2.0500489, -2.8746463>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6944988, -2.0500489, -2.8746463>,
  <1.3124406, -1.8679286, -3.2541808>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.0011557, -1.8098589, -3.7936484> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.0011557, -1.8098589, -3.7936484>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.0011557, -1.8098589, -3.7936484>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.0011557, -1.8098589, -3.7936484>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.0011557, -1.8098589, -3.7936484>,
  <-2.6989780, -1.7878163, -3.7238535>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6989780, -1.7878163, -3.7238535>,
  <-3.3968002, -1.7657737, -3.6540587>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.0011557, -1.8098589, -3.7936484>,
  <-1.7049053, -1.5908048, -4.3883387>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.7049053, -1.5908048, -4.3883387>,
  <-1.4086550, -1.3717506, -4.9830290>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.8075915, -2.4811050, -1.3183604> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.8075915, -2.4811050, -1.3183604>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.8075915, -2.4811050, -1.3183604>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.8075915, -2.4811050, -1.3183604>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.8075915, -2.4811050, -1.3183604>,
  <0.6422774, -2.6577430, -0.6939163>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6422774, -2.6577430, -0.6939163>,
  <0.4769633, -2.8343809, -0.0694723>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8075915, -2.4811050, -1.3183604>,
  <1.4522641, -2.3266329, -1.6462663>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4522641, -2.3266329, -1.6462663>,
  <2.0969367, -2.1721607, -1.9741723>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.3124406, -1.8679286, -3.2541808> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.3124406, -1.8679286, -3.2541808>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.3124406, -1.8679286, -3.2541808>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.3124406, -1.8679286, -3.2541808>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.3124406, -1.8679286, -3.2541808>,
  <1.7046886, -2.0200447, -2.6141765>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7046886, -2.0200447, -2.6141765>,
  <2.0969367, -2.1721607, -1.9741723>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.3124406, -1.8679286, -3.2541808>,
  <1.4474173, -1.6549676, -3.8076640>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4474173, -1.6549676, -3.8076640>,
  <1.5823939, -1.4420066, -4.3611473>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.3968002, -1.7657737, -3.6540587> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.3968002, -1.7657737, -3.6540587>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.3968002, -1.7657737, -3.6540587>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.3968002, -1.7657737, -3.6540587>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.3968002, -1.7657737, -3.6540587>,
  <-3.7894460, -1.5201086, -4.1725740>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7894460, -1.5201086, -4.1725740>,
  <-4.1820917, -1.2744435, -4.6910893>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.3968002, -1.7657737, -3.6540587>,
  <-3.6303219, -1.9231782, -3.1915918>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6303219, -1.9231782, -3.1915918>,
  <-3.8638435, -2.0805827, -2.7291248>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.4086550, -1.3717506, -4.9830290> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.4086550, -1.3717506, -4.9830290>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.4086550, -1.3717506, -4.9830290>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.4086550, -1.3717506, -4.9830290>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.4086550, -1.3717506, -4.9830290>,
  <-1.8143944, -1.1277437, -5.4946346>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8143944, -1.1277437, -5.4946346>,
  <-2.2201338, -0.8837369, -6.0062402>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4086550, -1.3717506, -4.9830290>,
  <-0.8694207, -1.3835699, -5.0447136>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.8694207, -1.3835699, -5.0447136>,
  <-0.3301865, -1.3953891, -5.1063982>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.4769633, -2.8343809, -0.0694723> 0.2812500
   pigment{color rgbt <0.4,0.4,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.281, 0.011 rotate <90,0,0> translate <0.4769633, -2.8343809, -0.0694723>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.281, 0.005 rotate <-30,0,0> translate <0.4769633, -2.8343809, -0.0694723>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.281, 0.005 rotate <-30,0,90> translate <0.4769633, -2.8343809, -0.0694723>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.4769633, -2.8343809, -0.0694723>,
  <0.9783582, -2.8257859, 0.4639908>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9783582, -2.8257859, 0.4639908>,
  <1.4797530, -2.8171909, 0.9974539>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.4769633, -2.8343809, -0.0694723>,
  <-0.0046515, -2.7564636, 0.0709118>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.0046515, -2.7564636, 0.0709118>,
  <-0.4862663, -2.6785463, 0.2112960>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.0969367, -2.1721607, -1.9741723> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.0969367, -2.1721607, -1.9741723>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.0969367, -2.1721607, -1.9741723>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.0969367, -2.1721607, -1.9741723>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.0969367, -2.1721607, -1.9741723>,
  <2.6803516, -2.1465619, -1.7951330>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6803516, -2.1465619, -1.7951330>,
  <3.2637666, -2.1209631, -1.6160936>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.5823939, -1.4420066, -4.3611473> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <1.5823939, -1.4420066, -4.3611473>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <1.5823939, -1.4420066, -4.3611473>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <1.5823939, -1.4420066, -4.3611473>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1820917, -1.2744435, -4.6910893> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.1820917, -1.2744435, -4.6910893>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.1820917, -1.2744435, -4.6910893>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.1820917, -1.2744435, -4.6910893>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.1820917, -1.2744435, -4.6910893>,
  <-3.8937506, -1.0501300, -5.2852609>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.8937506, -1.0501300, -5.2852609>,
  <-3.6054094, -0.8258166, -5.8794326>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1820917, -1.2744435, -4.6910893>,
  <-4.9304470, -1.2759627, -4.6186303>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.9304470, -1.2759627, -4.6186303>,
  <-5.6788022, -1.2774819, -4.5461712>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.8638435, -2.0805827, -2.7291248> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.8638435, -2.0805827, -2.7291248>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.8638435, -2.0805827, -2.7291248>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.8638435, -2.0805827, -2.7291248>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.2201338, -0.8837369, -6.0062402> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.2201338, -0.8837369, -6.0062402>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.2201338, -0.8837369, -6.0062402>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.2201338, -0.8837369, -6.0062402>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.2201338, -0.8837369, -6.0062402>,
  <-2.9127716, -0.8547767, -5.9428364>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.9127716, -0.8547767, -5.9428364>,
  <-3.6054094, -0.8258166, -5.8794326>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.2201338, -0.8837369, -6.0062402>,
  <-1.8854178, -0.6095006, -6.6215479>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8854178, -0.6095006, -6.6215479>,
  <-1.5507019, -0.3352643, -7.2368556>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.3301865, -1.3953891, -5.1063982> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.3301865, -1.3953891, -5.1063982>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.3301865, -1.3953891, -5.1063982>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.3301865, -1.3953891, -5.1063982>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<1.4797530, -2.8171909, 0.9974539> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.4797530, -2.8171909, 0.9974539>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.4797530, -2.8171909, 0.9974539>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.4797530, -2.8171909, 0.9974539>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.4797530, -2.8171909, 0.9974539>,
  <1.6120425, -2.0859953, 1.2058829>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.6120425, -2.0859953, 1.2058829>,
  <1.7443320, -1.3547998, 1.4143119>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4797530, -2.8171909, 0.9974539>,
  <1.9325887, -3.0368650, 0.7886262>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9325887, -3.0368650, 0.7886262>,
  <2.3854244, -3.2565392, 0.5797984>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4797530, -2.8171909, 0.9974539>,
  <1.2463706, -3.2688648, 1.5909600>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2463706, -3.2688648, 1.5909600>,
  <1.0129883, -3.7205388, 2.1844660>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.4862663, -2.6785463, 0.2112960> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.4862663, -2.6785463, 0.2112960>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.4862663, -2.6785463, 0.2112960>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.4862663, -2.6785463, 0.2112960>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<3.2637666, -2.1209631, -1.6160936> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <3.2637666, -2.1209631, -1.6160936>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <3.2637666, -2.1209631, -1.6160936>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <3.2637666, -2.1209631, -1.6160936>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-3.6054094, -0.8258166, -5.8794326> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.6054094, -0.8258166, -5.8794326>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.6054094, -0.8258166, -5.8794326>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.6054094, -0.8258166, -5.8794326>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.6054094, -0.8258166, -5.8794326>,
  <-3.9121635, -0.6282785, -6.2788543>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9121635, -0.6282785, -6.2788543>,
  <-4.2189176, -0.4307405, -6.6782761>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.6788022, -1.2774819, -4.5461712> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.6788022, -1.2774819, -4.5461712>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.6788022, -1.2774819, -4.5461712>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.6788022, -1.2774819, -4.5461712>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.6788022, -1.2774819, -4.5461712>,
  <-5.8725008, -1.2037505, -3.9023936>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8725008, -1.2037505, -3.9023936>,
  <-6.0661993, -1.1300191, -3.2586159>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6788022, -1.2774819, -4.5461712>,
  <-5.9491964, -1.8568763, -4.7663863>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9491964, -1.8568763, -4.7663863>,
  <-6.2195905, -2.4362707, -4.9866013>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6788022, -1.2774819, -4.5461712>,
  <-5.9663522, -0.7793150, -4.9022099>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9663522, -0.7793150, -4.9022099>,
  <-6.2539021, -0.2811481, -5.2582486>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.5507019, -0.3352643, -7.2368556> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.5507019, -0.3352643, -7.2368556>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.5507019, -0.3352643, -7.2368556>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.5507019, -0.3352643, -7.2368556>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.5507019, -0.3352643, -7.2368556>,
  <-1.2810850, 0.2767831, -7.1164693>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.2810850, 0.2767831, -7.1164693>,
  <-1.0114681, 0.8888304, -6.9960829>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5507019, -0.3352643, -7.2368556>,
  <-1.9822925, -0.2619511, -7.7505604>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9822925, -0.2619511, -7.7505604>,
  <-2.4138831, -0.1886378, -8.2642652>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5507019, -0.3352643, -7.2368556>,
  <-1.0471510, -0.7305056, -7.4465397>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0471510, -0.7305056, -7.4465397>,
  <-0.5436002, -1.1257469, -7.6562238>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.7443320, -1.3547998, 1.4143119> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.7443320, -1.3547998, 1.4143119>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.7443320, -1.3547998, 1.4143119>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.7443320, -1.3547998, 1.4143119>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.7443320, -1.3547998, 1.4143119>,
  <1.2695017, -0.9613223, 1.4474322>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2695017, -0.9613223, 1.4474322>,
  <0.7946715, -0.5678448, 1.4805525>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7443320, -1.3547998, 1.4143119>,
  <2.3799746, -1.1718654, 1.5624128>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3799746, -1.1718654, 1.5624128>,
  <3.0156173, -0.9889309, 1.7105138>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.3854244, -3.2565392, 0.5797984> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.3854244, -3.2565392, 0.5797984>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.3854244, -3.2565392, 0.5797984>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.3854244, -3.2565392, 0.5797984>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<1.0129883, -3.7205388, 2.1844660> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.0129883, -3.7205388, 2.1844660>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.0129883, -3.7205388, 2.1844660>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.0129883, -3.7205388, 2.1844660>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.0129883, -3.7205388, 2.1844660>,
  <0.9642048, -4.4443295, 1.9279270>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9642048, -4.4443295, 1.9279270>,
  <0.9154213, -5.1681203, 1.6713880>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0129883, -3.7205388, 2.1844660>,
  <0.3281959, -3.4982764, 2.4535650>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3281959, -3.4982764, 2.4535650>,
  <-0.3565966, -3.2760141, 2.7226641>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0129883, -3.7205388, 2.1844660>,
  <1.5278814, -3.6933007, 2.7544778>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.5278814, -3.6933007, 2.7544778>,
  <2.0427745, -3.6660627, 3.3244895>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.2189176, -0.4307405, -6.6782761> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.2189176, -0.4307405, -6.6782761>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.2189176, -0.4307405, -6.6782761>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.2189176, -0.4307405, -6.6782761>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-6.0661993, -1.1300191, -3.2586159> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-6.0661993, -1.1300191, -3.2586159>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-6.0661993, -1.1300191, -3.2586159>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-6.0661993, -1.1300191, -3.2586159>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-6.2195905, -2.4362707, -4.9866013> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-6.2195905, -2.4362707, -4.9866013>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-6.2195905, -2.4362707, -4.9866013>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-6.2195905, -2.4362707, -4.9866013>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-6.2539021, -0.2811481, -5.2582486> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-6.2539021, -0.2811481, -5.2582486>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-6.2539021, -0.2811481, -5.2582486>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-6.2539021, -0.2811481, -5.2582486>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-1.0114681, 0.8888304, -6.9960829> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-1.0114681, 0.8888304, -6.9960829>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-1.0114681, 0.8888304, -6.9960829>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-1.0114681, 0.8888304, -6.9960829>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.4138831, -0.1886378, -8.2642652> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-2.4138831, -0.1886378, -8.2642652>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-2.4138831, -0.1886378, -8.2642652>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-2.4138831, -0.1886378, -8.2642652>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.5436002, -1.1257469, -7.6562238> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <-0.5436002, -1.1257469, -7.6562238>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <-0.5436002, -1.1257469, -7.6562238>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <-0.5436002, -1.1257469, -7.6562238>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.7946715, -0.5678448, 1.4805525> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <0.7946715, -0.5678448, 1.4805525>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <0.7946715, -0.5678448, 1.4805525>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <0.7946715, -0.5678448, 1.4805525>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<3.0156173, -0.9889309, 1.7105138> 0.2812500
   pigment{color rgbt <0.4,0.4,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.281, 0.011 rotate <90,0,0> translate <3.0156173, -0.9889309, 1.7105138>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.281, 0.005 rotate <-30,0,0> translate <3.0156173, -0.9889309, 1.7105138>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.281, 0.005 rotate <-30,0,90> translate <3.0156173, -0.9889309, 1.7105138>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.0156173, -0.9889309, 1.7105138>,
  <3.6262431, -1.3850763, 1.5761683>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6262431, -1.3850763, 1.5761683>,
  <4.2368690, -1.7812217, 1.4418229>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0156173, -0.9889309, 1.7105138>,
  <3.1689544, -0.3052076, 1.9649472>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1689544, -0.3052076, 1.9649472>,
  <3.3222914, 0.3785157, 2.2193807>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.9154213, -5.1681203, 1.6713880> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.9154213, -5.1681203, 1.6713880>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.9154213, -5.1681203, 1.6713880>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.9154213, -5.1681203, 1.6713880>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.9154213, -5.1681203, 1.6713880>,
  <1.4018896, -5.3482665, 1.4938421>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4018896, -5.3482665, 1.4938421>,
  <1.8883580, -5.5284126, 1.3162962>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9154213, -5.1681203, 1.6713880>,
  <0.5585613, -5.2090508, 1.2590623>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5585613, -5.2090508, 1.2590623>,
  <0.2017013, -5.2499814, 0.8467365>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9154213, -5.1681203, 1.6713880>,
  <0.7493108, -5.5000077, 2.0744018>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.7493108, -5.5000077, 2.0744018>,
  <0.5832003, -5.8318951, 2.4774155>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.3565966, -3.2760141, 2.7226641> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.3565966, -3.2760141, 2.7226641>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.3565966, -3.2760141, 2.7226641>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.3565966, -3.2760141, 2.7226641>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.3565966, -3.2760141, 2.7226641>,
  <-0.3624719, -2.7468762, 2.8575173>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3624719, -2.7468762, 2.8575173>,
  <-0.3683472, -2.2177382, 2.9923706>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3565966, -3.2760141, 2.7226641>,
  <-0.4830155, -3.5697970, 3.1674055>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.4830155, -3.5697970, 3.1674055>,
  <-0.6094344, -3.8635799, 3.6121468>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3565966, -3.2760141, 2.7226641>,
  <-0.7550413, -3.3624227, 2.3589137>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.7550413, -3.3624227, 2.3589137>,
  <-1.1534860, -3.4488313, 1.9951634>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.0427745, -3.6660627, 3.3244895> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.0427745, -3.6660627, 3.3244895>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.0427745, -3.6660627, 3.3244895>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.0427745, -3.6660627, 3.3244895>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.0427745, -3.6660627, 3.3244895>,
  <1.8804279, -3.9919962, 3.7334223>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.8804279, -3.9919962, 3.7334223>,
  <1.7180813, -4.3179297, 4.1423550>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0427745, -3.6660627, 3.3244895>,
  <2.0993707, -3.1605007, 3.5264122>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0993707, -3.1605007, 3.5264122>,
  <2.1559670, -2.6549387, 3.7283348>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0427745, -3.6660627, 3.3244895>,
  <2.5342133, -3.8422902, 3.1595292>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5342133, -3.8422902, 3.1595292>,
  <3.0256522, -4.0185177, 2.9945688>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.2368690, -1.7812217, 1.4418229> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.2368690, -1.7812217, 1.4418229>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.2368690, -1.7812217, 1.4418229>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.2368690, -1.7812217, 1.4418229>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.2368690, -1.7812217, 1.4418229>,
  <4.7982414, -1.2624607, 1.4785357>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.7982414, -1.2624607, 1.4785357>,
  <5.3596139, -0.7436998, 1.5152486>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.2368690, -1.7812217, 1.4418229>,
  <4.2051619, -2.0179062, 0.9517520>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.2051619, -2.0179062, 0.9517520>,
  <4.1734549, -2.2545907, 0.4616810>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.2368690, -1.7812217, 1.4418229>,
  <4.3034044, -2.1641239, 1.8277199>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3034044, -2.1641239, 1.8277199>,
  <4.3699398, -2.5470261, 2.2136170>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.3222914, 0.3785157, 2.2193807> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.3222914, 0.3785157, 2.2193807>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.3222914, 0.3785157, 2.2193807>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.3222914, 0.3785157, 2.2193807>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.3222914, 0.3785157, 2.2193807>,
  <4.0776013, 0.3134159, 2.3849944>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.0776013, 0.3134159, 2.3849944>,
  <4.8329112, 0.2483160, 2.5506082>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3222914, 0.3785157, 2.2193807>,
  <3.2247466, 0.9062020, 1.6722439>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2247466, 0.9062020, 1.6722439>,
  <3.1272018, 1.4338883, 1.1251072>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3222914, 0.3785157, 2.2193807>,
  <2.9230810, 0.5344638, 2.8571272>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9230810, 0.5344638, 2.8571272>,
  <2.5238706, 0.6904119, 3.4948736>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.8883580, -5.5284126, 1.3162962> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.8883580, -5.5284126, 1.3162962>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.8883580, -5.5284126, 1.3162962>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.8883580, -5.5284126, 1.3162962>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.2017013, -5.2499814, 0.8467365> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.2017013, -5.2499814, 0.8467365>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.2017013, -5.2499814, 0.8467365>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.2017013, -5.2499814, 0.8467365>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<0.5832003, -5.8318951, 2.4774155> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.5832003, -5.8318951, 2.4774155>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.5832003, -5.8318951, 2.4774155>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.5832003, -5.8318951, 2.4774155>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.3683472, -2.2177382, 2.9923706> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.3683472, -2.2177382, 2.9923706>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.3683472, -2.2177382, 2.9923706>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.3683472, -2.2177382, 2.9923706>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-0.6094344, -3.8635799, 3.6121468> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.6094344, -3.8635799, 3.6121468>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.6094344, -3.8635799, 3.6121468>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.6094344, -3.8635799, 3.6121468>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-1.1534860, -3.4488313, 1.9951634> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.1534860, -3.4488313, 1.9951634>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.1534860, -3.4488313, 1.9951634>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.1534860, -3.4488313, 1.9951634>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<1.7180813, -4.3179297, 4.1423550> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.7180813, -4.3179297, 4.1423550>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.7180813, -4.3179297, 4.1423550>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.7180813, -4.3179297, 4.1423550>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<2.1559670, -2.6549387, 3.7283348> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.1559670, -2.6549387, 3.7283348>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.1559670, -2.6549387, 3.7283348>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.1559670, -2.6549387, 3.7283348>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<3.0256522, -4.0185177, 2.9945688> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.0256522, -4.0185177, 2.9945688>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.0256522, -4.0185177, 2.9945688>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.0256522, -4.0185177, 2.9945688>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<5.3596139, -0.7436998, 1.5152486> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.3596139, -0.7436998, 1.5152486>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.3596139, -0.7436998, 1.5152486>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.3596139, -0.7436998, 1.5152486>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.3596139, -0.7436998, 1.5152486>,
  <5.0962625, -0.2476919, 2.0329284>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0962625, -0.2476919, 2.0329284>,
  <4.8329112, 0.2483160, 2.5506082>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3596139, -0.7436998, 1.5152486>,
  <5.4221187, -0.4994766, 1.0296658>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.4221187, -0.4994766, 1.0296658>,
  <5.4846234, -0.2552535, 0.5440830>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3596139, -0.7436998, 1.5152486>,
  <5.8377127, -0.9686184, 1.6552809>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.8377127, -0.9686184, 1.6552809>,
  <6.3158115, -1.1935370, 1.7953132>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.1734549, -2.2545907, 0.4616810> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.1734549, -2.2545907, 0.4616810>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.1734549, -2.2545907, 0.4616810>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.1734549, -2.2545907, 0.4616810>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<4.3699398, -2.5470261, 2.2136170> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.3699398, -2.5470261, 2.2136170>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.3699398, -2.5470261, 2.2136170>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.3699398, -2.5470261, 2.2136170>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<4.8329112, 0.2483160, 2.5506082> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.8329112, 0.2483160, 2.5506082>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.8329112, 0.2483160, 2.5506082>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.8329112, 0.2483160, 2.5506082>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.8329112, 0.2483160, 2.5506082>,
  <5.0808720, 0.7348916, 2.5376195>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0808720, 0.7348916, 2.5376195>,
  <5.3288329, 1.2214673, 2.5246309>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.8329112, 0.2483160, 2.5506082>,
  <4.8883188, 0.0412511, 3.0556892>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.8883188, 0.0412511, 3.0556892>,
  <4.9437264, -0.1658138, 3.5607703>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1272018, 1.4338883, 1.1251072> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.1272018, 1.4338883, 1.1251072>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.1272018, 1.4338883, 1.1251072>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.1272018, 1.4338883, 1.1251072>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.1272018, 1.4338883, 1.1251072>,
  <3.0850925, 2.1125335, 1.2943955>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0850925, 2.1125335, 1.2943955>,
  <3.0429831, 2.7911787, 1.4636839>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1272018, 1.4338883, 1.1251072>,
  <3.1258824, 1.2612323, 0.4464000>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1258824, 1.2612323, 0.4464000>,
  <3.1245630, 1.0885763, -0.2323073>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.5238706, 0.6904119, 3.4948736> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.5238706, 0.6904119, 3.4948736>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.5238706, 0.6904119, 3.4948736>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.5238706, 0.6904119, 3.4948736>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.5238706, 0.6904119, 3.4948736>,
  <2.7463957, 1.1149331, 3.7587761>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.7463957, 1.1149331, 3.7587761>,
  <2.9689208, 1.5394542, 4.0226785>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5238706, 0.6904119, 3.4948736>,
  <2.5458142, 0.2590033, 3.8311080>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5458142, 0.2590033, 3.8311080>,
  <2.5677577, -0.1724054, 4.1673424>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5238706, 0.6904119, 3.4948736>,
  <2.0023450, 0.8025062, 3.3858936>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0023450, 0.8025062, 3.3858936>,
  <1.4808194, 0.9146005, 3.2769135>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.4846234, -0.2552535, 0.5440830> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.4846234, -0.2552535, 0.5440830>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.4846234, -0.2552535, 0.5440830>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.4846234, -0.2552535, 0.5440830>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<6.3158115, -1.1935370, 1.7953132> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.3158115, -1.1935370, 1.7953132>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.3158115, -1.1935370, 1.7953132>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.3158115, -1.1935370, 1.7953132>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<5.3288329, 1.2214673, 2.5246309> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.3288329, 1.2214673, 2.5246309>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.3288329, 1.2214673, 2.5246309>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.3288329, 1.2214673, 2.5246309>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<4.9437264, -0.1658138, 3.5607703> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9437264, -0.1658138, 3.5607703>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9437264, -0.1658138, 3.5607703>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9437264, -0.1658138, 3.5607703>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<3.0429831, 2.7911787, 1.4636839> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.0429831, 2.7911787, 1.4636839>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.0429831, 2.7911787, 1.4636839>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.0429831, 2.7911787, 1.4636839>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.0429831, 2.7911787, 1.4636839>,
  <2.9976135, 3.2853521, 0.9741336>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9976135, 3.2853521, 0.9741336>,
  <2.9522438, 3.7795255, 0.4845833>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0429831, 2.7911787, 1.4636839>,
  <3.0446914, 2.9430640, 1.9843356>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0446914, 2.9430640, 1.9843356>,
  <3.0463997, 3.0949494, 2.5049873>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1245630, 1.0885763, -0.2323073> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.1245630, 1.0885763, -0.2323073>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.1245630, 1.0885763, -0.2323073>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.1245630, 1.0885763, -0.2323073>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.1245630, 1.0885763, -0.2323073>,
  <3.0808987, 1.5758922, -0.7295619>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0808987, 1.5758922, -0.7295619>,
  <3.0372344, 2.0632082, -1.2268165>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1245630, 1.0885763, -0.2323073>,
  <3.1561854, 0.5690207, -0.3823579>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1561854, 0.5690207, -0.3823579>,
  <3.1878078, 0.0494651, -0.5324085>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.9689208, 1.5394542, 4.0226785> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.9689208, 1.5394542, 4.0226785>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.9689208, 1.5394542, 4.0226785>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.9689208, 1.5394542, 4.0226785>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<2.5677577, -0.1724054, 4.1673424> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.5677577, -0.1724054, 4.1673424>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.5677577, -0.1724054, 4.1673424>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.5677577, -0.1724054, 4.1673424>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<1.4808194, 0.9146005, 3.2769135> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.4808194, 0.9146005, 3.2769135>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.4808194, 0.9146005, 3.2769135>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.4808194, 0.9146005, 3.2769135>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<2.9522438, 3.7795255, 0.4845833> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.9522438, 3.7795255, 0.4845833>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.9522438, 3.7795255, 0.4845833>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.9522438, 3.7795255, 0.4845833>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.9522438, 3.7795255, 0.4845833>,
  <2.9534950, 3.5876849, -0.1824916>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9534950, 3.5876849, -0.1824916>,
  <2.9547463, 3.3958444, -0.8495665>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9522438, 3.7795255, 0.4845833>,
  <2.9180544, 4.3052597, 0.6134463>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9180544, 4.3052597, 0.6134463>,
  <2.8838650, 4.8309939, 0.7423092>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.0463997, 3.0949494, 2.5049873> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.0463997, 3.0949494, 2.5049873>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.0463997, 3.0949494, 2.5049873>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.0463997, 3.0949494, 2.5049873>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<3.0372344, 2.0632082, -1.2268165> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.0372344, 2.0632082, -1.2268165>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.0372344, 2.0632082, -1.2268165>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.0372344, 2.0632082, -1.2268165>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.0372344, 2.0632082, -1.2268165>,
  <2.9959904, 2.7295263, -1.0381915>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9959904, 2.7295263, -1.0381915>,
  <2.9547463, 3.3958444, -0.8495665>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0372344, 2.0632082, -1.2268165>,
  <3.0359756, 1.9285666, -1.7521665>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0359756, 1.9285666, -1.7521665>,
  <3.0347168, 1.7939250, -2.2775165>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1878078, 0.0494651, -0.5324085> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1878078, 0.0494651, -0.5324085>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1878078, 0.0494651, -0.5324085>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1878078, 0.0494651, -0.5324085>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<2.9547463, 3.3958444, -0.8495665> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.9547463, 3.3958444, -0.8495665>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.9547463, 3.3958444, -0.8495665>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.9547463, 3.3958444, -0.8495665>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.9547463, 3.3958444, -0.8495665>,
  <2.9110086, 3.8734290, -1.3271172>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9110086, 3.8734290, -1.3271172>,
  <2.8672709, 4.3510137, -1.8046679>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.00>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.8838650, 4.8309939, 0.7423092> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.8838650, 4.8309939, 0.7423092>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.8838650, 4.8309939, 0.7423092>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.8838650, 4.8309939, 0.7423092>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<3.0347168, 1.7939250, -2.2775165> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.0347168, 1.7939250, -2.2775165>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.0347168, 1.7939250, -2.2775165>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.0347168, 1.7939250, -2.2775165>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<2.8672709, 4.3510137, -1.8046679> 0.2700000
   pigment{color rgbt <0.0,1.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.270, 0.011 rotate <90,0,0> translate <2.8672709, 4.3510137, -1.8046679>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,0> translate <2.8672709, 4.3510137, -1.8046679>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.270, 0.005 rotate <-30,0,90> translate <2.8672709, 4.3510137, -1.8046679>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
sphere {<-2.6902926, -2.9198345, -0.1896946> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.00>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-2.6902926, -2.9198345, -0.1896946>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-2.6902926, -2.9198345, -0.1896946>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-2.6902926, -2.9198345, -0.1896946>
   pigment{color rgbt <0.00,0.00,0.00,0.00>}
   finish{F_flat}
   no_shadow}
// Section containing the transparent atoms and bonds

 merge {
sphere {<2.8847577, 8.2462692, 6.4128038> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.8847577, 8.2462692, 6.4128038>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.8847577, 8.2462692, 6.4128038>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.8847577, 8.2462692, 6.4128038>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.8847577, 8.2462692, 6.4128038>,
  <2.2172927, 8.4418585, 6.4662328>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.2172937, 8.4418585, 6.4662328>,
  <1.5498296, 8.6374478, 6.5196618>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8847577, 8.2462692, 6.4128038>,
  <3.3096492, 8.5742576, 5.9675193>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3096492, 8.5742576, 5.9675203>,
  <3.7345407, 8.9022460, 5.5222368>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8847577, 8.2462692, 6.4128038>,
  <3.1523363, 7.6682172, 6.8454221>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1523363, 7.6682182, 6.8454221>,
  <3.4199149, 7.0901672, 7.2780404>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.5498296, 8.6374478, 6.5196618> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.5498296, 8.6374478, 6.5196618>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.5498296, 8.6374478, 6.5196618>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.5498296, 8.6374478, 6.5196618>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.5498296, 8.6374478, 6.5196618>,
  <1.3074400, 9.1611353, 6.1281197>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.3074400, 9.1611343, 6.1281197>,
  <1.0650503, 9.6848207, 5.7365776>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.5498296, 8.6374478, 6.5196618>,
  <1.2150778, 8.3790207, 6.8710414>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2150778, 8.3790207, 6.8710404>,
  <0.8803259, 8.1205936, 7.2224189>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.0650503, 9.6848207, 5.7365776> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.0650503, 9.6848207, 5.7365776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.0650503, 9.6848207, 5.7365776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.0650503, 9.6848207, 5.7365776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.0650503, 9.6848207, 5.7365776>,
  <1.4900488, 10.0127908, 5.2909125>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4900488, 10.0127908, 5.2909135>,
  <1.9150473, 10.3407608, 4.8452494>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0650503, 9.6848207, 5.7365776>,
  <0.5390321, 9.8392210, 5.7788901>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5390331, 9.8392210, 5.7788901>,
  <0.0130159, 9.9936212, 5.8212027>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.9150473, 10.3407608, 4.8452494> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.9150473, 10.3407608, 4.8452494>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.9150473, 10.3407608, 4.8452494>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.9150473, 10.3407608, 4.8452494>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.9150473, 10.3407608, 4.8452494>,
  <2.5822863, 10.1450350, 4.7916887>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5822853, 10.1450350, 4.7916887>,
  <3.2495233, 9.9493093, 4.7381280>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9150473, 10.3407608, 4.8452494>,
  <1.7238114, 10.7536370, 4.5365636>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7238114, 10.7536360, 4.5365636>,
  <1.5325755, 11.1665112, 4.2278777>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.2495233, 9.9493093, 4.7381280> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.2495233, 9.9493093, 4.7381280>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.2495233, 9.9493093, 4.7381280>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.2495233, 9.9493093, 4.7381280>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.2495233, 9.9493093, 4.7381280>,
  <3.4920320, 9.4257766, 5.1301824>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4920320, 9.4257776, 5.1301824>,
  <3.7345407, 8.9022460, 5.5222368>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2495233, 9.9493093, 4.7381280>,
  <3.5845965, 10.2076862, 4.3869351>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.5845965, 10.2076862, 4.3869361>,
  <3.9196696, 10.4660632, 4.0357442>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.7345407, 8.9022460, 5.5222368> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.7345407, 8.9022460, 5.5222368>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.7345407, 8.9022460, 5.5222368>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.7345407, 8.9022460, 5.5222368>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.7345407, 8.9022460, 5.5222368>,
  <4.2605992, 8.7480968, 5.4799990>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.2605982, 8.7480968, 5.4799990>,
  <4.7866558, 8.5939477, 5.4377611>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.8803259, 8.1205936, 7.2224189> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.8803259, 8.1205936, 7.2224189>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.8803259, 8.1205936, 7.2224189>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.8803259, 8.1205936, 7.2224189>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.0130159, 9.9936212, 5.8212027> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.0130159, 9.9936212, 5.8212027>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.0130159, 9.9936212, 5.8212027>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.0130159, 9.9936212, 5.8212027>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.5325755, 11.1665112, 4.2278777> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.5325755, 11.1665112, 4.2278777>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.5325755, 11.1665112, 4.2278777>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.5325755, 11.1665112, 4.2278777>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.9196696, 10.4660632, 4.0357442> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.9196696, 10.4660632, 4.0357442>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.9196696, 10.4660632, 4.0357442>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.9196696, 10.4660632, 4.0357442>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.7866558, 8.5939477, 5.4377611> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.7866558, 8.5939477, 5.4377611>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.7866558, 8.5939477, 5.4377611>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.7866558, 8.5939477, 5.4377611>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.4199149, 7.0901672, 7.2780404> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.4199149, 7.0901672, 7.2780404>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.4199149, 7.0901672, 7.2780404>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.4199149, 7.0901672, 7.2780404>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.4199149, 7.0901672, 7.2780404>,
  <3.0250893, 6.7424001, 7.3749763>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0250903, 6.7424001, 7.3749763>,
  <2.6302657, 6.3946329, 7.4719122>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4199149, 7.0901672, 7.2780404>,
  <3.6040943, 7.2845175, 7.7412156>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6040943, 7.2845165, 7.7412156>,
  <3.7882736, 7.4788658, 8.2043908>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4199149, 7.0901672, 7.2780404>,
  <3.8164770, 6.8419517, 7.0185143>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8164760, 6.8419517, 7.0185143>,
  <4.2130371, 6.5937361, 6.7589882>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.6302657, 6.3946329, 7.4719122> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.6302657, 6.3946329, 7.4719122>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.6302657, 6.3946329, 7.4719122>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.6302657, 6.3946329, 7.4719122>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.7882736, 7.4788658, 8.2043908> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.7882736, 7.4788658, 8.2043908>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.7882736, 7.4788658, 8.2043908>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.7882736, 7.4788658, 8.2043908>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.2130371, 6.5937361, 6.7589882> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.2130371, 6.5937361, 6.7589882>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.2130371, 6.5937361, 6.7589882>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.2130371, 6.5937361, 6.7589882>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.0108786, 9.4732709, 4.0423050> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.0108786, 9.4732709, 4.0423050>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.0108786, 9.4732709, 4.0423050>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.0108786, 9.4732709, 4.0423050>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.0108786, 9.4732709, 4.0423050>,
  <-0.8915292, 8.8075976, 3.8712678>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.8915292, 8.8075986, 3.8712678>,
  <-0.7721797, 8.1419262, 3.7002306>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0108786, 9.4732709, 4.0423050>,
  <-0.6091254, 9.9785364, 3.7783173>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6091254, 9.9785354, 3.7783173>,
  <-0.2073722, 10.4837998, 3.5143297>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0108786, 9.4732709, 4.0423050>,
  <-1.5861457, 9.6501444, 4.5226017>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5861447, 9.6501444, 4.5226017>,
  <-2.1614108, 9.8270179, 5.0028983>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.7721797, 8.1419262, 3.7002306> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.7721797, 8.1419262, 3.7002306>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.7721797, 8.1419262, 3.7002306>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.7721797, 8.1419262, 3.7002306>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.7721797, 8.1419262, 3.7002306>,
  <-0.2513951, 7.9816301, 3.2650354>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2513961, 7.9816301, 3.2650354>,
  <0.2693875, 7.8213340, 2.8298402>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.7721797, 8.1419262, 3.7002306>,
  <-1.0892458, 7.7437353, 3.9081359>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0892458, 7.7437363, 3.9081359>,
  <-1.4063118, 7.3455464, 4.1160413>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.2693875, 7.8213340, 2.8298402> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.2693875, 7.8213340, 2.8298402>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.2693875, 7.8213340, 2.8298402>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.2693875, 7.8213340, 2.8298402>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.2693875, 7.8213340, 2.8298402>,
  <0.6714815, 8.3267827, 2.5659324>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6714815, 8.3267817, 2.5659324>,
  <1.0735756, 8.8322294, 2.3020246>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.2693875, 7.8213340, 2.8298402>,
  <0.3632929, 7.2966823, 2.6947573>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3632929, 7.2966833, 2.6947573>,
  <0.4571984, 6.7720326, 2.5596743>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.0735756, 8.8322294, 2.3020246> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.0735756, 8.8322294, 2.3020246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.0735756, 8.8322294, 2.3020246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.0735756, 8.8322294, 2.3020246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.0735756, 8.8322294, 2.3020246>,
  <0.9543747, 9.4977107, 2.4732294>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9543747, 9.4977097, 2.4732294>,
  <0.8351738, 10.1631900, 2.6444342>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0735756, 8.8322294, 2.3020246>,
  <1.4841850, 8.7057177, 1.9589216>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4841840, 8.7057177, 1.9589216>,
  <1.8947925, 8.5792061, 1.6158187>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.8351738, 10.1631900, 2.6444342> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.8351738, 10.1631900, 2.6444342>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.8351738, 10.1631900, 2.6444342>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.8351738, 10.1631900, 2.6444342>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.8351738, 10.1631900, 2.6444342>,
  <0.3138998, 10.3234949, 3.0793819>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3139008, 10.3234949, 3.0793819>,
  <-0.2073722, 10.4837998, 3.5143297>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8351738, 10.1631900, 2.6444342>,
  <1.1519857, 10.5616564, 2.4365309>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.1519857, 10.5616554, 2.4365309>,
  <1.4687976, 10.9601207, 2.2286275>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.2073722, 10.4837998, 3.5143297> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.2073722, 10.4837998, 3.5143297>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.2073722, 10.4837998, 3.5143297>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.2073722, 10.4837998, 3.5143297>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.2073722, 10.4837998, 3.5143297>,
  <-0.3013122, 11.0084727, 3.6491505>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3013122, 11.0084717, 3.6491505>,
  <-0.3952521, 11.5331436, 3.7839713>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.4063118, 7.3455464, 4.1160413> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.4063118, 7.3455464, 4.1160413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.4063118, 7.3455464, 4.1160413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.4063118, 7.3455464, 4.1160413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.4571984, 6.7720326, 2.5596743> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.4571984, 6.7720326, 2.5596743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.4571984, 6.7720326, 2.5596743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.4571984, 6.7720326, 2.5596743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.8947925, 8.5792061, 1.6158187> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.8947925, 8.5792061, 1.6158187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.8947925, 8.5792061, 1.6158187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.8947925, 8.5792061, 1.6158187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.4687976, 10.9601207, 2.2286275> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.4687976, 10.9601207, 2.2286275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.4687976, 10.9601207, 2.2286275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.4687976, 10.9601207, 2.2286275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.3952521, 11.5331436, 3.7839713> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.3952521, 11.5331436, 3.7839713>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.3952521, 11.5331436, 3.7839713>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.3952521, 11.5331436, 3.7839713>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.1614108, 9.8270179, 5.0028983> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.1614108, 9.8270179, 5.0028983>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.1614108, 9.8270179, 5.0028983>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.1614108, 9.8270179, 5.0028983>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.1614108, 9.8270179, 5.0028983>,
  <-2.2376163, 9.4236992, 5.3460492>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.2376163, 9.4237002, 5.3460492>,
  <-2.3138218, 9.0203826, 5.6892000>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1614108, 9.8270179, 5.0028983>,
  <-2.6092907, 9.9092673, 4.7220702>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6092897, 9.9092673, 4.7220702>,
  <-3.0571686, 9.9915168, 4.4412421>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1614108, 9.8270179, 5.0028983>,
  <-2.0370240, 10.2709788, 5.2742878>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.0370240, 10.2709778, 5.2742878>,
  <-1.9126373, 10.7149378, 5.5456773>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.3138218, 9.0203826, 5.6892000> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.3138218, 9.0203826, 5.6892000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.3138218, 9.0203826, 5.6892000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.3138218, 9.0203826, 5.6892000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.0571686, 9.9915168, 4.4412421> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.0571686, 9.9915168, 4.4412421>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.0571686, 9.9915168, 4.4412421>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.0571686, 9.9915168, 4.4412421>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.9126373, 10.7149378, 5.5456773> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.9126373, 10.7149378, 5.5456773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.9126373, 10.7149378, 5.5456773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.9126373, 10.7149378, 5.5456773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.9657247, 8.2578025, -6.3431512> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.9657247, 8.2578025, -6.3431512>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.9657247, 8.2578025, -6.3431512>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.9657247, 8.2578025, -6.3431512>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.9657247, 8.2578025, -6.3431512>,
  <2.6133513, 8.4936562, -6.2355795>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6133503, 8.4936562, -6.2355795>,
  <3.2609758, 8.7295100, -6.1280078>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9657247, 8.2578025, -6.3431512>,
  <1.6810976, 7.8042400, -5.8963219>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.6810976, 7.8042410, -5.8963219>,
  <1.3964704, 7.3506795, -5.4494926>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9657247, 8.2578025, -6.3431512>,
  <1.5651842, 8.4982061, -6.9552579>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.5651842, 8.4982061, -6.9552569>,
  <1.1646436, 8.7386097, -7.5673626>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.2609758, 8.7295100, -6.1280078> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.2609758, 8.7295100, -6.1280078>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.2609758, 8.7295100, -6.1280078>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.2609758, 8.7295100, -6.1280078>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.2609758, 8.7295100, -6.1280078>,
  <3.6237312, 8.5120828, -5.5735343>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6237312, 8.5120828, -5.5735353>,
  <3.9864867, 8.2946556, -5.0190629>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2609758, 8.7295100, -6.1280078>,
  <3.4850862, 9.0873823, -6.4801631>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4850862, 9.0873813, -6.4801631>,
  <3.7091966, 9.4452526, -6.8323185>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.9864867, 8.2946556, -5.0190629> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.9864867, 8.2946556, -5.0190629>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.9864867, 8.2946556, -5.0190629>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.9864867, 8.2946556, -5.0190629>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.9864867, 8.2946556, -5.0190629>,
  <3.7018451, 7.8407029, -4.5721726>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.7018451, 7.8407039, -4.5721726>,
  <3.4172034, 7.3867523, -4.1252824>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9864867, 8.2946556, -5.0190629>,
  <4.4968398, 8.4807765, -4.9340707>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4968388, 8.4807765, -4.9340707>,
  <5.0071908, 8.6668975, -4.8490785>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.4172034, 7.3867523, -4.1252824> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.4172034, 7.3867523, -4.1252824>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.4172034, 7.3867523, -4.1252824>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.4172034, 7.3867523, -4.1252824>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.4172034, 7.3867523, -4.1252824>,
  <2.7698169, 7.1507950, -4.2329891>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.7698179, 7.1507950, -4.2329891>,
  <2.1224324, 6.9148377, -4.3406959>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4172034, 7.3867523, -4.1252824>,
  <3.7033299, 7.2153680, -3.6881509>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.7033299, 7.2153680, -3.6881519>,
  <3.9894563, 7.0439836, -3.2510213>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.1224324, 6.9148377, -4.3406959> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.1224324, 6.9148377, -4.3406959>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.1224324, 6.9148377, -4.3406959>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.1224324, 6.9148377, -4.3406959>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.1224324, 6.9148377, -4.3406959>,
  <1.7594514, 7.1327586, -4.8950952>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7594514, 7.1327586, -4.8950942>,
  <1.3964704, 7.3506795, -5.4494926>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.1224324, 6.9148377, -4.3406959>,
  <1.8979637, 6.5570635, -3.9885873>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.8979637, 6.5570645, -3.9885873>,
  <1.6734951, 6.1992913, -3.6364787>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.3964704, 7.3506795, -5.4494926> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.3964704, 7.3506795, -5.4494926>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.3964704, 7.3506795, -5.4494926>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.3964704, 7.3506795, -5.4494926>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.3964704, 7.3506795, -5.4494926>,
  <0.8860776, 7.1646711, -5.5342482>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8860786, 7.1646711, -5.5342482>,
  <0.3756867, 6.9786627, -5.6190038>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.7091966, 9.4452526, -6.8323185> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.7091966, 9.4452526, -6.8323185>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.7091966, 9.4452526, -6.8323185>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.7091966, 9.4452526, -6.8323185>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.0071908, 8.6668975, -4.8490785> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.0071908, 8.6668975, -4.8490785>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.0071908, 8.6668975, -4.8490785>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.0071908, 8.6668975, -4.8490785>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.9894563, 7.0439836, -3.2510213> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.9894563, 7.0439836, -3.2510213>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.9894563, 7.0439836, -3.2510213>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.9894563, 7.0439836, -3.2510213>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.6734951, 6.1992913, -3.6364787> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.6734951, 6.1992913, -3.6364787>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.6734951, 6.1992913, -3.6364787>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.6734951, 6.1992913, -3.6364787>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.3756867, 6.9786627, -5.6190038> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.3756867, 6.9786627, -5.6190038>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.3756867, 6.9786627, -5.6190038>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.3756867, 6.9786627, -5.6190038>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.1646436, 8.7386097, -7.5673626> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.1646436, 8.7386097, -7.5673626>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.1646436, 8.7386097, -7.5673626>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.1646436, 8.7386097, -7.5673626>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.1646436, 8.7386097, -7.5673626>,
  <1.5010193, 8.8488384, -7.9685192>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.5010193, 8.8488384, -7.9685182>,
  <1.8373950, 8.9590671, -8.3696738>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.1646436, 8.7386097, -7.5673626>,
  <0.8898861, 9.1793048, -7.4388242>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8898861, 9.1793038, -7.4388242>,
  <0.6151285, 9.6199979, -7.3102858>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.1646436, 8.7386097, -7.5673626>,
  <0.8247266, 8.3547188, -7.7200398>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8247266, 8.3547198, -7.7200398>,
  <0.4848095, 7.9708298, -7.8727170>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.8373950, 8.9590671, -8.3696738> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.8373950, 8.9590671, -8.3696738>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.8373950, 8.9590671, -8.3696738>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.8373950, 8.9590671, -8.3696738>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.6151285, 9.6199979, -7.3102858> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.6151285, 9.6199979, -7.3102858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.6151285, 9.6199979, -7.3102858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.6151285, 9.6199979, -7.3102858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.4848095, 7.9708298, -7.8727170> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.4848095, 7.9708298, -7.8727170>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.4848095, 7.9708298, -7.8727170>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.4848095, 7.9708298, -7.8727170>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.9222633, -8.3703085, 0.6857096> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.9222633, -8.3703085, 0.6857096>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.9222633, -8.3703085, 0.6857096>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.9222633, -8.3703085, 0.6857096>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.9222633, -8.3703085, 0.6857096>,
  <3.2307112, -8.5861262, 0.0984265>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2307112, -8.5861262, 0.0984275>,
  <3.5391592, -8.8019438, -0.4888546>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9222633, -8.3703085, 0.6857096>,
  <3.3054284, -8.2430905, 1.2543819>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3054284, -8.2430905, 1.2543809>,
  <3.6885935, -8.1158724, 1.8230521>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9222633, -8.3703085, 0.6857096>,
  <2.1587560, -8.2726183, 0.7060753>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.1587570, -8.2726183, 0.7060753>,
  <1.3952507, -8.1749281, 0.7264411>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.5391592, -8.8019438, -0.4888546> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.5391592, -8.8019438, -0.4888546>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.5391592, -8.8019438, -0.4888546>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.5391592, -8.8019438, -0.4888546>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.5391592, -8.8019438, -0.4888546>,
  <4.2306589, -8.8901863, -0.5075149>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.2306579, -8.8901863, -0.5075149>,
  <4.9221565, -8.9784288, -0.5261752>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.5391592, -8.8019438, -0.4888546>,
  <3.2369830, -8.9018281, -0.9372120>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2369830, -8.9018281, -0.9372110>,
  <2.9348067, -9.0017124, -1.3855674>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9221565, -8.9784288, -0.5261752> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.9221565, -8.9784288, -0.5261752>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.9221565, -8.9784288, -0.5261752>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.9221565, -8.9784288, -0.5261752>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.9221565, -8.9784288, -0.5261752>,
  <5.3054693, -8.8514054, 0.0428078>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3054693, -8.8514054, 0.0428068>,
  <5.6887820, -8.7243819, 0.6117889>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9221565, -8.9784288, -0.5261752>,
  <5.1653497, -9.1482359, -0.9891519>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.1653497, -9.1482359, -0.9891509>,
  <5.4085428, -9.3180429, -1.4521265>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.6887820, -8.7243819, 0.6117889> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.6887820, -8.7243819, 0.6117889>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.6887820, -8.7243819, 0.6117889>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.6887820, -8.7243819, 0.6117889>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.6887820, -8.7243819, 0.6117889>,
  <5.3803467, -8.5088449, 1.1989826>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3803467, -8.5088449, 1.1989816>,
  <5.0719113, -8.2933079, 1.7861743>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.6887820, -8.7243819, 0.6117889>,
  <6.2339936, -8.7940214, 0.5969651>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2339926, -8.7940214, 0.5969651>,
  <6.7792031, -8.8636610, 0.5821413>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.0719113, -8.2933079, 1.7861743> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.0719113, -8.2933079, 1.7861743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.0719113, -8.2933079, 1.7861743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.0719113, -8.2933079, 1.7861743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.0719113, -8.2933079, 1.7861743>,
  <4.3802514, -8.2045902, 1.8046132>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3802524, -8.2045902, 1.8046132>,
  <3.6885935, -8.1158724, 1.8230521>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0719113, -8.2933079, 1.7861743>,
  <5.3738686, -8.1931609, 2.2346849>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3738686, -8.1931609, 2.2346839>,
  <5.6758259, -8.0930140, 2.6831935>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.6885935, -8.1158724, 1.8230521> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.6885935, -8.1158724, 1.8230521>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.6885935, -8.1158724, 1.8230521>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.6885935, -8.1158724, 1.8230521>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.6885935, -8.1158724, 1.8230521>,
  <3.4455596, -7.9458568, 2.2859907>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4455596, -7.9458568, 2.2859897>,
  <3.2025256, -7.7758411, 2.7489273>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.9348067, -9.0017124, -1.3855674> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.9348067, -9.0017124, -1.3855674>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.9348067, -9.0017124, -1.3855674>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.9348067, -9.0017124, -1.3855674>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.4085428, -9.3180429, -1.4521265> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.4085428, -9.3180429, -1.4521265>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.4085428, -9.3180429, -1.4521265>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.4085428, -9.3180429, -1.4521265>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.7792031, -8.8636610, 0.5821413> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.7792031, -8.8636610, 0.5821413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.7792031, -8.8636610, 0.5821413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.7792031, -8.8636610, 0.5821413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.6758259, -8.0930140, 2.6831935> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.6758259, -8.0930140, 2.6831935>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.6758259, -8.0930140, 2.6831935>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.6758259, -8.0930140, 2.6831935>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.2025256, -7.7758411, 2.7489273> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.2025256, -7.7758411, 2.7489273>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.2025256, -7.7758411, 2.7489273>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.2025256, -7.7758411, 2.7489273>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.3952507, -8.1749281, 0.7264411> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.3952507, -8.1749281, 0.7264411>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.3952507, -8.1749281, 0.7264411>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.3952507, -8.1749281, 0.7264411>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.3952507, -8.1749281, 0.7264411>,
  <1.1624532, -8.5183216, 0.3886367>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.1624532, -8.5183206, 0.3886367>,
  <0.9296558, -8.8617132, 0.0508323>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.3952507, -8.1749281, 0.7264411>,
  <1.2756555, -7.6738804, 0.5819617>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2756555, -7.6738814, 0.5819617>,
  <1.1560603, -7.1728348, 0.4374822>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.3952507, -8.1749281, 0.7264411>,
  <1.2171551, -8.2647063, 1.2228764>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2171551, -8.2647063, 1.2228754>,
  <1.0390596, -8.3544846, 1.7193097>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.9296558, -8.8617132, 0.0508323> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.9296558, -8.8617132, 0.0508323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.9296558, -8.8617132, 0.0508323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.9296558, -8.8617132, 0.0508323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.1560603, -7.1728348, 0.4374822> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.1560603, -7.1728348, 0.4374822>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.1560603, -7.1728348, 0.4374822>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.1560603, -7.1728348, 0.4374822>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.0390596, -8.3544846, 1.7193097> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.0390596, -8.3544846, 1.7193097>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.0390596, -8.3544846, 1.7193097>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.0390596, -8.3544846, 1.7193097>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.8450018, 9.0412463, 1.4153919> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.8450018, 9.0412463, 1.4153919>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.8450018, 9.0412463, 1.4153919>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.8450018, 9.0412463, 1.4153919>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.8450018, 9.0412463, 1.4153919>,
  <-1.6784495, 8.3643575, 1.3889094>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6784495, 8.3643585, 1.3889094>,
  <-1.5118973, 7.6874707, 1.3624269>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8450018, 9.0412463, 1.4153919>,
  <-1.4174645, 9.5166909, 1.1369097>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4174645, 9.5166899, 1.1369097>,
  <-0.9899272, 9.9921334, 0.8584275>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8450018, 9.0412463, 1.4153919>,
  <-2.5008460, 9.2634334, 1.7521452>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5008450, 9.2634334, 1.7521452>,
  <-3.1566882, 9.4856206, 2.0888985>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.5118973, 7.6874707, 1.3624269> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.5118973, 7.6874707, 1.3624269>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.5118973, 7.6874707, 1.3624269>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.5118973, 7.6874707, 1.3624269>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.5118973, 7.6874707, 1.3624269>,
  <-0.9180936, 7.4860895, 1.0572232>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9180946, 7.4860895, 1.0572232>,
  <-0.3242919, 7.2847082, 0.7520195>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5118973, 7.6874707, 1.3624269>,
  <-1.8492513, 7.3127305, 1.5816832>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8492513, 7.3127315, 1.5816832>,
  <-2.1866052, 6.9379923, 1.8009395>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.3242919, 7.2847082, 0.7520195> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.3242919, 7.2847082, 0.7520195>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.3242919, 7.2847082, 0.7520195>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.3242919, 7.2847082, 0.7520195>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.3242919, 7.2847082, 0.7520195>,
  <0.1035613, 7.7603669, 0.4736399>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.1035613, 7.7603659, 0.4736399>,
  <0.5314144, 8.2360235, 0.1952603>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3242919, 7.2847082, 0.7520195>,
  <-0.1931318, 6.7511597, 0.7308492>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1931318, 6.7511607, 0.7308492>,
  <-0.0619718, 6.2176132, 0.7096789>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.5314144, 8.2360235, 0.1952603> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.5314144, 8.2360235, 0.1952603>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.5314144, 8.2360235, 0.1952603>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.5314144, 8.2360235, 0.1952603>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.5314144, 8.2360235, 0.1952603>,
  <0.3649841, 8.9127606, 0.2219645>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3649841, 8.9127596, 0.2219645>,
  <0.1985537, 9.5894957, 0.2486686>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5314144, 8.2360235, 0.1952603>,
  <0.9995949, 8.0771243, -0.0453299>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9995939, 8.0771243, -0.0453299>,
  <1.4677734, 7.9182251, -0.2859201>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.1985537, 9.5894957, 0.2486686> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.1985537, 9.5894957, 0.2486686>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.1985537, 9.5894957, 0.2486686>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.1985537, 9.5894957, 0.2486686>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.1985537, 9.5894957, 0.2486686>,
  <-0.3956878, 9.7908146, 0.5535481>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3956868, 9.7908146, 0.5535481>,
  <-0.9899272, 9.9921334, 0.8584275>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.1985537, 9.5894957, 0.2486686>,
  <0.5356502, 9.9644925, 0.0293222>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5356502, 9.9644915, 0.0293222>,
  <0.8727467, 10.3394872, -0.1900242>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.9899272, 9.9921334, 0.8584275> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.9899272, 9.9921334, 0.8584275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.9899272, 9.9921334, 0.8584275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.9899272, 9.9921334, 0.8584275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.9899272, 9.9921334, 0.8584275>,
  <-1.1210759, 10.5256561, 0.8793344>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1210759, 10.5256551, 0.8793344>,
  <-1.2522245, 11.0591767, 0.9002413>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.1866052, 6.9379923, 1.8009395> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.1866052, 6.9379923, 1.8009395>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.1866052, 6.9379923, 1.8009395>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.1866052, 6.9379923, 1.8009395>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.0619718, 6.2176132, 0.7096789> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.0619718, 6.2176132, 0.7096789>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.0619718, 6.2176132, 0.7096789>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.0619718, 6.2176132, 0.7096789>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.4677734, 7.9182251, -0.2859201> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.4677734, 7.9182251, -0.2859201>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.4677734, 7.9182251, -0.2859201>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.4677734, 7.9182251, -0.2859201>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.8727467, 10.3394872, -0.1900242> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.8727467, 10.3394872, -0.1900242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.8727467, 10.3394872, -0.1900242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.8727467, 10.3394872, -0.1900242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.2522245, 11.0591767, 0.9002413> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.2522245, 11.0591767, 0.9002413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.2522245, 11.0591767, 0.9002413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.2522245, 11.0591767, 0.9002413>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1566882, 9.4856206, 2.0888985> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.1566882, 9.4856206, 2.0888985>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.1566882, 9.4856206, 2.0888985>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.1566882, 9.4856206, 2.0888985>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.1566882, 9.4856206, 2.0888985>,
  <-3.2808081, 9.1432550, 2.4808241>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2808081, 9.1432560, 2.4808241>,
  <-3.4049280, 8.8008915, 2.8727496>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1566882, 9.4856206, 2.0888985>,
  <-3.5500811, 9.4919049, 1.7263681>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5500801, 9.4919049, 1.7263681>,
  <-3.9434720, 9.4981892, 1.3638376>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1566882, 9.4856206, 2.0888985>,
  <-3.0948585, 9.9760784, 2.2934808>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.0948585, 9.9760774, 2.2934808>,
  <-3.0330287, 10.4665343, 2.4980632>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.4049280, 8.8008915, 2.8727496> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.4049280, 8.8008915, 2.8727496>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.4049280, 8.8008915, 2.8727496>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.4049280, 8.8008915, 2.8727496>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.9434720, 9.4981892, 1.3638376> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.9434720, 9.4981892, 1.3638376>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.9434720, 9.4981892, 1.3638376>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.9434720, 9.4981892, 1.3638376>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.0330287, 10.4665343, 2.4980632> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.0330287, 10.4665343, 2.4980632>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.0330287, 10.4665343, 2.4980632>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.0330287, 10.4665343, 2.4980632>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.8264481, -6.8486912, -5.3476646> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.8264481, -6.8486912, -5.3476646>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.8264481, -6.8486912, -5.3476646>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.8264481, -6.8486912, -5.3476646>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.8264481, -6.8486912, -5.3476646>,
  <-1.3753985, -7.1923969, -4.9414147>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3753995, -7.1923969, -4.9414147>,
  <-0.9243510, -7.5361026, -4.5351648>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8264481, -6.8486912, -5.3476646>,
  <-1.6271675, -6.2656644, -5.6743986>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6271675, -6.2656654, -5.6743986>,
  <-1.4278869, -5.6826396, -6.0011327>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8264481, -6.8486912, -5.3476646>,
  <-2.5443371, -7.1130059, -5.4352707>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5443361, -7.1130059, -5.4352707>,
  <-3.2622241, -7.3773207, -5.5228769>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.9243510, -7.5361026, -4.5351648> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.9243510, -7.5361026, -4.5351648>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.9243510, -7.5361026, -4.5351648>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.9243510, -7.5361026, -4.5351648>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.9243510, -7.5361026, -4.5351648>,
  <-0.2740767, -7.2969854, -4.4559635>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2740777, -7.2969854, -4.4559635>,
  <0.3761955, -7.0578682, -4.3767623>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9243510, -7.5361026, -4.5351648>,
  <-1.0814994, -7.9959452, -4.2779478>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0814994, -7.9959442, -4.2779478>,
  <-1.2386478, -8.4557857, -4.0207308>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.3761955, -7.0578682, -4.3767623> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.3761955, -7.0578682, -4.3767623>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.3761955, -7.0578682, -4.3767623>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.3761955, -7.0578682, -4.3767623>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.3761955, -7.0578682, -4.3767623>,
  <0.5754995, -6.4744525, -4.7034270>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5754995, -6.4744535, -4.7034270>,
  <0.7748036, -5.8910389, -5.0300918>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3761955, -7.0578682, -4.3767623>,
  <0.7318398, -7.3289255, -4.0568090>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.7318388, -7.3289255, -4.0568090>,
  <1.0874820, -7.5999828, -3.7368558>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.7748036, -5.8910389, -5.0300918> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.7748036, -5.8910389, -5.0300918>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.7748036, -5.8910389, -5.0300918>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.7748036, -5.8910389, -5.0300918>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.7748036, -5.8910389, -5.0300918>,
  <0.3237639, -5.5473124, -5.4360483>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3237649, -5.5473124, -5.4360483>,
  <-0.1272738, -5.2035859, -5.8420047>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.7748036, -5.8910389, -5.0300918>,
  <1.2875390, -5.7025834, -4.9675457>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2875380, -5.7025834, -4.9675457>,
  <1.8002724, -5.5141280, -4.9049997>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.1272738, -5.2035859, -5.8420047> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.1272738, -5.2035859, -5.8420047>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.1272738, -5.2035859, -5.8420047>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.1272738, -5.2035859, -5.8420047>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.1272738, -5.2035859, -5.8420047>,
  <-0.7775813, -5.4431128, -5.9215687>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.7775803, -5.4431128, -5.9215687>,
  <-1.4278869, -5.6826396, -6.0011327>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1272738, -5.2035859, -5.8420047>,
  <0.0296484, -4.7437689, -6.0995186>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0296484, -4.7437699, -6.0995186>,
  <0.1865706, -4.2839538, -6.3570324>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.4278869, -5.6826396, -6.0011327> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.4278869, -5.6826396, -6.0011327>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.4278869, -5.6826396, -6.0011327>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.4278869, -5.6826396, -6.0011327>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.4278869, -5.6826396, -6.0011327>,
  <-1.7833471, -5.4116348, -6.3212696>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.7833461, -5.4116348, -6.3212696>,
  <-2.1388052, -5.1406300, -6.6414066>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.2386478, -8.4557857, -4.0207308> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.2386478, -8.4557857, -4.0207308>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.2386478, -8.4557857, -4.0207308>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.2386478, -8.4557857, -4.0207308>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.0874820, -7.5999828, -3.7368558> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.0874820, -7.5999828, -3.7368558>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.0874820, -7.5999828, -3.7368558>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.0874820, -7.5999828, -3.7368558>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.8002724, -5.5141280, -4.9049997> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.8002724, -5.5141280, -4.9049997>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.8002724, -5.5141280, -4.9049997>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.8002724, -5.5141280, -4.9049997>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.1865706, -4.2839538, -6.3570324> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.1865706, -4.2839538, -6.3570324>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.1865706, -4.2839538, -6.3570324>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.1865706, -4.2839538, -6.3570324>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.1388052, -5.1406300, -6.6414066> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.1388052, -5.1406300, -6.6414066>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.1388052, -5.1406300, -6.6414066>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.1388052, -5.1406300, -6.6414066>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.2622241, -7.3773207, -5.5228769> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.2622241, -7.3773207, -5.5228769>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.2622241, -7.3773207, -5.5228769>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.2622241, -7.3773207, -5.5228769>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.2622241, -7.3773207, -5.5228769>,
  <-3.4132069, -7.6340678, -5.0784554>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4132069, -7.6340668, -5.0784554>,
  <-3.5641896, -7.8908129, -4.6340338>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2622241, -7.3773207, -5.5228769>,
  <-3.2787142, -7.7144815, -5.9379390>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2787142, -7.7144805, -5.9379390>,
  <-3.2952042, -8.0516404, -6.3530011>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2622241, -7.3773207, -5.5228769>,
  <-3.5935426, -6.9670619, -5.6131056>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5935426, -6.9670629, -5.6131056>,
  <-3.9248611, -6.5568052, -5.7033343>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.5641896, -7.8908129, -4.6340338> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.5641896, -7.8908129, -4.6340338>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.5641896, -7.8908129, -4.6340338>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.5641896, -7.8908129, -4.6340338>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.2952042, -8.0516404, -6.3530011> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.2952042, -8.0516404, -6.3530011>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.2952042, -8.0516404, -6.3530011>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.2952042, -8.0516404, -6.3530011>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.9248611, -6.5568052, -5.7033343> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.9248611, -6.5568052, -5.7033343>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.9248611, -6.5568052, -5.7033343>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.9248611, -6.5568052, -5.7033343>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.0838405, 9.5297397, -2.8631977> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.0838405, 9.5297397, -2.8631977>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.0838405, 9.5297397, -2.8631977>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.0838405, 9.5297397, -2.8631977>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.0838405, 9.5297397, -2.8631977>,
  <2.3059910, 9.7442208, -3.4887103>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3059910, 9.7442208, -3.4887093>,
  <2.5281415, 9.9587018, -4.1142209>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0838405, 9.5297397, -2.8631977>,
  <1.4030057, 9.4286624, -2.7507889>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4030067, 9.4286624, -2.7507889>,
  <0.7221728, 9.3275851, -2.6383801>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0838405, 9.5297397, -2.8631977>,
  <2.5903387, 9.4046627, -2.2968790>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5903387, 9.4046627, -2.2968800>,
  <3.0968369, 9.2795858, -1.7305623>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.5281415, 9.9587018, -4.1142209> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.5281415, 9.9587018, -4.1142209>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.5281415, 9.9587018, -4.1142209>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.5281415, 9.9587018, -4.1142209>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.5281415, 9.9587018, -4.1142209>,
  <2.0695584, 10.0717431, -4.6272796>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0695584, 10.0717431, -4.6272786>,
  <1.6109753, 10.1847844, -5.1403363>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5281415, 9.9587018, -4.1142209>,
  <3.0649674, 10.0379733, -4.2027955>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0649664, 10.0379733, -4.2027955>,
  <3.6017913, 10.1172447, -4.2913702>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.6109753, 10.1847844, -5.1403363> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.6109753, 10.1847844, -5.1403363>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.6109753, 10.1847844, -5.1403363>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.6109753, 10.1847844, -5.1403363>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.6109753, 10.1847844, -5.1403363>,
  <0.9298216, 10.0839141, -5.0278183>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9298226, 10.0839141, -5.0278183>,
  <0.2486699, 9.9830437, -4.9153004>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.6109753, 10.1847844, -5.1403363>,
  <1.7860688, 10.3535393, -5.6334783>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7860688, 10.3535393, -5.6334773>,
  <1.9611623, 10.5222941, -6.1266184>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.2486699, 9.9830437, -4.9153004> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.2486699, 9.9830437, -4.9153004>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.2486699, 9.9830437, -4.9153004>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.2486699, 9.9830437, -4.9153004>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.2486699, 9.9830437, -4.9153004>,
  <0.0265868, 9.7688414, -4.2898548>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0265868, 9.7688414, -4.2898558>,
  <-0.1954962, 9.5546391, -3.6644112>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.2486699, 9.9830437, -4.9153004>,
  <-0.1128158, 10.0722336, -5.3198964>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1128158, 10.0722336, -5.3198954>,
  <-0.4743015, 10.1614235, -5.7244904>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.1954962, 9.5546391, -3.6644112> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.1954962, 9.5546391, -3.6644112>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.1954962, 9.5546391, -3.6644112>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.1954962, 9.5546391, -3.6644112>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.1954962, 9.5546391, -3.6644112>,
  <0.2633383, 9.4411121, -3.1513947>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.2633383, 9.4411121, -3.1513957>,
  <0.7221728, 9.3275851, -2.6383801>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1954962, 9.5546391, -3.6644112>,
  <-0.7322935, 9.4751003, -3.5755758>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.7322925, 9.4751003, -3.5755758>,
  <-1.2690888, 9.3955615, -3.4867404>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.7221728, 9.3275851, -2.6383801> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.7221728, 9.3275851, -2.6383801>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.7221728, 9.3275851, -2.6383801>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.7221728, 9.3275851, -2.6383801>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.7221728, 9.3275851, -2.6383801>,
  <0.5469883, 9.1586270, -2.1453823>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5469883, 9.1586270, -2.1453833>,
  <0.3718039, 8.9896688, -1.6523865>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.6017913, 10.1172447, -4.2913702> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.6017913, 10.1172447, -4.2913702>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.6017913, 10.1172447, -4.2913702>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.6017913, 10.1172447, -4.2913702>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.9611623, 10.5222941, -6.1266184> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.9611623, 10.5222941, -6.1266184>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.9611623, 10.5222941, -6.1266184>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.9611623, 10.5222941, -6.1266184>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.4743015, 10.1614235, -5.7244904> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.4743015, 10.1614235, -5.7244904>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.4743015, 10.1614235, -5.7244904>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.4743015, 10.1614235, -5.7244904>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.2690888, 9.3955615, -3.4867404> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.2690888, 9.3955615, -3.4867404>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.2690888, 9.3955615, -3.4867404>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.2690888, 9.3955615, -3.4867404>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.3718039, 8.9896688, -1.6523865> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.3718039, 8.9896688, -1.6523865>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.3718039, 8.9896688, -1.6523865>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.3718039, 8.9896688, -1.6523865>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.0968369, 9.2795858, -1.7305623> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.0968369, 9.2795858, -1.7305623>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.0968369, 9.2795858, -1.7305623>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.0968369, 9.2795858, -1.7305623>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.0968369, 9.2795858, -1.7305623>,
  <3.5156848, 9.6070220, -1.7903771>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.5156838, 9.6070220, -1.7903771>,
  <3.9345308, 9.9344582, -1.8501919>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0968369, 9.2795858, -1.7305623>,
  <3.2635151, 8.7715595, -1.7493645>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2635151, 8.7715605, -1.7493645>,
  <3.4301934, 8.2635353, -1.7681667>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0968369, 9.2795858, -1.7305623>,
  <2.8632289, 9.3732713, -1.2584648>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8632289, 9.3732713, -1.2584658>,
  <2.6296209, 9.4669568, -0.7863693>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.9345308, 9.9344582, -1.8501919> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.9345308, 9.9344582, -1.8501919>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.9345308, 9.9344582, -1.8501919>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.9345308, 9.9344582, -1.8501919>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.4301934, 8.2635353, -1.7681667> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.4301934, 8.2635353, -1.7681667>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.4301934, 8.2635353, -1.7681667>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.4301934, 8.2635353, -1.7681667>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.6296209, 9.4669568, -0.7863693> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.6296209, 9.4669568, -0.7863693>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.6296209, 9.4669568, -0.7863693>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.6296209, 9.4669568, -0.7863693>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.4055799, 7.4027422, 5.1348450> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-6.4055799, 7.4027422, 5.1348450>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-6.4055799, 7.4027422, 5.1348450>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-6.4055799, 7.4027422, 5.1348450>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-6.4055799, 7.4027422, 5.1348450>,
  <-6.0033255, 7.9724030, 5.1176044>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.0033255, 7.9724020, 5.1176044>,
  <-5.6010711, 8.5420619, 5.1003638>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.4055799, 7.4027422, 5.1348450>,
  <-6.3869354, 6.9793473, 5.6887193>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.3869354, 6.9793483, 5.6887193>,
  <-6.3682909, 6.5559544, 6.2425937>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.4055799, 7.4027422, 5.1348450>,
  <-6.8701084, 7.2414135, 4.5423189>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.8701084, 7.2414135, 4.5423199>,
  <-7.3346369, 7.0800849, 3.9497949>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.6010711, 8.5420619, 5.1003638> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.6010711, 8.5420619, 5.1003638>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.6010711, 8.5420619, 5.1003638>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.6010711, 8.5420619, 5.1003638>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.6010711, 8.5420619, 5.1003638>,
  <-5.1805317, 8.6884353, 5.6370460>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1805317, 8.6884353, 5.6370450>,
  <-4.7599923, 8.8348087, 6.1737262>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6010711, 8.5420619, 5.1003638>,
  <-5.6161695, 8.8759633, 4.6637940>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6161695, 8.8759623, 4.6637940>,
  <-5.6312679, 9.2098627, 4.2272242>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.7599923, 8.8348087, 6.1737262> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.7599923, 8.8348087, 6.1737262>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.7599923, 8.8348087, 6.1737262>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.7599923, 8.8348087, 6.1737262>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.7599923, 8.8348087, 6.1737262>,
  <-4.7411406, 8.4111048, 6.7277339>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7411406, 8.4111058, 6.7277339>,
  <-4.7222889, 7.9874029, 7.2817415>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7599923, 8.8348087, 6.1737262>,
  <-4.4431486, 9.2839803, 6.1603092>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4431486, 9.2839793, 6.1603092>,
  <-4.1263050, 9.7331499, 6.1468922>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.7222889, 7.9874029, 7.2817415> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.7222889, 7.9874029, 7.2817415>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.7222889, 7.9874029, 7.2817415>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.7222889, 7.9874029, 7.2817415>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.7222889, 7.9874029, 7.2817415>,
  <-5.1242854, 7.4177610, 7.2988401>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1242854, 7.4177620, 7.2988401>,
  <-5.5262820, 6.8481211, 7.3159387>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7222889, 7.9874029, 7.2817415>,
  <-4.3906473, 8.1029003, 7.7048247>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.3906473, 8.1029003, 7.7048237>,
  <-4.0590057, 8.2183977, 8.1279059>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.5262820, 6.8481211, 7.3159387> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.5262820, 6.8481211, 7.3159387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.5262820, 6.8481211, 7.3159387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.5262820, 6.8481211, 7.3159387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.5262820, 6.8481211, 7.3159387>,
  <-5.9472864, 6.7020377, 6.7792652>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9472864, 6.7020377, 6.7792662>,
  <-6.3682909, 6.5559544, 6.2425937>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5262820, 6.8481211, 7.3159387>,
  <-5.5115351, 6.5140914, 7.7524889>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5115351, 6.5140924, 7.7524889>,
  <-5.4967882, 6.1800637, 8.1890392>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.3682909, 6.5559544, 6.2425937> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-6.3682909, 6.5559544, 6.2425937>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-6.3682909, 6.5559544, 6.2425937>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-6.3682909, 6.5559544, 6.2425937>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-6.3682909, 6.5559544, 6.2425937>,
  <-6.6852315, 6.1069040, 6.2562262>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.6852315, 6.1069050, 6.2562262>,
  <-7.0021722, 5.6578556, 6.2698587>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.6312679, 9.2098627, 4.2272242> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.6312679, 9.2098627, 4.2272242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.6312679, 9.2098627, 4.2272242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.6312679, 9.2098627, 4.2272242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1263050, 9.7331499, 6.1468922> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.1263050, 9.7331499, 6.1468922>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.1263050, 9.7331499, 6.1468922>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.1263050, 9.7331499, 6.1468922>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.0590057, 8.2183977, 8.1279059> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.0590057, 8.2183977, 8.1279059>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.0590057, 8.2183977, 8.1279059>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.0590057, 8.2183977, 8.1279059>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.4967882, 6.1800637, 8.1890392> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.4967882, 6.1800637, 8.1890392>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.4967882, 6.1800637, 8.1890392>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.4967882, 6.1800637, 8.1890392>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.0021722, 5.6578556, 6.2698587> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.0021722, 5.6578556, 6.2698587>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.0021722, 5.6578556, 6.2698587>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.0021722, 5.6578556, 6.2698587>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.3346369, 7.0800849, 3.9497949> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-7.3346369, 7.0800849, 3.9497949>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-7.3346369, 7.0800849, 3.9497949>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-7.3346369, 7.0800849, 3.9497949>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.3346369, 7.0800849, 3.9497949>,
  <-7.1174162, 7.2653040, 3.4973186>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.1174162, 7.2653040, 3.4973196>,
  <-6.9001956, 7.4505232, 3.0448442>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.3346369, 7.0800849, 3.9497949>,
  <-7.8101610, 7.3125889, 4.0275436>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.8101600, 7.3125889, 4.0275436>,
  <-8.2856830, 7.5450929, 4.1052922>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.3346369, 7.0800849, 3.9497949>,
  <-7.3990923, 6.5502684, 3.9128325>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.3990923, 6.5502694, 3.9128325>,
  <-7.4635477, 6.0204540, 3.8758701>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.9001956, 7.4505232, 3.0448442> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.9001956, 7.4505232, 3.0448442>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.9001956, 7.4505232, 3.0448442>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.9001956, 7.4505232, 3.0448442>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.2856830, 7.5450929, 4.1052922> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.2856830, 7.5450929, 4.1052922>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.2856830, 7.5450929, 4.1052922>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.2856830, 7.5450929, 4.1052922>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.4635477, 6.0204540, 3.8758701> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.4635477, 6.0204540, 3.8758701>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.4635477, 6.0204540, 3.8758701>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.4635477, 6.0204540, 3.8758701>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.7895167, 1.7924278, -2.0964484> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.7895167, 1.7924278, -2.0964484>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.7895167, 1.7924278, -2.0964484>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.7895167, 1.7924278, -2.0964484>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.7895167, 1.7924278, -2.0964484>,
  <7.8753321, 1.7322677, -2.7861117>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.8753321, 1.7322677, -2.7861107>,
  <7.9611474, 1.6721076, -3.4757731>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.7895167, 1.7924278, -2.0964484>,
  <7.1865437, 1.6021166, -1.8021813>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.1865447, 1.6021166, -1.8021813>,
  <6.5835726, 1.4118054, -1.5079142>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.7895167, 1.7924278, -2.0964484>,
  <8.3605141, 2.0690080, -1.6601381>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.3605131, 2.0690080, -1.6601381>,
  <8.9315094, 2.3455882, -1.2238278>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.9611474, 1.6721076, -3.4757731> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.9611474, 1.6721076, -3.4757731>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.9611474, 1.6721076, -3.4757731>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.9611474, 1.6721076, -3.4757731>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.9611474, 1.6721076, -3.4757731>,
  <7.4441997, 1.4213714, -3.8709979>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.4442007, 1.4213714, -3.8709979>,
  <6.9272540, 1.1706351, -4.2662227>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.9611474, 1.6721076, -3.4757731>,
  <8.4367175, 1.8218288, -3.7075666>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.4367165, 1.8218288, -3.7075666>,
  <8.9122855, 1.9715499, -3.9393602>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.9272540, 1.1706351, -4.2662227> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.9272540, 1.1706351, -4.2662227>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.9272540, 1.1706351, -4.2662227>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.9272540, 1.1706351, -4.2662227>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.9272540, 1.1706351, -4.2662227>,
  <6.3239254, 0.9804774, -3.9718758>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.3239264, 0.9804774, -3.9718758>,
  <5.7205988, 0.7903196, -3.6775289>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9272540, 1.1706351, -4.2662227>,
  <6.9949694, 1.1229076, -4.8097870>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9949694, 1.1229076, -4.8097860>,
  <7.0626848, 1.0751802, -5.3533493>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.7205988, 0.7903196, -3.6775289> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.7205988, 0.7903196, -3.6775289>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.7205988, 0.7903196, -3.6775289>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.7205988, 0.7903196, -3.6775289>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.7205988, 0.7903196, -3.6775289>,
  <5.6347553, 0.8507014, -2.9880576>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.6347553, 0.8507014, -2.9880586>,
  <5.5489118, 0.9110833, -2.2985884>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.7205988, 0.7903196, -3.6775289>,
  <5.3130649, 0.5926640, -3.9892552>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3130659, 0.5926640, -3.9892552>,
  <4.9055329, 0.3950083, -4.3009815>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.5489118, 0.9110833, -2.2985884> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.5489118, 0.9110833, -2.2985884>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.5489118, 0.9110833, -2.2985884>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.5489118, 0.9110833, -2.2985884>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.5489118, 0.9110833, -2.2985884>,
  <6.0662432, 1.1614443, -1.9032513>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.0662422, 1.1614443, -1.9032513>,
  <6.5835726, 1.4118054, -1.5079142>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.5489118, 0.9110833, -2.2985884>,
  <5.0734757, 0.7612635, -2.0664596>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0734767, 0.7612635, -2.0664596>,
  <4.5980416, 0.6114437, -1.8343308>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.5835726, 1.4118054, -1.5079142> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.5835726, 1.4118054, -1.5079142>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.5835726, 1.4118054, -1.5079142>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.5835726, 1.4118054, -1.5079142>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.5835726, 1.4118054, -1.5079142>,
  <6.5158201, 1.4592707, -0.9643705>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5158201, 1.4592707, -0.9643715>,
  <6.4480676, 1.5067360, -0.4208288>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.9122855, 1.9715499, -3.9393602> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.9122855, 1.9715499, -3.9393602>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.9122855, 1.9715499, -3.9393602>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.9122855, 1.9715499, -3.9393602>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.0626848, 1.0751802, -5.3533493> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.0626848, 1.0751802, -5.3533493>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.0626848, 1.0751802, -5.3533493>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.0626848, 1.0751802, -5.3533493>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.9055329, 0.3950083, -4.3009815> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9055329, 0.3950083, -4.3009815>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9055329, 0.3950083, -4.3009815>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9055329, 0.3950083, -4.3009815>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.5980416, 0.6114437, -1.8343308> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.5980416, 0.6114437, -1.8343308>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.5980416, 0.6114437, -1.8343308>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.5980416, 0.6114437, -1.8343308>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.4480676, 1.5067360, -0.4208288> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.4480676, 1.5067360, -0.4208288>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.4480676, 1.5067360, -0.4208288>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.4480676, 1.5067360, -0.4208288>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.9315094, 2.3455882, -1.2238278> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.9315094, 2.3455882, -1.2238278>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.9315094, 2.3455882, -1.2238278>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.9315094, 2.3455882, -1.2238278>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.9315094, 2.3455882, -1.2238278>,
  <9.2216361, 2.6930223, -1.5090328>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.2216361, 2.6930213, -1.5090328>,
  <9.5117628, 3.0404544, -1.7942379>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9315094, 2.3455882, -1.2238278>,
  <9.2440234, 1.9424244, -1.0625225>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.2440234, 1.9424254, -1.0625225>,
  <9.5565375, 1.5392626, -0.9012172>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9315094, 2.3455882, -1.2238278>,
  <8.7255996, 2.5934890, -0.7967780>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.7255996, 2.5934880, -0.7967780>,
  <8.5196898, 2.8413877, -0.3697282>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<9.5117628, 3.0404544, -1.7942379> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.5117628, 3.0404544, -1.7942379>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.5117628, 3.0404544, -1.7942379>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.5117628, 3.0404544, -1.7942379>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.5565375, 1.5392626, -0.9012172> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.5565375, 1.5392626, -0.9012172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.5565375, 1.5392626, -0.9012172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.5565375, 1.5392626, -0.9012172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.5196898, 2.8413877, -0.3697282> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.5196898, 2.8413877, -0.3697282>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.5196898, 2.8413877, -0.3697282>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.5196898, 2.8413877, -0.3697282>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.3339222, -10.8577693, 1.0056975> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.3339222, -10.8577693, 1.0056975>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.3339222, -10.8577693, 1.0056975>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.3339222, -10.8577693, 1.0056975>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.3339222, -10.8577693, 1.0056975>,
  <1.7165771, -11.0138970, 0.7208677>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7165781, -11.0138970, 0.7208677>,
  <1.0992339, -11.1700248, 0.4360380>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3339222, -10.8577693, 1.0056975>,
  <2.9021394, -10.8133497, 0.6037717>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9021384, -10.8133497, 0.6037717>,
  <3.4703546, -10.7689301, 0.2018458>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3339222, -10.8577693, 1.0056975>,
  <2.3879654, -10.7345459, 1.7638500>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3879654, -10.7345469, 1.7638500>,
  <2.4420085, -10.6113244, 2.5220026>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.0992339, -11.1700248, 0.4360380> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.0992339, -11.1700248, 0.4360380>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.0992339, -11.1700248, 0.4360380>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.0992339, -11.1700248, 0.4360380>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.0992339, -11.1700248, 0.4360380>,
  <1.0501022, -11.2813684, -0.2506163>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0501022, -11.2813674, -0.2506163>,
  <1.0009706, -11.3927100, -0.9372705>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0992339, -11.1700248, 0.4360380>,
  <0.6512871, -11.2046284, 0.7529883>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6512881, -11.2046284, 0.7529883>,
  <0.2033422, -11.2392320, 1.0699387>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.0009706, -11.3927100, -0.9372705> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.0009706, -11.3927100, -0.9372705>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.0009706, -11.3927100, -0.9372705>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.0009706, -11.3927100, -0.9372705>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.0009706, -11.3927100, -0.9372705>,
  <1.5694689, -11.3485263, -1.3393436>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.5694679, -11.3485263, -1.3393436>,
  <2.1379653, -11.3043426, -1.7414166>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0009706, -11.3927100, -0.9372705>,
  <0.5143323, -11.5154652, -1.1618579>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5143333, -11.5154652, -1.1618579>,
  <0.0276960, -11.6382204, -1.3864453>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.1379653, -11.3043426, -1.7414166> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.1379653, -11.3043426, -1.7414166>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.1379653, -11.3043426, -1.7414166>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.1379653, -11.3043426, -1.7414166>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.1379653, -11.3043426, -1.7414166>,
  <2.7551883, -11.1484837, -1.4565855>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.7551873, -11.1484837, -1.4565855>,
  <3.3724093, -10.9926248, -1.1717544>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.1379653, -11.3043426, -1.7414166>,
  <2.0991091, -11.3921830, -2.2828022>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0991091, -11.3921820, -2.2828022>,
  <2.0602530, -11.4800213, -2.8241878>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.3724093, -10.9926248, -1.1717544> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.3724093, -10.9926248, -1.1717544>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.3724093, -10.9926248, -1.1717544>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.3724093, -10.9926248, -1.1717544>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.3724093, -10.9926248, -1.1717544>,
  <3.4213819, -10.8807765, -0.4849543>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4213819, -10.8807775, -0.4849543>,
  <3.4703546, -10.7689301, 0.2018458>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3724093, -10.9926248, -1.1717544>,
  <3.8205462, -10.9577697, -1.4885009>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8205452, -10.9577697, -1.4885009>,
  <4.2686812, -10.9229146, -1.8052473>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.4703546, -10.7689301, 0.2018458> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.4703546, -10.7689301, 0.2018458>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.4703546, -10.7689301, 0.2018458>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.4703546, -10.7689301, 0.2018458>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.4703546, -10.7689301, 0.2018458>,
  <3.9569750, -10.6459703, 0.4262663>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9569740, -10.6459703, 0.4262663>,
  <4.4435935, -10.5230105, 0.6506868>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.2033422, -11.2392320, 1.0699387> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.2033422, -11.2392320, 1.0699387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.2033422, -11.2392320, 1.0699387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.2033422, -11.2392320, 1.0699387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.0276960, -11.6382204, -1.3864453> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.0276960, -11.6382204, -1.3864453>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.0276960, -11.6382204, -1.3864453>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.0276960, -11.6382204, -1.3864453>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.0602530, -11.4800213, -2.8241878> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.0602530, -11.4800213, -2.8241878>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.0602530, -11.4800213, -2.8241878>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.0602530, -11.4800213, -2.8241878>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.2686812, -10.9229146, -1.8052473> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.2686812, -10.9229146, -1.8052473>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.2686812, -10.9229146, -1.8052473>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.2686812, -10.9229146, -1.8052473>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.4435935, -10.5230105, 0.6506868> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.4435935, -10.5230105, 0.6506868>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.4435935, -10.5230105, 0.6506868>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.4435935, -10.5230105, 0.6506868>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.4420085, -10.6113244, 2.5220026> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.4420085, -10.6113244, 2.5220026>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.4420085, -10.6113244, 2.5220026>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.4420085, -10.6113244, 2.5220026>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.4420085, -10.6113244, 2.5220026>,
  <2.0731640, -10.9032594, 2.7768628>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.0731650, -10.9032594, 2.7768628>,
  <1.7043215, -11.1951944, 3.0317230>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4420085, -10.6113244, 2.5220026>,
  <2.3609514, -10.0925444, 2.6245835>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3609514, -10.0925454, 2.6245835>,
  <2.2798943, -9.5737664, 2.7271644>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4420085, -10.6113244, 2.5220026>,
  <2.9294595, -10.7525534, 2.6913304>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9294585, -10.7525534, 2.6913304>,
  <3.4169085, -10.8937823, 2.8606583>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.7043215, -11.1951944, 3.0317230> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.7043215, -11.1951944, 3.0317230>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.7043215, -11.1951944, 3.0317230>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.7043215, -11.1951944, 3.0317230>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2798943, -9.5737664, 2.7271644> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.2798943, -9.5737664, 2.7271644>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.2798943, -9.5737664, 2.7271644>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.2798943, -9.5737664, 2.7271644>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.4169085, -10.8937823, 2.8606583> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.4169085, -10.8937823, 2.8606583>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.4169085, -10.8937823, 2.8606583>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.4169085, -10.8937823, 2.8606583>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.6172793, -4.6586592, 7.9282709> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.6172793, -4.6586592, 7.9282709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.6172793, -4.6586592, 7.9282709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.6172793, -4.6586592, 7.9282709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.6172793, -4.6586592, 7.9282709>,
  <-4.4363408, -4.2347554, 7.4046440>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4363408, -4.2347564, 7.4046440>,
  <-4.2554024, -3.8108536, 6.8810172>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6172793, -4.6586592, 7.9282709>,
  <-4.1794689, -5.1589213, 8.1390978>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1794689, -5.1589203, 8.1390978>,
  <-3.7416585, -5.6591813, 8.3499246>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6172793, -4.6586592, 7.9282709>,
  <-5.3003997, -4.5742479, 8.2734129>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3003987, -4.5742479, 8.2734129>,
  <-5.9835180, -4.4898365, 8.6185548>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.2554024, -3.8108536, 6.8810172> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.2554024, -3.8108536, 6.8810172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.2554024, -3.8108536, 6.8810172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.2554024, -3.8108536, 6.8810172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.2554024, -3.8108536, 6.8810172>,
  <-3.6366418, -3.8870139, 6.5685402>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6366428, -3.8870139, 6.5685402>,
  <-3.0178833, -3.9631742, 6.2560633>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.2554024, -3.8108536, 6.8810172>,
  <-4.6005161, -3.4162592, 6.7151779>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6005161, -3.4162602, 6.7151779>,
  <-4.9456298, -3.0216669, 6.5493387>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.0178833, -3.9631742, 6.2560633> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.0178833, -3.9631742, 6.2560633>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.0178833, -3.9631742, 6.2560633>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.0178833, -3.9631742, 6.2560633>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.0178833, -3.9631742, 6.2560633>,
  <-2.5799806, -4.4638101, 6.4668002>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5799806, -4.4638091, 6.4668002>,
  <-2.1420780, -4.9644440, 6.6775372>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.0178833, -3.9631742, 6.2560633>,
  <-2.8751008, -3.6288659, 5.8435394>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.8751008, -3.6288669, 5.8435394>,
  <-2.7323184, -3.2945597, 5.4310156>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.1420780, -4.9644440, 6.6775372> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.1420780, -4.9644440, 6.6775372>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.1420780, -4.9644440, 6.6775372>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.1420780, -4.9644440, 6.6775372>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.1420780, -4.9644440, 6.6775372>,
  <-2.3231051, -5.3883799, 7.2008845>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3231051, -5.3883789, 7.2008845>,
  <-2.5041322, -5.8123137, 7.7242318>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1420780, -4.9644440, 6.6775372>,
  <-1.6542465, -5.0244171, 6.4310649>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6542475, -5.0244171, 6.4310649>,
  <-1.1664170, -5.0843901, 6.1845925>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.5041322, -5.8123137, 7.7242318> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.5041322, -5.8123137, 7.7242318>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.5041322, -5.8123137, 7.7242318>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.5041322, -5.8123137, 7.7242318>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.5041322, -5.8123137, 7.7242318>,
  <-3.1228963, -5.7357475, 8.0370782>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1228953, -5.7357475, 8.0370782>,
  <-3.7416585, -5.6591813, 8.3499246>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5041322, -5.8123137, 7.7242318>,
  <-2.1591253, -6.2069243, 7.8904298>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1591253, -6.2069233, 7.8904298>,
  <-1.8141184, -6.6015329, 8.0566279>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.7416585, -5.6591813, 8.3499246> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.7416585, -5.6591813, 8.3499246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.7416585, -5.6591813, 8.3499246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.7416585, -5.6591813, 8.3499246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.7416585, -5.6591813, 8.3499246>,
  <-3.8842230, -5.9933852, 8.7625580>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.8842230, -5.9933842, 8.7625580>,
  <-4.0267876, -6.3275870, 9.1751913>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.9456298, -3.0216669, 6.5493387> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.9456298, -3.0216669, 6.5493387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.9456298, -3.0216669, 6.5493387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.9456298, -3.0216669, 6.5493387>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.7323184, -3.2945597, 5.4310156> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.7323184, -3.2945597, 5.4310156>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.7323184, -3.2945597, 5.4310156>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.7323184, -3.2945597, 5.4310156>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.1664170, -5.0843901, 6.1845925> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.1664170, -5.0843901, 6.1845925>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.1664170, -5.0843901, 6.1845925>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.1664170, -5.0843901, 6.1845925>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.8141184, -6.6015329, 8.0566279> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.8141184, -6.6015329, 8.0566279>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.8141184, -6.6015329, 8.0566279>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.8141184, -6.6015329, 8.0566279>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.0267876, -6.3275870, 9.1751913> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.0267876, -6.3275870, 9.1751913>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.0267876, -6.3275870, 9.1751913>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.0267876, -6.3275870, 9.1751913>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.9835180, -4.4898365, 8.6185548> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.9835180, -4.4898365, 8.6185548>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.9835180, -4.4898365, 8.6185548>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.9835180, -4.4898365, 8.6185548>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.9835180, -4.4898365, 8.6185548>,
  <-6.3387325, -4.2993309, 8.2667644>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.3387315, -4.2993309, 8.2667644>,
  <-6.6939450, -4.1088252, 7.9149740>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9835180, -4.4898365, 8.6185548>,
  <-5.9358790, -4.1475921, 9.0269965>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9358790, -4.1475931, 9.0269965>,
  <-5.8882400, -3.8053496, 9.4354382>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9835180, -4.4898365, 8.6185548>,
  <-6.1505783, -4.9639372, 8.8017088>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.1505783, -4.9639362, 8.8017088>,
  <-6.3176385, -5.4380359, 8.9848628>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.6939450, -4.1088252, 7.9149740> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.6939450, -4.1088252, 7.9149740>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.6939450, -4.1088252, 7.9149740>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.6939450, -4.1088252, 7.9149740>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.8882400, -3.8053496, 9.4354382> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.8882400, -3.8053496, 9.4354382>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.8882400, -3.8053496, 9.4354382>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.8882400, -3.8053496, 9.4354382>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.3176385, -5.4380359, 8.9848628> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.3176385, -5.4380359, 8.9848628>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.3176385, -5.4380359, 8.9848628>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.3176385, -5.4380359, 8.9848628>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.3310072, 1.9390686, -6.4389003> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.3310072, 1.9390686, -6.4389003>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.3310072, 1.9390686, -6.4389003>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.3310072, 1.9390686, -6.4389003>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.3310072, 1.9390686, -6.4389003>,
  <3.3279976, 2.0964447, -7.1184899>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3279976, 2.0964437, -7.1184899>,
  <3.3249880, 2.2538188, -7.7980796>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3310072, 1.9390686, -6.4389003>,
  <2.8645257, 1.4879695, -6.1833758>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8645267, 1.4879695, -6.1833758>,
  <2.3980463, 1.0368703, -5.9278513>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3310072, 1.9390686, -6.4389003>,
  <3.8493276, 2.2634667, -5.9709143>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8493266, 2.2634667, -5.9709143>,
  <4.3676460, 2.5878649, -5.5029283>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.3249880, 2.2538188, -7.7980796> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.3249880, 2.2538188, -7.7980796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.3249880, 2.2538188, -7.7980796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.3249880, 2.2538188, -7.7980796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.3249880, 2.2538188, -7.7980796>,
  <2.8558013, 1.9598802, -8.2220722>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8558023, 1.9598802, -8.2220722>,
  <2.3866165, 1.6659416, -8.6460648>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3249880, 2.2538188, -7.7980796>,
  <3.6930651, 2.6091823, -7.9994439>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6930641, 2.6091823, -7.9994439>,
  <4.0611401, 2.9645458, -8.2008082>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.3866165, 1.6659416, -8.6460648> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.3866165, 1.6659416, -8.6460648>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.3866165, 1.6659416, -8.6460648>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.3866165, 1.6659416, -8.6460648>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.3866165, 1.6659416, -8.6460648>,
  <1.9197658, 1.2148421, -8.3903992>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9197668, 1.2148421, -8.3903992>,
  <1.4529171, 0.7637427, -8.1347336>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3866165, 1.6659416, -8.6460648>,
  <2.3844138, 1.7897238, -9.1817861>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3844138, 1.7897228, -9.1817861>,
  <2.3822112, 1.9135039, -9.7175074>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.4529171, 0.7637427, -8.1347336> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.4529171, 0.7637427, -8.1347336>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.4529171, 0.7637427, -8.1347336>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.4529171, 0.7637427, -8.1347336>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.4529171, 0.7637427, -8.1347336>,
  <1.4558044, 0.6066094, -7.4552591>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4558044, 0.6066104, -7.4552591>,
  <1.4586917, 0.4494781, -6.7757846>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4529171, 0.7637427, -8.1347336>,
  <1.0830092, 0.5320677, -8.4691278>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0830102, 0.5320677, -8.4691278>,
  <0.7131032, 0.3003928, -8.8035219>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.4586917, 0.4494781, -6.7757846> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.4586917, 0.4494781, -6.7757846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.4586917, 0.4494781, -6.7757846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.4586917, 0.4494781, -6.7757846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.4586917, 0.4494781, -6.7757846>,
  <1.9283700, 0.7431742, -6.3518180>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9283690, 0.7431742, -6.3518180>,
  <2.3980463, 1.0368703, -5.9278513>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4586917, 0.4494781, -6.7757846>,
  <1.0908205, 0.0939805, -6.5741370>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0908215, 0.0939805, -6.5741370>,
  <0.7229513, -0.2615171, -6.3724894>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.3980463, 1.0368703, -5.9278513> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.3980463, 1.0368703, -5.9278513>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.3980463, 1.0368703, -5.9278513>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.3980463, 1.0368703, -5.9278513>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.3980463, 1.0368703, -5.9278513>,
  <2.4002901, 0.9128448, -5.3922254>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4002901, 0.9128458, -5.3922254>,
  <2.4025339, 0.7888214, -4.8565995>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.0611401, 2.9645458, -8.2008082> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.0611401, 2.9645458, -8.2008082>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.0611401, 2.9645458, -8.2008082>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.0611401, 2.9645458, -8.2008082>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.3822112, 1.9135039, -9.7175074> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.3822112, 1.9135039, -9.7175074>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.3822112, 1.9135039, -9.7175074>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.3822112, 1.9135039, -9.7175074>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.7131032, 0.3003928, -8.8035219> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.7131032, 0.3003928, -8.8035219>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.7131032, 0.3003928, -8.8035219>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.7131032, 0.3003928, -8.8035219>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.7229513, -0.2615171, -6.3724894> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.7229513, -0.2615171, -6.3724894>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.7229513, -0.2615171, -6.3724894>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.7229513, -0.2615171, -6.3724894>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.4025339, 0.7888214, -4.8565995> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.4025339, 0.7888214, -4.8565995>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.4025339, 0.7888214, -4.8565995>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.4025339, 0.7888214, -4.8565995>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.3676460, 2.5878649, -5.5029283> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.3676460, 2.5878649, -5.5029283>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.3676460, 2.5878649, -5.5029283>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.3676460, 2.5878649, -5.5029283>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.3676460, 2.5878649, -5.5029283>,
  <4.4933367, 3.0745680, -5.6860895>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4933367, 3.0745670, -5.6860895>,
  <4.6190274, 3.5612691, -5.8692506>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3676460, 2.5878649, -5.5029283>,
  <4.8078680, 2.2842784, -5.4866370>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.8078670, 2.2842784, -5.4866370>,
  <5.2480880, 1.9806919, -5.4703456>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3676460, 2.5878649, -5.5029283>,
  <4.1618647, 2.6301434, -5.0108994>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.1618647, 2.6301434, -5.0109004>,
  <3.9560835, 2.6724218, -4.5188724>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.6190274, 3.5612691, -5.8692506> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.6190274, 3.5612691, -5.8692506>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.6190274, 3.5612691, -5.8692506>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.6190274, 3.5612691, -5.8692506>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.2480880, 1.9806919, -5.4703456> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.2480880, 1.9806919, -5.4703456>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.2480880, 1.9806919, -5.4703456>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.2480880, 1.9806919, -5.4703456>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.9560835, 2.6724218, -4.5188724> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.9560835, 2.6724218, -4.5188724>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.9560835, 2.6724218, -4.5188724>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.9560835, 2.6724218, -4.5188724>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.9671203, 7.0542636, 0.4329446> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.9671203, 7.0542636, 0.4329446>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.9671203, 7.0542636, 0.4329446>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.9671203, 7.0542636, 0.4329446>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.9671203, 7.0542636, 0.4329446>,
  <-3.6515364, 7.5227562, 0.0236275>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6515364, 7.5227552, 0.0236275>,
  <-3.3359524, 7.9912468, -0.3856897>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9671203, 7.0542636, 0.4329446>,
  <-3.6709250, 6.4327515, 0.5442066>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6709250, 6.4327525, 0.5442066>,
  <-3.3747297, 5.8112414, 0.6554686>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9671203, 7.0542636, 0.4329446>,
  <-4.6425033, 7.2233482, 0.7618361>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6425023, 7.2233482, 0.7618361>,
  <-5.3178842, 7.3924328, 1.0907275>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.3359524, 7.9912468, -0.3856897> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.3359524, 7.9912468, -0.3856897>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.3359524, 7.9912468, -0.3856897>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.3359524, 7.9912468, -0.3856897>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.3359524, 7.9912468, -0.3856897>,
  <-2.7241476, 7.8383453, -0.6833856>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.7241486, 7.8383453, -0.6833856>,
  <-2.1123449, 7.6854439, -0.9810815>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.3359524, 7.9912468, -0.3856897>,
  <-3.5694100, 8.4813348, -0.4729980>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5694100, 8.4813338, -0.4729980>,
  <-3.8028676, 8.9714208, -0.5603063>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.1123449, 7.6854439, -0.9810815> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.1123449, 7.6854439, -0.9810815>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.1123449, 7.6854439, -0.9810815>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.1123449, 7.6854439, -0.9810815>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.1123449, 7.6854439, -0.9810815>,
  <-1.8161350, 7.0635737, -0.8699862>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8161350, 7.0635747, -0.8699862>,
  <-1.5199251, 6.4417054, -0.7588910>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1123449, 7.6854439, -0.9810815>,
  <-1.8634164, 8.0548071, -1.3034637>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8634164, 8.0548061, -1.3034637>,
  <-1.6144879, 8.4241683, -1.6258460>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.5199251, 6.4417054, -0.7588910> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.5199251, 6.4417054, -0.7588910>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.5199251, 6.4417054, -0.7588910>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.5199251, 6.4417054, -0.7588910>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.5199251, 6.4417054, -0.7588910>,
  <-1.8355774, 5.9732610, -0.3498567>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8355774, 5.9732620, -0.3498567>,
  <-2.1512296, 5.5048187, 0.0591776>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5199251, 6.4417054, -0.7588910>,
  <-1.0375512, 6.3212495, -0.9936908>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0375522, 6.3212495, -0.9936908>,
  <-0.5551793, 6.2007936, -1.2284905>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.1512296, 5.5048187, 0.0591776> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.1512296, 5.5048187, 0.0591776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.1512296, 5.5048187, 0.0591776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.1512296, 5.5048187, 0.0591776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.1512296, 5.5048187, 0.0591776>,
  <-2.7629807, 5.6580300, 0.3573231>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.7629797, 5.6580300, 0.3573231>,
  <-3.3747297, 5.8112414, 0.6554686>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1512296, 5.5048187, 0.0591776>,
  <-1.9179114, 5.0146665, 0.1468281>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9179114, 5.0146675, 0.1468281>,
  <-1.6845932, 4.5245163, 0.2344785>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.3747297, 5.8112414, 0.6554686> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.3747297, 5.8112414, 0.6554686>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.3747297, 5.8112414, 0.6554686>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.3747297, 5.8112414, 0.6554686>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.3747297, 5.8112414, 0.6554686>,
  <-3.6234333, 5.4419039, 0.9779887>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6234333, 5.4419049, 0.9779887>,
  <-3.8721369, 5.0725684, 1.3005088>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.8028676, 8.9714208, -0.5603063> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.8028676, 8.9714208, -0.5603063>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.8028676, 8.9714208, -0.5603063>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.8028676, 8.9714208, -0.5603063>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.6144879, 8.4241683, -1.6258460> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.6144879, 8.4241683, -1.6258460>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.6144879, 8.4241683, -1.6258460>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.6144879, 8.4241683, -1.6258460>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.5551793, 6.2007936, -1.2284905> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.5551793, 6.2007936, -1.2284905>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.5551793, 6.2007936, -1.2284905>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.5551793, 6.2007936, -1.2284905>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.6845932, 4.5245163, 0.2344785> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.6845932, 4.5245163, 0.2344785>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.6845932, 4.5245163, 0.2344785>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.6845932, 4.5245163, 0.2344785>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.8721369, 5.0725684, 1.3005088> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.8721369, 5.0725684, 1.3005088>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.8721369, 5.0725684, 1.3005088>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.8721369, 5.0725684, 1.3005088>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.3178842, 7.3924328, 1.0907275> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.3178842, 7.3924328, 1.0907275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.3178842, 7.3924328, 1.0907275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.3178842, 7.3924328, 1.0907275>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.3178842, 7.3924328, 1.0907275>,
  <-5.5897789, 7.7295182, 0.7766056>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5897789, 7.7295172, 0.7766056>,
  <-5.8616736, 8.0666016, 0.4624837>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3178842, 7.3924328, 1.0907275>,
  <-5.2321391, 7.6218174, 1.5663915>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.2321391, 7.6218164, 1.5663915>,
  <-5.1463940, 7.8512001, 2.0420554>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3178842, 7.3924328, 1.0907275>,
  <-5.6009928, 6.9434454, 1.1577013>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6009928, 6.9434464, 1.1577013>,
  <-5.8841014, 6.4944600, 1.2246750>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.8616736, 8.0666016, 0.4624837> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.8616736, 8.0666016, 0.4624837>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.8616736, 8.0666016, 0.4624837>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.8616736, 8.0666016, 0.4624837>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.1463940, 7.8512001, 2.0420554> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.1463940, 7.8512001, 2.0420554>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.1463940, 7.8512001, 2.0420554>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.1463940, 7.8512001, 2.0420554>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.8841014, 6.4944600, 1.2246750> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.8841014, 6.4944600, 1.2246750>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.8841014, 6.4944600, 1.2246750>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.8841014, 6.4944600, 1.2246750>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1393552, 2.2622579, 9.5379993> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.1393552, 2.2622579, 9.5379993>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.1393552, 2.2622579, 9.5379993>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.1393552, 2.2622579, 9.5379993>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.1393552, 2.2622579, 9.5379993>,
  <-3.7736497, 2.5525663, 9.5412376>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7736487, 2.5525663, 9.5412376>,
  <-4.4079422, 2.8428747, 9.5444759>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1393552, 2.2622579, 9.5379993>,
  <-2.7800252, 2.2161359, 8.9420606>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.7800252, 2.2161359, 8.9420616>,
  <-2.4206952, 2.1700139, 8.3461239>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1393552, 2.2622579, 9.5379993>,
  <-2.8360110, 1.9926969, 10.1923852>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.8360110, 1.9926969, 10.1923842>,
  <-2.5326668, 1.7231358, 10.8467690>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.4079422, 2.8428747, 9.5444759> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.4079422, 2.8428747, 9.5444759>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.4079422, 2.8428747, 9.5444759>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.4079422, 2.8428747, 9.5444759>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.4079422, 2.8428747, 9.5444759>,
  <-4.6826648, 3.0872980, 8.9519467>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6826648, 3.0872980, 8.9519477>,
  <-4.9573873, 3.3317213, 8.3594196>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4079422, 2.8428747, 9.5444759>,
  <-4.6909434, 2.8795084, 10.0144546>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6909434, 2.8795084, 10.0144536>,
  <-4.9739446, 2.9161422, 10.4844312>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.9573873, 3.3317213, 8.3594196> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.9573873, 3.3317213, 8.3594196>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.9573873, 3.3317213, 8.3594196>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.9573873, 3.3317213, 8.3594196>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.9573873, 3.3317213, 8.3594196>,
  <-4.5980212, 3.2853563, 7.7631714>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.5980212, 3.2853563, 7.7631724>,
  <-4.2386551, 3.2389912, 7.1669253>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.9573873, 3.3317213, 8.3594196>,
  <-5.4572126, 3.5608360, 8.3619892>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4572116, 3.5608360, 8.3619892>,
  <-5.9570358, 3.7899507, 8.3645588>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.2386551, 3.2389912, 7.1669253> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.2386551, 3.2389912, 7.1669253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.2386551, 3.2389912, 7.1669253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.2386551, 3.2389912, 7.1669253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.2386551, 3.2389912, 7.1669253>,
  <-3.6046141, 2.9485317, 7.1636831>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6046151, 2.9485317, 7.1636831>,
  <-2.9705751, 2.6580721, 7.1604410>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.2386551, 3.2389912, 7.1669253>,
  <-4.4553789, 3.4317187, 6.6997938>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4553789, 3.4317187, 6.6997948>,
  <-4.6721027, 3.6244462, 6.2326643>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.9705751, 2.6580721, 7.1604410> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.9705751, 2.6580721, 7.1604410>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.9705751, 2.6580721, 7.1604410>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.9705751, 2.6580721, 7.1604410>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.9705751, 2.6580721, 7.1604410>,
  <-2.6956351, 2.4140430, 7.7532835>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6956351, 2.4140430, 7.7532825>,
  <-2.4206952, 2.1700139, 8.3461239>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.9705751, 2.6580721, 7.1604410>,
  <-2.6872288, 2.6214534, 6.6906079>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6872288, 2.6214534, 6.6906089>,
  <-2.4038824, 2.5848347, 6.2207768>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.4206952, 2.1700139, 8.3461239> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.4206952, 2.1700139, 8.3461239>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.4206952, 2.1700139, 8.3461239>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.4206952, 2.1700139, 8.3461239>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.4206952, 2.1700139, 8.3461239>,
  <-1.9208024, 1.9411404, 8.3434652>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9208034, 1.9411404, 8.3434652>,
  <-1.4209116, 1.7122668, 8.3408065>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.9739446, 2.9161422, 10.4844312> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.9739446, 2.9161422, 10.4844312>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.9739446, 2.9161422, 10.4844312>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.9739446, 2.9161422, 10.4844312>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.9570358, 3.7899507, 8.3645588> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.9570358, 3.7899507, 8.3645588>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.9570358, 3.7899507, 8.3645588>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.9570358, 3.7899507, 8.3645588>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.6721027, 3.6244462, 6.2326643> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.6721027, 3.6244462, 6.2326643>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.6721027, 3.6244462, 6.2326643>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.6721027, 3.6244462, 6.2326643>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.4038824, 2.5848347, 6.2207768> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.4038824, 2.5848347, 6.2207768>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.4038824, 2.5848347, 6.2207768>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.4038824, 2.5848347, 6.2207768>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.4209116, 1.7122668, 8.3408065> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.4209116, 1.7122668, 8.3408065>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.4209116, 1.7122668, 8.3408065>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.4209116, 1.7122668, 8.3408065>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.5326668, 1.7231358, 10.8467690> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.5326668, 1.7231358, 10.8467690>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.5326668, 1.7231358, 10.8467690>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.5326668, 1.7231358, 10.8467690>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.5326668, 1.7231358, 10.8467690>,
  <-2.9249678, 1.5537129, 11.1686723>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.9249668, 1.5537129, 11.1686723>,
  <-3.3172669, 1.3842900, 11.4905756>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5326668, 1.7231358, 10.8467690>,
  <-2.2582349, 2.1127567, 11.0898911>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.2582349, 2.1127557, 11.0898911>,
  <-1.9838030, 2.5023756, 11.3330131>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5326668, 1.7231358, 10.8467690>,
  <-2.2040347, 1.3156457, 10.7364136>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.2040347, 1.3156467, 10.7364136>,
  <-1.8754025, 0.9081576, 10.6260581>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.3172669, 1.3842900, 11.4905756> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.3172669, 1.3842900, 11.4905756>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.3172669, 1.3842900, 11.4905756>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.3172669, 1.3842900, 11.4905756>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.9838030, 2.5023756, 11.3330131> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.9838030, 2.5023756, 11.3330131>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.9838030, 2.5023756, 11.3330131>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.9838030, 2.5023756, 11.3330131>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.8754025, 0.9081576, 10.6260581> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.8754025, 0.9081576, 10.6260581>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.8754025, 0.9081576, 10.6260581>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.8754025, 0.9081576, 10.6260581>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.1308178, 0.1038043, 10.3989253> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.1308178, 0.1038043, 10.3989253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.1308178, 0.1038043, 10.3989253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.1308178, 0.1038043, 10.3989253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.1308178, 0.1038043, 10.3989253>,
  <3.4208641, -0.5190803, 10.2784809>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4208641, -0.5190793, 10.2784809>,
  <3.7109104, -1.1419630, 10.1580366>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1308178, 0.1038043, 10.3989253>,
  <3.4879213, 0.6870401, 10.2621741>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4879213, 0.6870391, 10.2621741>,
  <3.8450248, 1.2702738, 10.1254229>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1308178, 0.1038043, 10.3989253>,
  <2.4164251, 0.1473672, 10.6829089>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4164261, 0.1473672, 10.6829089>,
  <1.7020344, 0.1909301, 10.9668924>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.7109104, -1.1419630, 10.1580366> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.7109104, -1.1419630, 10.1580366>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.7109104, -1.1419630, 10.1580366>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.7109104, -1.1419630, 10.1580366>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.7109104, -1.1419630, 10.1580366>,
  <4.3577920, -1.1815528, 9.9005816>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3577910, -1.1815528, 9.9005816>,
  <5.0046716, -1.2211426, 9.6431266>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.7109104, -1.1419630, 10.1580366>,
  <3.4291020, -1.6016783, 10.2655401>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4291020, -1.6016773, 10.2655401>,
  <3.1472936, -2.0613917, 10.3730437>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.0046716, -1.2211426, 9.6431266> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.0046716, -1.2211426, 9.6431266>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.0046716, -1.2211426, 9.6431266>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.0046716, -1.2211426, 9.6431266>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.0046716, -1.2211426, 9.6431266>,
  <5.3620365, -0.6376670, 9.5065521>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3620365, -0.6376680, 9.5065521>,
  <5.7194013, -0.0541935, 9.3699776>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0046716, -1.2211426, 9.6431266>,
  <5.2332056, -1.7120865, 9.5478834>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.2332056, -1.7120855, 9.5478834>,
  <5.4617396, -2.2030284, 9.4526402>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.7194013, -0.0541935, 9.3699776> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.7194013, -0.0541935, 9.3699776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.7194013, -0.0541935, 9.3699776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.7194013, -0.0541935, 9.3699776>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.7194013, -0.0541935, 9.3699776>,
  <5.4294801, 0.5685222, 9.4906283>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.4294801, 0.5685212, 9.4906283>,
  <5.1395589, 1.1912359, 9.6112791>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.7194013, -0.0541935, 9.3699776>,
  <6.2294484, -0.0855336, 9.1670126>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2294474, -0.0855336, 9.1670126>,
  <6.7394934, -0.1168738, 8.9640476>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.1395589, 1.1912359, 9.6112791> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.1395589, 1.1912359, 9.6112791>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.1395589, 1.1912359, 9.6112791>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.1395589, 1.1912359, 9.6112791>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.1395589, 1.1912359, 9.6112791>,
  <4.4922909, 1.2307548, 9.8683510>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4922919, 1.2307548, 9.8683510>,
  <3.8450248, 1.2702738, 10.1254229>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.1395589, 1.1912359, 9.6112791>,
  <5.4210767, 1.6511746, 9.5036978>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.4210767, 1.6511736, 9.5036978>,
  <5.7025946, 2.1111114, 9.3961166>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.8450248, 1.2702738, 10.1254229> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.8450248, 1.2702738, 10.1254229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.8450248, 1.2702738, 10.1254229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.8450248, 1.2702738, 10.1254229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.8450248, 1.2702738, 10.1254229>,
  <3.6165326, 1.7612453, 10.2204056>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6165326, 1.7612443, 10.2204056>,
  <3.3880404, 2.2522147, 10.3153882>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1472936, -2.0613917, 10.3730437> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1472936, -2.0613917, 10.3730437>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1472936, -2.0613917, 10.3730437>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1472936, -2.0613917, 10.3730437>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.4617396, -2.2030284, 9.4526402> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.4617396, -2.2030284, 9.4526402>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.4617396, -2.2030284, 9.4526402>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.4617396, -2.2030284, 9.4526402>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.7394934, -0.1168738, 8.9640476> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.7394934, -0.1168738, 8.9640476>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.7394934, -0.1168738, 8.9640476>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.7394934, -0.1168738, 8.9640476>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.7025946, 2.1111114, 9.3961166> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.7025946, 2.1111114, 9.3961166>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.7025946, 2.1111114, 9.3961166>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.7025946, 2.1111114, 9.3961166>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.3880404, 2.2522147, 10.3153882> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.3880404, 2.2522147, 10.3153882>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.3880404, 2.2522147, 10.3153882>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.3880404, 2.2522147, 10.3153882>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.7020344, 0.1909301, 10.9668924> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.7020344, 0.1909301, 10.9668924>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.7020344, 0.1909301, 10.9668924>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.7020344, 0.1909301, 10.9668924>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.7020344, 0.1909301, 10.9668924>,
  <1.6065546, -0.2354292, 11.2756432>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.6065546, -0.2354282, 11.2756432>,
  <1.5110747, -0.6617864, 11.5843940>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7020344, 0.1909301, 10.9668924>,
  <1.3502868, 0.2016638, 10.5639229>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.3502868, 0.2016638, 10.5639239>,
  <0.9985391, 0.2123975, 10.1609554>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7020344, 0.1909301, 10.9668924>,
  <1.6528984, 0.6368243, 11.2584231>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.6528984, 0.6368233, 11.2584231>,
  <1.6037624, 1.0827164, 11.5499537>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.5110747, -0.6617864, 11.5843940> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.5110747, -0.6617864, 11.5843940>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.5110747, -0.6617864, 11.5843940>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.5110747, -0.6617864, 11.5843940>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.9985391, 0.2123975, 10.1609554> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.9985391, 0.2123975, 10.1609554>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.9985391, 0.2123975, 10.1609554>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.9985391, 0.2123975, 10.1609554>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.6037624, 1.0827164, 11.5499537> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.6037624, 1.0827164, 11.5499537>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.6037624, 1.0827164, 11.5499537>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.6037624, 1.0827164, 11.5499537>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.5426088, -6.0957957, -8.6157938> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-0.5426088, -6.0957957, -8.6157938>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-0.5426088, -6.0957957, -8.6157938>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-0.5426088, -6.0957957, -8.6157938>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.5426088, -6.0957957, -8.6157938>,
  <-1.0322728, -5.7686759, -9.0213161>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0322718, -5.7686759, -9.0213161>,
  <-1.5219347, -5.4415561, -9.4268384>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.5426088, -6.0957957, -8.6157938>,
  <-0.8271797, -6.6842683, -8.3260604>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.8271797, -6.6842673, -8.3260604>,
  <-1.1117507, -7.2727388, -8.0363269>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.5219347, -5.4415561, -9.4268384> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.5219347, -5.4415561, -9.4268384>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.5219347, -5.4415561, -9.4268384>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.5219347, -5.4415561, -9.4268384>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.5219347, -5.4415561, -9.4268384>,
  <-1.2319053, -4.8195437, -9.7375386>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.2319053, -4.8195447, -9.7375386>,
  <-0.9418758, -4.1975333, -10.0482388>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5219347, -5.4415561, -9.4268384>,
  <-1.6911837, -5.7986599, -9.8214436>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6911837, -5.7986589, -9.8214436>,
  <-1.8604327, -6.1557617, -10.2160487>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5219347, -5.4415561, -9.4268384>,
  <-1.9609860, -5.3152543, -9.1056310>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9609850, -5.3152543, -9.1056310>,
  <-2.4000352, -5.1889526, -8.7844237>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.9418758, -4.1975333, -10.0482388> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.9418758, -4.1975333, -10.0482388>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.9418758, -4.1975333, -10.0482388>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.9418758, -4.1975333, -10.0482388>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.9418758, -4.1975333, -10.0482388>,
  <-1.4493880, -3.8395154, -10.4812440>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4493870, -3.8395154, -10.4812440>,
  <-1.9568982, -3.4814974, -10.9142492>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9418758, -4.1975333, -10.0482388>,
  <-0.4944954, -4.3327737, -10.3586639>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.4944964, -4.3327737, -10.3586639>,
  <-0.0471171, -4.4680141, -10.6690889>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9418758, -4.1975333, -10.0482388>,
  <-0.7747688, -3.8469434, -9.6433106>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.7747688, -3.8469444, -9.6433106>,
  <-0.6076618, -3.4963555, -9.2383823>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.8604327, -6.1557617, -10.2160487> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.8604327, -6.1557617, -10.2160487>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.8604327, -6.1557617, -10.2160487>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.8604327, -6.1557617, -10.2160487>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.4000352, -5.1889526, -8.7844237> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.4000352, -5.1889526, -8.7844237>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.4000352, -5.1889526, -8.7844237>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.4000352, -5.1889526, -8.7844237>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.9568982, -3.4814974, -10.9142492> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.9568982, -3.4814974, -10.9142492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.9568982, -3.4814974, -10.9142492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.9568982, -3.4814974, -10.9142492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.9568982, -3.4814974, -10.9142492>,
  <-1.6668441, -2.8594986, -11.2249726>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6668441, -2.8594996, -11.2249726>,
  <-1.3767899, -2.2375018, -11.5356961>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9568982, -3.4814974, -10.9142492>,
  <-2.4042664, -3.3462549, -10.6038323>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.4042654, -3.3462549, -10.6038323>,
  <-2.8516327, -3.2110123, -10.2934153>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9568982, -3.4814974, -10.9142492>,
  <-2.1352549, -3.8282799, -11.3176360>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1352549, -3.8282789, -11.3176360>,
  <-2.3136116, -4.1750604, -11.7210229>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.0471171, -4.4680141, -10.6690889> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.0471171, -4.4680141, -10.6690889>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.0471171, -4.4680141, -10.6690889>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.0471171, -4.4680141, -10.6690889>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.6076618, -3.4963555, -9.2383823> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.6076618, -3.4963555, -9.2383823>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.6076618, -3.4963555, -9.2383823>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.6076618, -3.4963555, -9.2383823>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.3767899, -2.2375018, -11.5356961> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.3767899, -2.2375018, -11.5356961>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.3767899, -2.2375018, -11.5356961>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.3767899, -2.2375018, -11.5356961>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.3767899, -2.2375018, -11.5356961>,
  <-1.7591133, -1.9819428, -11.8523287>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.7591123, -1.9819428, -11.8523287>,
  <-2.1414346, -1.7263839, -12.1689613>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3767899, -2.2375018, -11.5356961>,
  <-0.9377097, -2.3638606, -11.8568410>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9377107, -2.3638606, -11.8568410>,
  <-0.4986315, -2.4902194, -12.1779860>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3767899, -2.2375018, -11.5356961>,
  <-1.2074266, -1.8804980, -11.1410366>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.2074266, -1.8804990, -11.1410366>,
  <-1.0380633, -1.5234962, -10.7463772>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.8516327, -3.2110123, -10.2934153> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.8516327, -3.2110123, -10.2934153>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.8516327, -3.2110123, -10.2934153>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.8516327, -3.2110123, -10.2934153>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.3136116, -4.1750604, -11.7210229> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.3136116, -4.1750604, -11.7210229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.3136116, -4.1750604, -11.7210229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.3136116, -4.1750604, -11.7210229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.1414346, -1.7263839, -12.1689613> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.1414346, -1.7263839, -12.1689613>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.1414346, -1.7263839, -12.1689613>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.1414346, -1.7263839, -12.1689613>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.4986315, -2.4902194, -12.1779860> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.4986315, -2.4902194, -12.1779860>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.4986315, -2.4902194, -12.1779860>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.4986315, -2.4902194, -12.1779860>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.0380633, -1.5234962, -10.7463772> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.0380633, -1.5234962, -10.7463772>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.0380633, -1.5234962, -10.7463772>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.0380633, -1.5234962, -10.7463772>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.1117507, -7.2727388, -8.0363269> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.1117507, -7.2727388, -8.0363269>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.1117507, -7.2727388, -8.0363269>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.1117507, -7.2727388, -8.0363269>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.1117507, -7.2727388, -8.0363269>,
  <-0.6035324, -7.6252876, -7.6062404>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6035334, -7.6252876, -7.6062404>,
  <-0.0953162, -7.9778364, -7.1761540>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1117507, -7.2727388, -8.0363269>,
  <-1.5564343, -7.1228765, -7.7335410>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5564333, -7.1228765, -7.7335410>,
  <-2.0011160, -6.9730142, -7.4307551>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1117507, -7.2727388, -8.0363269>,
  <-1.2858671, -7.6060280, -8.4492360>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.2858671, -7.6060270, -8.4492360>,
  <-1.4599835, -7.9393152, -8.8621451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-0.0953162, -7.9778364, -7.1761540> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.0953162, -7.9778364, -7.1761540>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.0953162, -7.9778364, -7.1761540>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.0953162, -7.9778364, -7.1761540>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.0953162, -7.9778364, -7.1761540>,
  <-0.3823298, -8.6040573, -6.8619721>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3823298, -8.6040563, -6.8619721>,
  <-0.6693434, -9.2302762, -6.5477903>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.0953162, -7.9778364, -7.1761540>,
  <0.0826582, -7.6314948, -6.7722042>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0826582, -7.6314958, -6.7722042>,
  <0.2606327, -7.2851551, -6.3682545>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.0953162, -7.9778364, -7.1761540>,
  <0.3465868, -8.1228475, -7.4899988>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3465858, -8.1228475, -7.4899988>,
  <0.7884879, -8.2678586, -7.8038437>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.0011160, -6.9730142, -7.4307551> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.0011160, -6.9730142, -7.4307551>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.0011160, -6.9730142, -7.4307551>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.0011160, -6.9730142, -7.4307551>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.4599835, -7.9393152, -8.8621451> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.4599835, -7.9393152, -8.8621451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.4599835, -7.9393152, -8.8621451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.4599835, -7.9393152, -8.8621451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.6693434, -9.2302762, -6.5477903> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.6693434, -9.2302762, -6.5477903>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.6693434, -9.2302762, -6.5477903>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.6693434, -9.2302762, -6.5477903>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.6693434, -9.2302762, -6.5477903>,
  <-0.1611200, -9.5828008, -6.1176762>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1611210, -9.5828008, -6.1176762>,
  <0.3471014, -9.9353255, -5.6875621>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6693434, -9.2302762, -6.5477903>,
  <-0.8473091, -9.5766124, -6.9517288>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.8473091, -9.5766114, -6.9517288>,
  <-1.0252748, -9.9229465, -7.3556674>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6693434, -9.2302762, -6.5477903>,
  <-1.1171286, -9.0948555, -6.2380494>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1171276, -9.0948555, -6.2380494>,
  <-1.5649119, -8.9594349, -5.9283085>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.2606327, -7.2851551, -6.3682545> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.2606327, -7.2851551, -6.3682545>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.2606327, -7.2851551, -6.3682545>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.2606327, -7.2851551, -6.3682545>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.7884879, -8.2678586, -7.8038437> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.7884879, -8.2678586, -7.8038437>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.7884879, -8.2678586, -7.8038437>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.7884879, -8.2678586, -7.8038437>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.3471014, -9.9353255, -5.6875621> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.3471014, -9.9353255, -5.6875621>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.3471014, -9.9353255, -5.6875621>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.3471014, -9.9353255, -5.6875621>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.3471014, -9.9353255, -5.6875621>,
  <0.1249984, -10.3949173, -5.4613237>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.1249984, -10.3949163, -5.4613237>,
  <-0.0971045, -10.8545072, -5.2350853>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3471014, -9.9353255, -5.6875621>,
  <0.5212222, -9.6019679, -5.2747106>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5212222, -9.6019689, -5.2747106>,
  <0.6953429, -9.2686124, -4.8618592>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3471014, -9.9353255, -5.6875621>,
  <0.7918267, -10.0850360, -5.9903792>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.7918257, -10.0850360, -5.9903792>,
  <1.2365499, -10.2347465, -6.2931963>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.0252748, -9.9229465, -7.3556674> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.0252748, -9.9229465, -7.3556674>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.0252748, -9.9229465, -7.3556674>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.0252748, -9.9229465, -7.3556674>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.5649119, -8.9594349, -5.9283085> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.5649119, -8.9594349, -5.9283085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.5649119, -8.9594349, -5.9283085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.5649119, -8.9594349, -5.9283085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.0971045, -10.8545072, -5.2350853> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.0971045, -10.8545072, -5.2350853>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.0971045, -10.8545072, -5.2350853>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.0971045, -10.8545072, -5.2350853>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.6953429, -9.2686124, -4.8618592> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.6953429, -9.2686124, -4.8618592>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.6953429, -9.2686124, -4.8618592>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.6953429, -9.2686124, -4.8618592>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.2365499, -10.2347465, -6.2931963> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.2365499, -10.2347465, -6.2931963>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.2365499, -10.2347465, -6.2931963>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.2365499, -10.2347465, -6.2931963>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.0571406, -1.3237747, -4.3137827> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <6.0571406, -1.3237747, -4.3137827>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <6.0571406, -1.3237747, -4.3137827>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <6.0571406, -1.3237747, -4.3137827>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.0571406, -1.3237747, -4.3137827>,
  <5.9908590, -1.6679948, -3.6906093>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9908590, -1.6679938, -3.6906093>,
  <5.9245775, -2.0122128, -3.0674358>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.0571406, -1.3237747, -4.3137827>,
  <5.5048319, -1.4880381, -4.7371016>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.5048329, -1.4880381, -4.7371016>,
  <4.9525252, -1.6523015, -5.1604206>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.9245775, -2.0122128, -3.0674358> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.9245775, -2.0122128, -3.0674358>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.9245775, -2.0122128, -3.0674358>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.9245775, -2.0122128, -3.0674358>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.9245775, -2.0122128, -3.0674358>,
  <6.5020599, -1.8456508, -2.6132090>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5020589, -1.8456508, -2.6132090>,
  <7.0795403, -1.6790888, -2.1589822>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9245775, -2.0122128, -3.0674358>,
  <5.4401027, -1.8620768, -2.8337146>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.4401037, -1.8620768, -2.8337146>,
  <4.9556300, -1.7119409, -2.5999934>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9245775, -2.0122128, -3.0674358>,
  <5.9063392, -2.5608543, -3.1701612>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9063392, -2.5608533, -3.1701612>,
  <5.8881010, -3.1094939, -3.2728865>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.0795403, -1.6790888, -2.1589822> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.0795403, -1.6790888, -2.1589822>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.0795403, -1.6790888, -2.1589822>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.0795403, -1.6790888, -2.1589822>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.0795403, -1.6790888, -2.1589822>,
  <7.0233911, -2.0367724, -1.4940401>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.0233911, -2.0367714, -1.4940401>,
  <6.9672418, -2.3944539, -0.8290979>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.0795403, -1.6790888, -2.1589822>,
  <7.0971045, -1.1251330, -2.0716463>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.0971045, -1.1251340, -2.0716463>,
  <7.1146687, -0.5711792, -1.9843103>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.0795403, -1.6790888, -2.1589822>,
  <7.5602645, -1.8332815, -2.4037965>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5602635, -1.8332815, -2.4037965>,
  <8.0409866, -1.9874742, -2.6486108>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9556300, -1.7119409, -2.5999934> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9556300, -1.7119409, -2.5999934>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9556300, -1.7119409, -2.5999934>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9556300, -1.7119409, -2.5999934>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.8881010, -3.1094939, -3.2728865> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.8881010, -3.1094939, -3.2728865>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.8881010, -3.1094939, -3.2728865>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.8881010, -3.1094939, -3.2728865>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.9672418, -2.3944539, -0.8290979> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.9672418, -2.3944539, -0.8290979>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.9672418, -2.3944539, -0.8290979>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.9672418, -2.3944539, -0.8290979>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.9672418, -2.3944539, -0.8290979>,
  <7.5447192, -2.2278566, -0.3748642>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5447182, -2.2278566, -0.3748642>,
  <8.1221945, -2.0612593, 0.0793694>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9672418, -2.3944539, -0.8290979>,
  <6.9496831, -2.9483969, -0.9164294>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9496831, -2.9483959, -0.9164294>,
  <6.9321243, -3.5023378, -1.0037609>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9672418, -2.3944539, -0.8290979>,
  <6.4847596, -2.2516164, -0.5809079>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.4847606, -2.2516164, -0.5809079>,
  <6.0022794, -2.1087789, -0.3327178>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.1146687, -0.5711792, -1.9843103> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.1146687, -0.5711792, -1.9843103>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.1146687, -0.5711792, -1.9843103>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.1146687, -0.5711792, -1.9843103>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.0409866, -1.9874742, -2.6486108> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.0409866, -1.9874742, -2.6486108>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.0409866, -1.9874742, -2.6486108>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.0409866, -1.9874742, -2.6486108>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.1221945, -2.0612593, 0.0793694> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.1221945, -2.0612593, 0.0793694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.1221945, -2.0612593, 0.0793694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.1221945, -2.0612593, 0.0793694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.1221945, -2.0612593, 0.0793694>,
  <8.0705648, -2.3300702, 0.5660040>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.0705648, -2.3300692, 0.5660040>,
  <8.0189352, -2.5988792, 1.0526385>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.1221945, -2.0612593, 0.0793694>,
  <8.1404147, -1.5126013, 0.1820091>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.1404147, -1.5126023, 0.1820091>,
  <8.1586349, -0.9639452, 0.2846487>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.1221945, -2.0612593, 0.0793694>,
  <8.6066537, -2.2112900, -0.1544720>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.6066527, -2.2112900, -0.1544720>,
  <9.0911110, -2.3613206, -0.3883134>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.9321243, -3.5023378, -1.0037609> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.9321243, -3.5023378, -1.0037609>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.9321243, -3.5023378, -1.0037609>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.9321243, -3.5023378, -1.0037609>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.0022794, -2.1087789, -0.3327178> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.0022794, -2.1087789, -0.3327178>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.0022794, -2.1087789, -0.3327178>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.0022794, -2.1087789, -0.3327178>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.0189352, -2.5988792, 1.0526385> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.0189352, -2.5988792, 1.0526385>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.0189352, -2.5988792, 1.0526385>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.0189352, -2.5988792, 1.0526385>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.1586349, -0.9639452, 0.2846487> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.1586349, -0.9639452, 0.2846487>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.1586349, -0.9639452, 0.2846487>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.1586349, -0.9639452, 0.2846487>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.0911110, -2.3613206, -0.3883134> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.0911110, -2.3613206, -0.3883134>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.0911110, -2.3613206, -0.3883134>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.0911110, -2.3613206, -0.3883134>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.9525252, -1.6523015, -5.1604206> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.9525252, -1.6523015, -5.1604206>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.9525252, -1.6523015, -5.1604206>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.9525252, -1.6523015, -5.1604206>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.9525252, -1.6523015, -5.1604206>,
  <5.0128246, -1.2946138, -5.8207037>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0128246, -1.2946148, -5.8207037>,
  <5.0731239, -0.9369282, -6.4809868>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9525252, -1.6523015, -5.1604206>,
  <4.9464847, -2.2056411, -5.2356626>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9464847, -2.2056401, -5.2356626>,
  <4.9404441, -2.7589787, -5.3109047>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9525252, -1.6523015, -5.1604206>,
  <4.4808566, -1.5063608, -4.8994177>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4808576, -1.5063608, -4.8994177>,
  <4.0091901, -1.3604202, -4.6384148>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.0731239, -0.9369282, -6.4809868> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.0731239, -0.9369282, -6.4809868>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.0731239, -0.9369282, -6.4809868>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.0731239, -0.9369282, -6.4809868>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.0731239, -0.9369282, -6.4809868>,
  <4.4944704, -1.1010544, -6.9408363>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4944714, -1.1010544, -6.9408363>,
  <3.9158188, -1.2651806, -7.4006859>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0731239, -0.9369282, -6.4809868>,
  <5.5552035, -1.0801796, -6.7297457>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.5552025, -1.0801796, -6.7297457>,
  <6.0372811, -1.2234309, -6.9785046>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0731239, -0.9369282, -6.4809868>,
  <5.0789815, -0.3827653, -6.3933806>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0789815, -0.3827663, -6.3933806>,
  <5.0848390, 0.1713955, -6.3057743>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9404441, -2.7589787, -5.3109047> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9404441, -2.7589787, -5.3109047>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9404441, -2.7589787, -5.3109047>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9404441, -2.7589787, -5.3109047>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.0091901, -1.3604202, -4.6384148> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.0091901, -1.3604202, -4.6384148>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.0091901, -1.3604202, -4.6384148>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.0091901, -1.3604202, -4.6384148>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.9158188, -1.2651806, -7.4006859> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.9158188, -1.2651806, -7.4006859>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.9158188, -1.2651806, -7.4006859>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.9158188, -1.2651806, -7.4006859>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.9158188, -1.2651806, -7.4006859>,
  <3.9761471, -0.9075081, -8.0609842>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9761471, -0.9075091, -8.0609842>,
  <4.0364754, -0.5498376, -8.7212825>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9158188, -1.2651806, -7.4006859>,
  <3.4337506, -1.1219284, -7.1519367>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4337516, -1.1219284, -7.1519367>,
  <2.9516844, -0.9786762, -6.9031874>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9158188, -1.2651806, -7.4006859>,
  <3.8980315, -1.8192396, -7.4872451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8980315, -1.8192386, -7.4872451>,
  <3.8802441, -2.3732966, -7.5738043>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.0372811, -1.2234309, -6.9785046> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.0372811, -1.2234309, -6.9785046>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.0372811, -1.2234309, -6.9785046>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.0372811, -1.2234309, -6.9785046>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.0848390, 0.1713955, -6.3057743> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.0848390, 0.1713955, -6.3057743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.0848390, 0.1713955, -6.3057743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.0848390, 0.1713955, -6.3057743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.0364754, -0.5498376, -8.7212825> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.0364754, -0.5498376, -8.7212825>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.0364754, -0.5498376, -8.7212825>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.0364754, -0.5498376, -8.7212825>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.0364754, -0.5498376, -8.7212825>,
  <3.6051859, -0.6779882, -9.0518950>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6051869, -0.6779882, -9.0518950>,
  <3.1738984, -0.8061389, -9.3825076>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.0364754, -0.5498376, -8.7212825>,
  <4.5081883, -0.6957737, -8.9822074>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.5081873, -0.6957737, -8.9822074>,
  <4.9798993, -0.8417098, -9.2431323>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.0364754, -0.5498376, -8.7212825>,
  <4.0426559, 0.0034982, -8.6459597>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.0426559, 0.0034972, -8.6459597>,
  <4.0488363, 0.5568320, -8.5706370>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.9516844, -0.9786762, -6.9031874> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.9516844, -0.9786762, -6.9031874>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.9516844, -0.9786762, -6.9031874>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.9516844, -0.9786762, -6.9031874>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.8802441, -2.3732966, -7.5738043> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.8802441, -2.3732966, -7.5738043>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.8802441, -2.3732966, -7.5738043>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.8802441, -2.3732966, -7.5738043>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.1738984, -0.8061389, -9.3825076> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1738984, -0.8061389, -9.3825076>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1738984, -0.8061389, -9.3825076>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1738984, -0.8061389, -9.3825076>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.9798993, -0.8417098, -9.2431323> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9798993, -0.8417098, -9.2431323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9798993, -0.8417098, -9.2431323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9798993, -0.8417098, -9.2431323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.0488363, 0.5568320, -8.5706370> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.0488363, 0.5568320, -8.5706370>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.0488363, 0.5568320, -8.5706370>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.0488363, 0.5568320, -8.5706370>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.4988988, -2.5455471, 3.6992826> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <7.4988988, -2.5455471, 3.6992826>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <7.4988988, -2.5455471, 3.6992826>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <7.4988988, -2.5455471, 3.6992826>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.4988988, -2.5455471, 3.6992826>,
  <7.3820362, -2.9879191, 4.2487150>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.3820362, -2.9879181, 4.2487150>,
  <7.2651735, -3.4302890, 4.7981474>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.4988988, -2.5455471, 3.6992826>,
  <8.0016210, -2.0698118, 3.8786498>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.0016200, -2.0698118, 3.8786498>,
  <8.5043411, -1.5940765, 4.0580169>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.2651735, -3.4302890, 4.7981474> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.2651735, -3.4302890, 4.7981474>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.2651735, -3.4302890, 4.7981474>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.2651735, -3.4302890, 4.7981474>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.2651735, -3.4302890, 4.7981474>,
  <6.7366216, -3.9364675, 4.6193541>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7366226, -3.9364675, 4.6193541>,
  <6.2080717, -4.4426460, 4.4405608>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.2651735, -3.4302890, 4.7981474>,
  <7.7460893, -3.6839301, 4.9256944>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.7460883, -3.6839301, 4.9256944>,
  <8.2270032, -3.9375711, 5.0532414>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.2651735, -3.4302890, 4.7981474>,
  <7.1059600, -3.1260952, 5.2386124>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.1059600, -3.1260962, 5.2386124>,
  <6.9467466, -2.8219034, 5.6790775>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.2080717, -4.4426460, 4.4405608> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.2080717, -4.4426460, 4.4405608>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.2080717, -4.4426460, 4.4405608>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.2080717, -4.4426460, 4.4405608>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.2080717, -4.4426460, 4.4405608>,
  <6.0730106, -4.9189039, 5.0134272>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.0730106, -4.9189029, 5.0134272>,
  <5.9379495, -5.3951599, 5.5862936>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2080717, -4.4426460, 4.4405608>,
  <6.3712495, -4.7346115, 3.9900817>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.3712495, -4.7346105, 3.9900817>,
  <6.5344272, -5.0265749, 3.5396026>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2080717, -4.4426460, 4.4405608>,
  <5.7303852, -4.1770620, 4.3137290>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.7303862, -4.1770620, 4.3137290>,
  <5.2527008, -3.9114780, 4.1868973>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.2270032, -3.9375711, 5.0532414> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.2270032, -3.9375711, 5.0532414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.2270032, -3.9375711, 5.0532414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.2270032, -3.9375711, 5.0532414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.9467466, -2.8219034, 5.6790775> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.9467466, -2.8219034, 5.6790775>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.9467466, -2.8219034, 5.6790775>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.9467466, -2.8219034, 5.6790775>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.9379495, -5.3951599, 5.5862936> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.9379495, -5.3951599, 5.5862936>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.9379495, -5.3951599, 5.5862936>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.9379495, -5.3951599, 5.5862936>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.9379495, -5.3951599, 5.5862936>,
  <5.4094135, -5.9013578, 5.4074744>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.4094145, -5.9013578, 5.4074744>,
  <4.8808796, -6.4075557, 5.2286552>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9379495, -5.3951599, 5.5862936>,
  <5.7747705, -5.1032033, 6.0367611>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.7747705, -5.1032043, 6.0367611>,
  <5.6115916, -4.8112487, 6.4872286>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9379495, -5.3951599, 5.5862936>,
  <6.4130853, -5.6594768, 5.7247583>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.4130843, -5.6594768, 5.7247583>,
  <6.8882192, -5.9237937, 5.8632230>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.5344272, -5.0265749, 3.5396026> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.5344272, -5.0265749, 3.5396026>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.5344272, -5.0265749, 3.5396026>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.5344272, -5.0265749, 3.5396026>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.2527008, -3.9114780, 4.1868973> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.2527008, -3.9114780, 4.1868973>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.2527008, -3.9114780, 4.1868973>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.2527008, -3.9114780, 4.1868973>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.8808796, -6.4075557, 5.2286552> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.8808796, -6.4075557, 5.2286552>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.8808796, -6.4075557, 5.2286552>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.8808796, -6.4075557, 5.2286552>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.8808796, -6.4075557, 5.2286552>,
  <4.7894972, -6.7530047, 5.6576686>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.7894972, -6.7530037, 5.6576686>,
  <4.6981149, -7.0984517, 6.0866821>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.8808796, -6.4075557, 5.2286552>,
  <5.0401241, -6.7116758, 4.7881507>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0401241, -6.7116748, 4.7881507>,
  <5.1993686, -7.0157940, 4.3476463>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.8808796, -6.4075557, 5.2286552>,
  <4.4000261, -6.1538428, 5.1009784>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4000271, -6.1538428, 5.1009784>,
  <3.9191746, -5.9001299, 4.9733017>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.6115916, -4.8112487, 6.4872286> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.6115916, -4.8112487, 6.4872286>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.6115916, -4.8112487, 6.4872286>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.6115916, -4.8112487, 6.4872286>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.8882192, -5.9237937, 5.8632230> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.8882192, -5.9237937, 5.8632230>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.8882192, -5.9237937, 5.8632230>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.8882192, -5.9237937, 5.8632230>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.6981149, -7.0984517, 6.0866821> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.6981149, -7.0984517, 6.0866821>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.6981149, -7.0984517, 6.0866821>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.6981149, -7.0984517, 6.0866821>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.1993686, -7.0157940, 4.3476463> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.1993686, -7.0157940, 4.3476463>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.1993686, -7.0157940, 4.3476463>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.1993686, -7.0157940, 4.3476463>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.9191746, -5.9001299, 4.9733017> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.9191746, -5.9001299, 4.9733017>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.9191746, -5.9001299, 4.9733017>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.9191746, -5.9001299, 4.9733017>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.5043411, -1.5940765, 4.0580169> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.5043411, -1.5940765, 4.0580169>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.5043411, -1.5940765, 4.0580169>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.5043411, -1.5940765, 4.0580169>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.5043411, -1.5940765, 4.0580169>,
  <8.6350596, -1.1222915, 3.4854071>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.6350596, -1.1222925, 3.4854071>,
  <8.7657782, -0.6505084, 2.9127973>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.5043411, -1.5940765, 4.0580169>,
  <8.3293956, -1.3139824, 4.5083758>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.3293956, -1.3139834, 4.5083758>,
  <8.1544501, -1.0338902, 4.9587347>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.5043411, -1.5940765, 4.0580169>,
  <8.9691465, -1.8718460, 4.1947370>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9691455, -1.8718460, 4.1947370>,
  <9.4339500, -2.1496155, 4.3314571>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.7657782, -0.6505084, 2.9127973> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.7657782, -0.6505084, 2.9127973>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.7657782, -0.6505084, 2.9127973>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.7657782, -0.6505084, 2.9127973>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.7657782, -0.6505084, 2.9127973>,
  <9.2968117, -0.1400129, 3.0878317>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.2968107, -0.1400129, 3.0878317>,
  <9.8278431, 0.3704827, 3.2628660>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.7657782, -0.6505084, 2.9127973>,
  <8.2909347, -0.3854924, 2.7746201>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.2909357, -0.3854924, 2.7746201>,
  <7.8160932, -0.1204763, 2.6364428>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.7657782, -0.6505084, 2.9127973>,
  <8.9399477, -0.9423336, 2.4663581>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9399477, -0.9423326, 2.4663581>,
  <9.1141173, -1.2341567, 2.0199188>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.1544501, -1.0338902, 4.9587347> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.1544501, -1.0338902, 4.9587347>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.1544501, -1.0338902, 4.9587347>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.1544501, -1.0338902, 4.9587347>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.4339500, -2.1496155, 4.3314571> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.4339500, -2.1496155, 4.3314571>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.4339500, -2.1496155, 4.3314571>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.4339500, -2.1496155, 4.3314571>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.8278431, 0.3704827, 3.2628660> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <9.8278431, 0.3704827, 3.2628660>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <9.8278431, 0.3704827, 3.2628660>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <9.8278431, 0.3704827, 3.2628660>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <9.8278431, 0.3704827, 3.2628660>,
  <9.9585303, 0.8422858, 2.6902533>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.9585303, 0.8422848, 2.6902533>,
  <10.0892175, 1.3140869, 2.1176407>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.8278431, 0.3704827, 3.2628660>,
  <10.3026774, 0.1054745, 3.4010351>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <10.3026764, 0.1054745, 3.4010351>,
  <10.7775096, -0.1595337, 3.5392042>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.8278431, 0.3704827, 3.2628660>,
  <9.6647619, 0.6617788, 3.7137993>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.6647619, 0.6617778, 3.7137993>,
  <9.5016807, 0.9530728, 4.1647326>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.8160932, -0.1204763, 2.6364428> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.8160932, -0.1204763, 2.6364428>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.8160932, -0.1204763, 2.6364428>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.8160932, -0.1204763, 2.6364428>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.1141173, -1.2341567, 2.0199188> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.1141173, -1.2341567, 2.0199188>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.1141173, -1.2341567, 2.0199188>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.1141173, -1.2341567, 2.0199188>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<10.0892175, 1.3140869, 2.1176407> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <10.0892175, 1.3140869, 2.1176407>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <10.0892175, 1.3140869, 2.1176407>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <10.0892175, 1.3140869, 2.1176407>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <10.0892175, 1.3140869, 2.1176407>,
  <10.4818319, 1.6855811, 2.2575841>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <10.4818309, 1.6855811, 2.2575841>,
  <10.8744443, 2.0570754, 2.3975276>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <10.0892175, 1.3140869, 2.1176407>,
  <9.6243649, 1.5917810, 1.9809297>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.6243659, 1.5917810, 1.9809297>,
  <9.1595144, 1.8694752, 1.8442187>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <10.0892175, 1.3140869, 2.1176407>,
  <10.2640238, 1.0339142, 1.6672656>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <10.2640238, 1.0339152, 1.6672656>,
  <10.4388301, 0.7537435, 1.2168906>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<10.7775096, -0.1595337, 3.5392042> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <10.7775096, -0.1595337, 3.5392042>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <10.7775096, -0.1595337, 3.5392042>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <10.7775096, -0.1595337, 3.5392042>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.5016807, 0.9530728, 4.1647326> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.5016807, 0.9530728, 4.1647326>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.5016807, 0.9530728, 4.1647326>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.5016807, 0.9530728, 4.1647326>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<10.8744443, 2.0570754, 2.3975276> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <10.8744443, 2.0570754, 2.3975276>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <10.8744443, 2.0570754, 2.3975276>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <10.8744443, 2.0570754, 2.3975276>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.1595144, 1.8694752, 1.8442187> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.1595144, 1.8694752, 1.8442187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.1595144, 1.8694752, 1.8442187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.1595144, 1.8694752, 1.8442187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<10.4388301, 0.7537435, 1.2168906> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <10.4388301, 0.7537435, 1.2168906>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <10.4388301, 0.7537435, 1.2168906>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <10.4388301, 0.7537435, 1.2168906>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.2651802, -4.9789520, -4.6670304> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-3.2651802, -4.9789520, -4.6670304>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-3.2651802, -4.9789520, -4.6670304>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-3.2651802, -4.9789520, -4.6670304>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.2651802, -4.9789520, -4.6670304>,
  <-3.8093220, -4.6061675, -4.9430147>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.8093210, -4.6061675, -4.9430147>,
  <-4.3534619, -4.2333830, -5.2189989>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2651802, -4.9789520, -4.6670304>,
  <-3.3754705, -5.0800988, -3.9678655>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.3754705, -5.0800988, -3.9678665>,
  <-3.4857607, -5.1812456, -3.2687025>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.3534619, -4.2333830, -5.2189989> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.3534619, -4.2333830, -5.2189989>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.3534619, -4.2333830, -5.2189989>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.3534619, -4.2333830, -5.2189989>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.3534619, -4.2333830, -5.2189989>,
  <-4.2472233, -4.1213651, -5.9563695>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.2472233, -4.1213661, -5.9563695>,
  <-4.1409847, -4.0093493, -6.6937401>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.3534619, -4.2333830, -5.2189989>,
  <-4.8256624, -4.5175471, -5.1286667>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.8256614, -4.5175471, -5.1286667>,
  <-5.2978608, -4.8017111, -5.0383346>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.3534619, -4.2333830, -5.2189989>,
  <-4.3884211, -3.7460386, -4.9485077>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.3884211, -3.7460396, -4.9485077>,
  <-4.4233803, -3.2586963, -4.6780165>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.1409847, -4.0093493, -6.6937401> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.1409847, -4.0093493, -6.6937401>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.1409847, -4.0093493, -6.6937401>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.1409847, -4.0093493, -6.6937401>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.1409847, -4.0093493, -6.6937401>,
  <-4.7099063, -3.6151915, -7.0006715>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.7099053, -3.6151915, -7.0006715>,
  <-5.2788259, -3.2210336, -7.3076029>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1409847, -4.0093493, -6.6937401>,
  <-4.0947288, -4.5037906, -6.9548742>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.0947288, -4.5037896, -6.9548742>,
  <-4.0484729, -4.9982300, -7.2160082>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1409847, -4.0093493, -6.6937401>,
  <-3.6642509, -3.7241921, -6.7725809>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6642519, -3.7241921, -6.7725809>,
  <-3.1875190, -3.4390350, -6.8514217>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.2978608, -4.8017111, -5.0383346> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.2978608, -4.8017111, -5.0383346>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.2978608, -4.8017111, -5.0383346>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.2978608, -4.8017111, -5.0383346>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.4233803, -3.2586963, -4.6780165> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.4233803, -3.2586963, -4.6780165>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.4233803, -3.2586963, -4.6780165>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.4233803, -3.2586963, -4.6780165>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.2788259, -3.2210336, -7.3076029> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.2788259, -3.2210336, -7.3076029>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.2788259, -3.2210336, -7.3076029>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.2788259, -3.2210336, -7.3076029>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.2788259, -3.2210336, -7.3076029>,
  <-5.1725898, -3.1090496, -8.0449869>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1725898, -3.1090506, -8.0449869>,
  <-5.0663537, -2.9970675, -8.7823709>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.2788259, -3.2210336, -7.3076029>,
  <-5.3250788, -2.7266024, -7.0464795>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3250788, -2.7266034, -7.0464795>,
  <-5.3713317, -2.2321732, -6.7853562>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.2788259, -3.2210336, -7.3076029>,
  <-5.7611097, -3.4959084, -7.2261368>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.7611087, -3.4959084, -7.2261368>,
  <-6.2433915, -3.7707832, -7.1446708>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.0484729, -4.9982300, -7.2160082> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.0484729, -4.9982300, -7.2160082>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.0484729, -4.9982300, -7.2160082>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.0484729, -4.9982300, -7.2160082>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1875190, -3.4390350, -6.8514217> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.1875190, -3.4390350, -6.8514217>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.1875190, -3.4390350, -6.8514217>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.1875190, -3.4390350, -6.8514217>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.0663537, -2.9970675, -8.7823709> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.0663537, -2.9970675, -8.7823709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.0663537, -2.9970675, -8.7823709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.0663537, -2.9970675, -8.7823709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.0663537, -2.9970675, -8.7823709>,
  <-5.4911855, -2.7059050, -8.9979643>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4911845, -2.7059050, -8.9979643>,
  <-5.9160153, -2.4147426, -9.2135577>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.0663537, -2.9970675, -8.7823709>,
  <-5.0313433, -3.4844446, -9.0527967>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.0313433, -3.4844436, -9.0527967>,
  <-4.9963329, -3.9718198, -9.3232225>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.0663537, -2.9970675, -8.7823709>,
  <-4.5940609, -2.7130217, -8.8726450>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.5940619, -2.7130217, -8.8726450>,
  <-4.1217700, -2.4289759, -8.9629192>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.3713317, -2.2321732, -6.7853562> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.3713317, -2.2321732, -6.7853562>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.3713317, -2.2321732, -6.7853562>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.3713317, -2.2321732, -6.7853562>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.2433915, -3.7707832, -7.1446708> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.2433915, -3.7707832, -7.1446708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.2433915, -3.7707832, -7.1446708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.2433915, -3.7707832, -7.1446708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.9160153, -2.4147426, -9.2135577> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.9160153, -2.4147426, -9.2135577>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.9160153, -2.4147426, -9.2135577>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.9160153, -2.4147426, -9.2135577>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.9963329, -3.9718198, -9.3232225> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.9963329, -3.9718198, -9.3232225>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.9963329, -3.9718198, -9.3232225>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.9963329, -3.9718198, -9.3232225>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1217700, -2.4289759, -8.9629192> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.1217700, -2.4289759, -8.9629192>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.1217700, -2.4289759, -8.9629192>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.1217700, -2.4289759, -8.9629192>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.4857607, -5.1812456, -3.2687025> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.4857607, -5.1812456, -3.2687025>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.4857607, -5.1812456, -3.2687025>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.4857607, -5.1812456, -3.2687025>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.4857607, -5.1812456, -3.2687025>,
  <-2.9172643, -5.5733199, -2.9676374>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.9172653, -5.5733199, -2.9676374>,
  <-2.3487698, -5.9653942, -2.6665722>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4857607, -5.1812456, -3.2687025>,
  <-3.5324990, -4.6816850, -3.0234743>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5324990, -4.6816860, -3.0234743>,
  <-3.5792373, -4.1821265, -2.7782461>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4857607, -5.1812456, -3.2687025>,
  <-3.9690922, -5.4534643, -3.2040470>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9690912, -5.4534643, -3.2040470>,
  <-4.4524216, -5.7256830, -3.1393915>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.3487698, -5.9653942, -2.6665722> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.3487698, -5.9653942, -2.6665722>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.3487698, -5.9653942, -2.6665722>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.3487698, -5.9653942, -2.6665722>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.3487698, -5.9653942, -2.6665722>,
  <-2.4514322, -6.0807960, -1.9253692>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.4514322, -6.0807950, -1.9253692>,
  <-2.5540946, -6.1961958, -1.1841662>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3487698, -5.9653942, -2.6665722>,
  <-1.8664339, -5.6903550, -2.7472457>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.8664349, -5.6903550, -2.7472457>,
  <-1.3841000, -5.4153158, -2.8279192>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3487698, -5.9653942, -2.6665722>,
  <-2.3107263, -6.4642204, -2.9206002>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3107263, -6.4642194, -2.9206002>,
  <-2.2726828, -6.9630446, -3.1746282>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.5792373, -4.1821265, -2.7782461> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.5792373, -4.1821265, -2.7782461>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.5792373, -4.1821265, -2.7782461>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.5792373, -4.1821265, -2.7782461>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.4524216, -5.7256830, -3.1393915> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.4524216, -5.7256830, -3.1393915>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.4524216, -5.7256830, -3.1393915>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.4524216, -5.7256830, -3.1393915>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.5540946, -6.1961958, -1.1841662> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.5540946, -6.1961958, -1.1841662>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.5540946, -6.1961958, -1.1841662>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.5540946, -6.1961958, -1.1841662>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.5540946, -6.1961958, -1.1841662>,
  <-1.9855703, -6.5882471, -0.8831038>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9855713, -6.5882471, -0.8831038>,
  <-1.4170480, -6.9802985, -0.5820414>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5540946, -6.1961958, -1.1841662>,
  <-3.0364158, -6.4712327, -1.1034931>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.0364148, -6.4712327, -1.1034931>,
  <-3.5187349, -6.7462696, -1.0228201>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.5540946, -6.1961958, -1.1841662>,
  <-2.6010690, -5.7016416, -0.9233990>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6010690, -5.7016426, -0.9233990>,
  <-2.6480433, -5.2070895, -0.6626319>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.3841000, -5.4153158, -2.8279192> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.3841000, -5.4153158, -2.8279192>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.3841000, -5.4153158, -2.8279192>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.3841000, -5.4153158, -2.8279192>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.2726828, -6.9630446, -3.1746282> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.2726828, -6.9630446, -3.1746282>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.2726828, -6.9630446, -3.1746282>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.2726828, -6.9630446, -3.1746282>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.4170480, -6.9802985, -0.5820414> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.4170480, -6.9802985, -0.5820414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.4170480, -6.9802985, -0.5820414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.4170480, -6.9802985, -0.5820414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.4170480, -6.9802985, -0.5820414>,
  <-1.5031165, -7.0593996, -0.0360800>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5031165, -7.0593996, -0.0360810>,
  <-1.5891851, -7.1385007, 0.5098794>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4170480, -6.9802985, -0.5820414>,
  <-0.9337397, -6.7080587, -0.6467808>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9337407, -6.7080587, -0.6467808>,
  <-0.4504335, -6.4358189, -0.7115202>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.4170480, -6.9802985, -0.5820414>,
  <-1.3702710, -7.4797951, -0.8274127>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3702710, -7.4797941, -0.8274127>,
  <-1.3234940, -7.9792898, -1.0727839>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.5187349, -6.7462696, -1.0228201> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.5187349, -6.7462696, -1.0228201>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.5187349, -6.7462696, -1.0228201>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.5187349, -6.7462696, -1.0228201>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.6480433, -5.2070895, -0.6626319> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.6480433, -5.2070895, -0.6626319>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.6480433, -5.2070895, -0.6626319>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.6480433, -5.2070895, -0.6626319>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.5891851, -7.1385007, 0.5098794> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.5891851, -7.1385007, 0.5098794>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.5891851, -7.1385007, 0.5098794>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.5891851, -7.1385007, 0.5098794>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.4504335, -6.4358189, -0.7115202> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.4504335, -6.4358189, -0.7115202>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.4504335, -6.4358189, -0.7115202>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.4504335, -6.4358189, -0.7115202>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.3234940, -7.9792898, -1.0727839> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.3234940, -7.9792898, -1.0727839>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.3234940, -7.9792898, -1.0727839>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.3234940, -7.9792898, -1.0727839>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.5584645, -4.4274276, -6.9487895> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <5.5584645, -4.4274276, -6.9487895>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <5.5584645, -4.4274276, -6.9487895>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <5.5584645, -4.4274276, -6.9487895>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.5584645, -4.4274276, -6.9487895>,
  <6.0001735, -4.5228731, -6.3947052>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.0001735, -4.5228731, -6.3947062>,
  <6.4418825, -4.6183187, -5.8406229>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.5584645, -4.4274276, -6.9487895>,
  <5.0863730, -4.9638761, -6.9728387>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.0863730, -4.9638751, -6.9728387>,
  <4.6142814, -5.5003227, -6.9968880>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.4418825, -4.6183187, -5.8406229> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.4418825, -4.6183187, -5.8406229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.4418825, -4.6183187, -5.8406229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.4418825, -4.6183187, -5.8406229>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.4418825, -4.6183187, -5.8406229>,
  <6.9438459, -4.0576255, -5.8058885>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9438459, -4.0576265, -5.8058885>,
  <7.4458092, -3.4969343, -5.7711542>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.4418825, -4.6183187, -5.8406229>,
  <6.1367123, -4.6390971, -5.3733742>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.1367123, -4.6390971, -5.3733752>,
  <5.8315421, -4.6598755, -4.9061274>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.4418825, -4.6183187, -5.8406229>,
  <6.6993605, -5.1099448, -5.9030829>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.6993605, -5.1099438, -5.9030829>,
  <6.9568385, -5.6015690, -5.9655430>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.4458092, -3.4969343, -5.7711542> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.4458092, -3.4969343, -5.7711542>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.4458092, -3.4969343, -5.7711542>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.4458092, -3.4969343, -5.7711542>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.4458092, -3.4969343, -5.7711542>,
  <7.9213831, -3.5841918, -5.1885267>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.9213831, -3.5841918, -5.1885277>,
  <8.3969569, -3.6714493, -4.6059012>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.4458092, -3.4969343, -5.7711542>,
  <7.1777089, -3.0066199, -5.7209814>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.1777089, -3.0066209, -5.7209814>,
  <6.9096086, -2.5163074, -5.6708087>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.4458092, -3.4969343, -5.7711542>,
  <7.7456840, -3.4850473, -6.2452204>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.7456840, -3.4850473, -6.2452194>,
  <8.0455589, -3.4731603, -6.7192846>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.8315421, -4.6598755, -4.9061274> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.8315421, -4.6598755, -4.9061274>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.8315421, -4.6598755, -4.9061274>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.8315421, -4.6598755, -4.9061274>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.9568385, -5.6015690, -5.9655430> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.9568385, -5.6015690, -5.9655430>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.9568385, -5.6015690, -5.9655430>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.9568385, -5.6015690, -5.9655430>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.3969569, -3.6714493, -4.6059012> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.3969569, -3.6714493, -4.6059012>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.3969569, -3.6714493, -4.6059012>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.3969569, -3.6714493, -4.6059012>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.3969569, -3.6714493, -4.6059012>,
  <8.8988994, -3.1107272, -4.5711586>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.8988994, -3.1107282, -4.5711586>,
  <9.4008419, -2.5500070, -4.5364159>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.3969569, -3.6714493, -4.6059012>,
  <8.6650549, -4.1617490, -4.6560738>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.6650549, -4.1617480, -4.6560738>,
  <8.9331529, -4.6520468, -4.7062464>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.3969569, -3.6714493, -4.6059012>,
  <8.1040182, -3.6922432, -4.1278373>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.1040182, -3.6922432, -4.1278383>,
  <7.8110796, -3.7130372, -3.6497755>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.9096086, -2.5163074, -5.6708087> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.9096086, -2.5163074, -5.6708087>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.9096086, -2.5163074, -5.6708087>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.9096086, -2.5163074, -5.6708087>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.0455589, -3.4731603, -6.7192846> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.0455589, -3.4731603, -6.7192846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.0455589, -3.4731603, -6.7192846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.0455589, -3.4731603, -6.7192846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.4008419, -2.5500070, -4.5364159> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <9.4008419, -2.5500070, -4.5364159>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <9.4008419, -2.5500070, -4.5364159>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <9.4008419, -2.5500070, -4.5364159>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <9.4008419, -2.5500070, -4.5364159>,
  <9.7458641, -2.6244886, -4.1038072>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.7458641, -2.6244886, -4.1038082>,
  <10.0908864, -2.6989701, -3.6712005>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.4008419, -2.5500070, -4.5364159>,
  <9.1433028, -2.0584054, -4.4740157>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.1433028, -2.0584064, -4.4740157>,
  <8.8857637, -1.5668058, -4.4116155>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.4008419, -2.5500070, -4.5364159>,
  <9.7058856, -2.5291917, -5.0037562>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.7058856, -2.5291917, -5.0037552>,
  <10.0109294, -2.5083764, -5.4710944>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.9331529, -4.6520468, -4.7062464> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.9331529, -4.6520468, -4.7062464>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.9331529, -4.6520468, -4.7062464>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.9331529, -4.6520468, -4.7062464>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.8110796, -3.7130372, -3.6497755> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.8110796, -3.7130372, -3.6497755>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.8110796, -3.7130372, -3.6497755>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.8110796, -3.7130372, -3.6497755>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<10.0908864, -2.6989701, -3.6712005> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <10.0908864, -2.6989701, -3.6712005>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <10.0908864, -2.6989701, -3.6712005>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <10.0908864, -2.6989701, -3.6712005>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.8857637, -1.5668058, -4.4116155> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.8857637, -1.5668058, -4.4116155>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.8857637, -1.5668058, -4.4116155>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.8857637, -1.5668058, -4.4116155>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<10.0109294, -2.5083764, -5.4710944> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <10.0109294, -2.5083764, -5.4710944>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <10.0109294, -2.5083764, -5.4710944>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <10.0109294, -2.5083764, -5.4710944>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.6142814, -5.5003227, -6.9968880> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.6142814, -5.5003227, -6.9968880>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.6142814, -5.5003227, -6.9968880>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.6142814, -5.5003227, -6.9968880>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.6142814, -5.5003227, -6.9968880>,
  <4.1436479, -5.4095252, -7.5781031>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.1436479, -5.4095252, -7.5781021>,
  <3.6730143, -5.3187277, -8.1593162>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6142814, -5.5003227, -6.9968880>,
  <4.8953599, -5.9806066, -7.0438390>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.8953599, -5.9806056, -7.0438390>,
  <5.1764384, -6.4608885, -7.0907900>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6142814, -5.5003227, -6.9968880>,
  <4.3327378, -5.5091372, -6.5146560>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3327378, -5.5091372, -6.5146570>,
  <4.0511942, -5.5179517, -6.0324259>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.6730143, -5.3187277, -8.1593162> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.6730143, -5.3187277, -8.1593162>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.6730143, -5.3187277, -8.1593162>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.6730143, -5.3187277, -8.1593162>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.6730143, -5.3187277, -8.1593162>,
  <3.1662613, -5.8799254, -8.1980164>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1662613, -5.8799244, -8.1980164>,
  <2.6595083, -6.4411211, -8.2367167>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6730143, -5.3187277, -8.1593162>,
  <3.9656585, -5.2986552, -8.6376038>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9656585, -5.2986552, -8.6376028>,
  <4.2583027, -5.2785827, -9.1158894>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6730143, -5.3187277, -8.1593162>,
  <3.3970376, -4.8335705, -8.1021766>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.3970376, -4.8335715, -8.1021766>,
  <3.1210608, -4.3484153, -8.0450371>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.1764384, -6.4608885, -7.0907900> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.1764384, -6.4608885, -7.0907900>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.1764384, -6.4608885, -7.0907900>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.1764384, -6.4608885, -7.0907900>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.0511942, -5.5179517, -6.0324259> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.0511942, -5.5179517, -6.0324259>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.0511942, -5.5179517, -6.0324259>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.0511942, -5.5179517, -6.0324259>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.6595083, -6.4411211, -8.2367167> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.6595083, -6.4411211, -8.2367167>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.6595083, -6.4411211, -8.2367167>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.6595083, -6.4411211, -8.2367167>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.6595083, -6.4411211, -8.2367167>,
  <2.1888964, -6.3503280, -8.8179605>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.1888964, -6.3503280, -8.8179595>,
  <1.7182845, -6.2595349, -9.3992022>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6595083, -6.4411211, -8.2367167>,
  <2.3668670, -6.4611914, -7.7584432>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.3668670, -6.4611914, -7.7584442>,
  <2.0742257, -6.4812616, -7.2801718>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6595083, -6.4411211, -8.2367167>,
  <2.9278761, -6.9313539, -8.2861246>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.9278761, -6.9313529, -8.2861246>,
  <3.1962440, -7.4215846, -8.3355325>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.2583027, -5.2785827, -9.1158894> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.2583027, -5.2785827, -9.1158894>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.2583027, -5.2785827, -9.1158894>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.2583027, -5.2785827, -9.1158894>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.1210608, -4.3484153, -8.0450371> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1210608, -4.3484153, -8.0450371>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1210608, -4.3484153, -8.0450371>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1210608, -4.3484153, -8.0450371>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.7182845, -6.2595349, -9.3992022> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.7182845, -6.2595349, -9.3992022>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.7182845, -6.2595349, -9.3992022>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.7182845, -6.2595349, -9.3992022>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.7182845, -6.2595349, -9.3992022>,
  <1.3495436, -6.6783586, -9.4180243>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.3495436, -6.6783576, -9.4180243>,
  <0.9808026, -7.0971803, -9.4368464>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7182845, -6.2595349, -9.3992022>,
  <1.9998914, -6.2506691, -9.8813963>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.9998914, -6.2506691, -9.8813953>,
  <2.2814982, -6.2418033, -10.3635884>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.7182845, -6.2595349, -9.3992022>,
  <1.4373389, -5.7791615, -9.3522658>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4373389, -5.7791625, -9.3522658>,
  <1.1563933, -5.2987901, -9.3053294>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.0742257, -6.4812616, -7.2801718> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.0742257, -6.4812616, -7.2801718>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.0742257, -6.4812616, -7.2801718>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.0742257, -6.4812616, -7.2801718>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.1962440, -7.4215846, -8.3355325> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1962440, -7.4215846, -8.3355325>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1962440, -7.4215846, -8.3355325>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1962440, -7.4215846, -8.3355325>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.9808026, -7.0971803, -9.4368464> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.9808026, -7.0971803, -9.4368464>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.9808026, -7.0971803, -9.4368464>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.9808026, -7.0971803, -9.4368464>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2814982, -6.2418033, -10.3635884> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.2814982, -6.2418033, -10.3635884>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.2814982, -6.2418033, -10.3635884>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.2814982, -6.2418033, -10.3635884>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.1563933, -5.2987901, -9.3053294> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.1563933, -5.2987901, -9.3053294>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.1563933, -5.2987901, -9.3053294>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.1563933, -5.2987901, -9.3053294>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.2121238, 2.4764831, 7.4690085> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <3.2121238, 2.4764831, 7.4690085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <3.2121238, 2.4764831, 7.4690085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <3.2121238, 2.4764831, 7.4690085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.2121238, 2.4764831, 7.4690085>,
  <3.5440365, 2.8252947, 6.9404349>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.5440365, 2.8252937, 6.9404349>,
  <3.8759492, 3.1741043, 6.4118613>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2121238, 2.4764831, 7.4690085>,
  <2.7097139, 2.0485148, 7.1939565>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.7097149, 2.0485148, 7.1939565>,
  <2.2073061, 1.6205465, 6.9189046>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.8759492, 3.1741043, 6.4118613> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.8759492, 3.1741043, 6.4118613>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.8759492, 3.1741043, 6.4118613>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.8759492, 3.1741043, 6.4118613>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.8759492, 3.1741043, 6.4118613>,
  <4.4082321, 3.6282263, 6.6911451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4082311, 3.6282263, 6.6911451>,
  <4.9405130, 4.0823483, 6.9704289>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8759492, 3.1741043, 6.4118613>,
  <4.0997673, 2.7975929, 6.0654126>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.0997673, 2.7975939, 6.0654126>,
  <4.3235854, 2.4210835, 5.7189640>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8759492, 3.1741043, 6.4118613>,
  <3.4950739, 3.4678766, 6.1280939>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4950749, 3.4678766, 6.1280939>,
  <3.1142007, 3.7616488, 5.8443264>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9405130, 4.0823483, 6.9704289> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.9405130, 4.0823483, 6.9704289>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.9405130, 4.0823483, 6.9704289>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.9405130, 4.0823483, 6.9704289>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.9405130, 4.0823483, 6.9704289>,
  <5.3013737, 4.4592653, 6.4218385>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3013737, 4.4592643, 6.4218385>,
  <5.6622344, 4.8361803, 5.8732481>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9405130, 4.0823483, 6.9704289>,
  <5.3112420, 3.7802358, 7.2638414>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3112410, 3.7802358, 7.2638414>,
  <5.6819691, 3.4781233, 7.5572539>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9405130, 4.0823483, 6.9704289>,
  <4.7048201, 4.4553192, 7.3170510>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.7048201, 4.4553182, 7.3170510>,
  <4.4691272, 4.8282881, 7.6636732>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.3235854, 2.4210835, 5.7189640> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.3235854, 2.4210835, 5.7189640>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.3235854, 2.4210835, 5.7189640>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.3235854, 2.4210835, 5.7189640>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.1142007, 3.7616488, 5.8443264> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1142007, 3.7616488, 5.8443264>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1142007, 3.7616488, 5.8443264>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1142007, 3.7616488, 5.8443264>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.6622344, 4.8361803, 5.8732481> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.6622344, 4.8361803, 5.8732481>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.6622344, 4.8361803, 5.8732481>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.6622344, 4.8361803, 5.8732481>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.6622344, 4.8361803, 5.8732481>,
  <6.1945412, 5.2902786, 6.1525451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.1945402, 5.2902786, 6.1525451>,
  <6.7268460, 5.7443769, 6.4318420>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.6622344, 4.8361803, 5.8732481>,
  <5.2915165, 5.1382898, 5.5798448>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.2915175, 5.1382898, 5.5798448>,
  <4.9208007, 5.4403993, 5.2864414>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.6622344, 4.8361803, 5.8732481>,
  <5.8945103, 4.4699184, 5.5173124>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.8945103, 4.4699194, 5.5173124>,
  <6.1267862, 4.1036584, 5.1613767>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.6819691, 3.4781233, 7.5572539> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.6819691, 3.4781233, 7.5572539>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.6819691, 3.4781233, 7.5572539>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.6819691, 3.4781233, 7.5572539>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.4691272, 4.8282881, 7.6636732> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.4691272, 4.8282881, 7.6636732>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.4691272, 4.8282881, 7.6636732>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.4691272, 4.8282881, 7.6636732>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.7268460, 5.7443769, 6.4318420> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.7268460, 5.7443769, 6.4318420>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.7268460, 5.7443769, 6.4318420>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.7268460, 5.7443769, 6.4318420>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.7268460, 5.7443769, 6.4318420>,
  <6.9860447, 6.0168641, 6.0191626>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9860447, 6.0168631, 6.0191626>,
  <7.2452434, 6.2893494, 5.6064832>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7268460, 5.7443769, 6.4318420>,
  <7.1076560, 5.4505562, 6.7156461>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.1076550, 5.4505562, 6.7156461>,
  <7.4884640, 5.1567355, 6.9994502>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7268460, 5.7443769, 6.4318420>,
  <6.5029818, 6.1207766, 6.7783966>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5029818, 6.1207756, 6.7783966>,
  <6.2791177, 6.4971744, 7.1249511>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9208007, 5.4403993, 5.2864414> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9208007, 5.4403993, 5.2864414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9208007, 5.4403993, 5.2864414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9208007, 5.4403993, 5.2864414>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.1267862, 4.1036584, 5.1613767> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.1267862, 4.1036584, 5.1613767>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.1267862, 4.1036584, 5.1613767>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.1267862, 4.1036584, 5.1613767>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.2452434, 6.2893494, 5.6064832> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.2452434, 6.2893494, 5.6064832>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.2452434, 6.2893494, 5.6064832>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.2452434, 6.2893494, 5.6064832>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.4884640, 5.1567355, 6.9994502> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.4884640, 5.1567355, 6.9994502>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.4884640, 5.1567355, 6.9994502>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.4884640, 5.1567355, 6.9994502>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.2791177, 6.4971744, 7.1249511> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.2791177, 6.4971744, 7.1249511>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.2791177, 6.4971744, 7.1249511>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.2791177, 6.4971744, 7.1249511>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2073061, 1.6205465, 6.9189046> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.2073061, 1.6205465, 6.9189046>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.2073061, 1.6205465, 6.9189046>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.2073061, 1.6205465, 6.9189046>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.2073061, 1.6205465, 6.9189046>,
  <1.8508041, 1.2480422, 7.4681742>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.8508041, 1.2480432, 7.4681742>,
  <1.4943022, 0.8755399, 8.0174439>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.2073061, 1.6205465, 6.9189046>,
  <1.8482956, 1.9342882, 6.6281127>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.8482966, 1.9342882, 6.6281127>,
  <1.4892871, 2.2480299, 6.3373209>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.2073061, 1.6205465, 6.9189046>,
  <2.4531531, 1.2640787, 6.5662261>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4531531, 1.2640797, 6.5662261>,
  <2.6990001, 0.9076129, 6.2135476>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.4943022, 0.8755399, 8.0174439> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.4943022, 0.8755399, 8.0174439>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.4943022, 0.8755399, 8.0174439>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.4943022, 0.8755399, 8.0174439>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.4943022, 0.8755399, 8.0174439>,
  <0.9584761, 0.4173915, 7.7413471>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.9584771, 0.4173915, 7.7413471>,
  <0.4226521, -0.0407569, 7.4652503>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4943022, 0.8755399, 8.0174439>,
  <1.2612847, 1.2415936, 8.3731269>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.2612847, 1.2415926, 8.3731269>,
  <1.0282673, 1.6076453, 8.7288099>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.4943022, 0.8755399, 8.0174439>,
  <1.8641030, 0.5648357, 8.3029522>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.8641020, 0.5648357, 8.3029522>,
  <2.2339018, 0.2541314, 8.5884604>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.4892871, 2.2480299, 6.3373209> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.4892871, 2.2480299, 6.3373209>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.4892871, 2.2480299, 6.3373209>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.4892871, 2.2480299, 6.3373209>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.6990001, 0.9076129, 6.2135476> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.6990001, 0.9076129, 6.2135476>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.6990001, 0.9076129, 6.2135476>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.6990001, 0.9076129, 6.2135476>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.4226521, -0.0407569, 7.4652503> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.4226521, -0.0407569, 7.4652503>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.4226521, -0.0407569, 7.4652503>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.4226521, -0.0407569, 7.4652503>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.4226521, -0.0407569, 7.4652503>,
  <0.0661320, -0.4132348, 8.0145375>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0661320, -0.4132338, 8.0145375>,
  <-0.2903881, -0.7857106, 8.5638246>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.4226521, -0.0407569, 7.4652503>,
  <0.6556626, -0.4068054, 7.1095794>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6556626, -0.4068044, 7.1095794>,
  <0.8886730, -0.7728519, 6.7539085>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.4226521, -0.0407569, 7.4652503>,
  <0.0524952, 0.2614872, 7.1712729>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0524962, 0.2614872, 7.1712729>,
  <-0.3176597, 0.5637313, 6.8772955>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.0282673, 1.6076453, 8.7288099> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.0282673, 1.6076453, 8.7288099>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.0282673, 1.6076453, 8.7288099>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.0282673, 1.6076453, 8.7288099>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2339018, 0.2541314, 8.5884604> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.2339018, 0.2541314, 8.5884604>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.2339018, 0.2541314, 8.5884604>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.2339018, 0.2541314, 8.5884604>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.2903881, -0.7857106, 8.5638246> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.2903881, -0.7857106, 8.5638246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.2903881, -0.7857106, 8.5638246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.2903881, -0.7857106, 8.5638246>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.2903881, -0.7857106, 8.5638246>,
  <-0.6826896, -1.1199934, 8.3491327>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.6826886, -1.1199934, 8.3491327>,
  <-1.0749891, -1.4542762, 8.1344408>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2903881, -0.7857106, 8.5638246>,
  <-0.5361625, -0.4291906, 8.9165005>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.5361625, -0.4291916, 8.9165005>,
  <-0.7819369, -0.0726726, 9.2691764>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.2903881, -0.7857106, 8.5638246>,
  <0.0687032, -1.0993242, 8.8546716>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.0687022, -1.0993242, 8.8546716>,
  <0.4277925, -1.4129378, 9.1455185>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.8886730, -0.7728519, 6.7539085> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.8886730, -0.7728519, 6.7539085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.8886730, -0.7728519, 6.7539085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.8886730, -0.7728519, 6.7539085>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.3176597, 0.5637313, 6.8772955> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.3176597, 0.5637313, 6.8772955>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.3176597, 0.5637313, 6.8772955>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.3176597, 0.5637313, 6.8772955>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.0749891, -1.4542762, 8.1344408> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.0749891, -1.4542762, 8.1344408>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.0749891, -1.4542762, 8.1344408>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.0749891, -1.4542762, 8.1344408>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.7819369, -0.0726726, 9.2691764> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-0.7819369, -0.0726726, 9.2691764>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-0.7819369, -0.0726726, 9.2691764>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-0.7819369, -0.0726726, 9.2691764>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.4277925, -1.4129378, 9.1455185> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.4277925, -1.4129378, 9.1455185>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.4277925, -1.4129378, 9.1455185>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.4277925, -1.4129378, 9.1455185>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.2672512, 7.3096357, -2.3792051> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-7.2672512, 7.3096357, -2.3792051>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-7.2672512, 7.3096357, -2.3792051>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-7.2672512, 7.3096357, -2.3792051>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.2672512, 7.3096357, -2.3792051>,
  <-7.4605891, 7.0322750, -1.7491912>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.4605891, 7.0322760, -1.7491912>,
  <-7.6539270, 6.7549164, -1.1191773>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.2672512, 7.3096357, -2.3792051>,
  <-6.6097983, 7.5857364, -2.3267627>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.6097993, 7.5857364, -2.3267627>,
  <-5.9523474, 7.8618372, -2.2743204>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-7.6539270, 6.7549164, -1.1191773> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-7.6539270, 6.7549164, -1.1191773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-7.6539270, 6.7549164, -1.1191773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-7.6539270, 6.7549164, -1.1191773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.6539270, 6.7549164, -1.1191773>,
  <-8.3460099, 6.4606361, -1.1635819>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.3460089, 6.4606361, -1.1635819>,
  <-9.0380908, 6.1663558, -1.2079864>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.6539270, 6.7549164, -1.1191773>,
  <-7.2818387, 6.3634041, -0.9772274>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.2818387, 6.3634051, -0.9772274>,
  <-6.9097503, 5.9718937, -0.8352775>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.6539270, 6.7549164, -1.1191773>,
  <-7.6361780, 7.1601249, -0.7352722>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.6361780, 7.1601239, -0.7352722>,
  <-7.6184289, 7.5653313, -0.3513670>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.0380908, 6.1663558, -1.2079864> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.0380908, 6.1663558, -1.2079864>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.0380908, 6.1663558, -1.2079864>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.0380908, 6.1663558, -1.2079864>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.0380908, 6.1663558, -1.2079864>,
  <-9.2572325, 5.8683295, -0.5473841>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.2572325, 5.8683305, -0.5473841>,
  <-9.4763743, 5.5703052, 0.1132181>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.0380908, 6.1663558, -1.2079864>,
  <-9.0491418, 5.7693338, -1.6042872>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.0491418, 5.7693348, -1.6042872>,
  <-9.0601928, 5.3723139, -2.0005881>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.0380908, 6.1663558, -1.2079864>,
  <-9.4028644, 6.5677115, -1.3517201>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.4028644, 6.5677105, -1.3517201>,
  <-9.7676381, 6.9690652, -1.4954539>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.9097503, 5.9718937, -0.8352775> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.9097503, 5.9718937, -0.8352775>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.9097503, 5.9718937, -0.8352775>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.9097503, 5.9718937, -0.8352775>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.6184289, 7.5653313, -0.3513670> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.6184289, 7.5653313, -0.3513670>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.6184289, 7.5653313, -0.3513670>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.6184289, 7.5653313, -0.3513670>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.4763743, 5.5703052, 0.1132181> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.4763743, 5.5703052, 0.1132181>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.4763743, 5.5703052, 0.1132181>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.4763743, 5.5703052, 0.1132181>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.4763743, 5.5703052, 0.1132181>,
  <-10.1684523, 5.2759966, 0.0687907>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.1684513, 5.2759966, 0.0687907>,
  <-10.8605282, 4.9816881, 0.0243632>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.4763743, 5.5703052, 0.1132181>,
  <-9.4653289, 5.9673173, 0.5095091>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.4653289, 5.9673163, 0.5095091>,
  <-9.4542834, 6.3643274, 0.9058000>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.4763743, 5.5703052, 0.1132181>,
  <-9.1119971, 5.1728403, 0.2682711>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.1119971, 5.1728413, 0.2682711>,
  <-8.7476200, 4.7753775, 0.4233240>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.0601928, 5.3723139, -2.0005881> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.0601928, 5.3723139, -2.0005881>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.0601928, 5.3723139, -2.0005881>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.0601928, 5.3723139, -2.0005881>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.7676381, 6.9690652, -1.4954539> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.7676381, 6.9690652, -1.4954539>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.7676381, 6.9690652, -1.4954539>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.7676381, 6.9690652, -1.4954539>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.8605282, 4.9816881, 0.0243632> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-10.8605282, 4.9816881, 0.0243632>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-10.8605282, 4.9816881, 0.0243632>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-10.8605282, 4.9816881, 0.0243632>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-10.8605282, 4.9816881, 0.0243632>,
  <-11.0116263, 4.7651370, 0.5163114>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-11.0116263, 4.7651380, 0.5163114>,
  <-11.1627243, 4.5485879, 1.0082595>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.8605282, 4.9816881, 0.0243632>,
  <-10.8782277, 4.5765298, -0.3595967>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.8782277, 4.5765308, -0.3595967>,
  <-10.8959271, 4.1713734, -0.7435567>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.8605282, 4.9816881, 0.0243632>,
  <-11.2325511, 5.3732234, -0.1177316>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-11.2325511, 5.3732224, -0.1177316>,
  <-11.6045740, 5.7647566, -0.2598263>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.4542834, 6.3643274, 0.9058000> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.4542834, 6.3643274, 0.9058000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.4542834, 6.3643274, 0.9058000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.4542834, 6.3643274, 0.9058000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.7476200, 4.7753775, 0.4233240> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.7476200, 4.7753775, 0.4233240>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.7476200, 4.7753775, 0.4233240>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.7476200, 4.7753775, 0.4233240>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-11.1627243, 4.5485879, 1.0082595> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-11.1627243, 4.5485879, 1.0082595>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-11.1627243, 4.5485879, 1.0082595>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-11.1627243, 4.5485879, 1.0082595>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.8959271, 4.1713734, -0.7435567> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.8959271, 4.1713734, -0.7435567>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.8959271, 4.1713734, -0.7435567>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.8959271, 4.1713734, -0.7435567>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-11.6045740, 5.7647566, -0.2598263> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-11.6045740, 5.7647566, -0.2598263>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-11.6045740, 5.7647566, -0.2598263>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-11.6045740, 5.7647566, -0.2598263>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.9523474, 7.8618372, -2.2743204> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.9523474, 7.8618372, -2.2743204>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.9523474, 7.8618372, -2.2743204>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.9523474, 7.8618372, -2.2743204>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.9523474, 7.8618372, -2.2743204>,
  <-5.7387783, 8.1574225, -2.9335378>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.7387783, 8.1574215, -2.9335378>,
  <-5.5252092, 8.4530057, -3.5927552>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9523474, 7.8618372, -2.2743204>,
  <-5.9564151, 8.2523481, -1.8751124>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9564151, 8.2523471, -1.8751124>,
  <-5.9604827, 8.6428569, -1.4759045>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.9523474, 7.8618372, -2.2743204>,
  <-5.6025299, 7.4556308, -2.1177442>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6025299, 7.4556318, -2.1177442>,
  <-5.2527124, 7.0494264, -1.9611680>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.5252092, 8.4530057, -3.5927552> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.5252092, 8.4530057, -3.5927552>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.5252092, 8.4530057, -3.5927552>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.5252092, 8.4530057, -3.5927552>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.5252092, 8.4530057, -3.5927552>,
  <-4.8297891, 8.7497398, -3.5530160>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.8297901, 8.7497398, -3.5530160>,
  <-4.1343710, 9.0464740, -3.5132768>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5252092, 8.4530057, -3.5927552>,
  <-5.8890301, 8.8510460, -3.7476785>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8890301, 8.8510450, -3.7476785>,
  <-6.2528510, 9.2490842, -3.9026019>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5252092, 8.4530057, -3.5927552>,
  <-5.5255050, 8.0526440, -3.9858402>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5255050, 8.0526450, -3.9858402>,
  <-5.5258008, 7.6522842, -4.3789253>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.9604827, 8.6428569, -1.4759045> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.9604827, 8.6428569, -1.4759045>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.9604827, 8.6428569, -1.4759045>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.9604827, 8.6428569, -1.4759045>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.2527124, 7.0494264, -1.9611680> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.2527124, 7.0494264, -1.9611680>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.2527124, 7.0494264, -1.9611680>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.2527124, 7.0494264, -1.9611680>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1343710, 9.0464740, -3.5132768> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.1343710, 9.0464740, -3.5132768>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.1343710, 9.0464740, -3.5132768>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.1343710, 9.0464740, -3.5132768>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.1343710, 9.0464740, -3.5132768>,
  <-3.9208244, 9.3420875, -4.1724986>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9208244, 9.3420865, -4.1724986>,
  <-3.7072777, 9.6376991, -4.8317204>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1343710, 9.0464740, -3.5132768>,
  <-3.7705567, 8.6484440, -3.3583623>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7705567, 8.6484450, -3.3583623>,
  <-3.4067423, 8.2504160, -3.2034477>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1343710, 9.0464740, -3.5132768>,
  <-4.1234086, 9.4429168, -3.1164101>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1234086, 9.4429158, -3.1164101>,
  <-4.1124462, 9.8393577, -2.7195434>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.2528510, 9.2490842, -3.9026019> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.2528510, 9.2490842, -3.9026019>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.2528510, 9.2490842, -3.9026019>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.2528510, 9.2490842, -3.9026019>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.5258008, 7.6522842, -4.3789253> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.5258008, 7.6522842, -4.3789253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.5258008, 7.6522842, -4.3789253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.5258008, 7.6522842, -4.3789253>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.7072777, 9.6376991, -4.8317204> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.7072777, 9.6376991, -4.8317204>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.7072777, 9.6376991, -4.8317204>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.7072777, 9.6376991, -4.8317204>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.7072777, 9.6376991, -4.8317204>,
  <-3.1938560, 9.8532663, -4.7908911>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1938570, 9.8532663, -4.7908911>,
  <-2.6804362, 10.0688336, -4.7500619>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7072777, 9.6376991, -4.8317204>,
  <-4.0571648, 10.0438553, -4.9882704>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.0571648, 10.0438543, -4.9882704>,
  <-4.4070519, 10.4500095, -5.1448205>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7072777, 9.6376991, -4.8317204>,
  <-3.7033690, 9.2471657, -5.2309201>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7033690, 9.2471667, -5.2309201>,
  <-3.6994603, 8.8566343, -5.6301198>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.4067423, 8.2504160, -3.2034477> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.4067423, 8.2504160, -3.2034477>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.4067423, 8.2504160, -3.2034477>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.4067423, 8.2504160, -3.2034477>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1124462, 9.8393577, -2.7195434> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.1124462, 9.8393577, -2.7195434>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.1124462, 9.8393577, -2.7195434>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.1124462, 9.8393577, -2.7195434>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.6804362, 10.0688336, -4.7500619> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.6804362, 10.0688336, -4.7500619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.6804362, 10.0688336, -4.7500619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.6804362, 10.0688336, -4.7500619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.4070519, 10.4500095, -5.1448205> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.4070519, 10.4500095, -5.1448205>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.4070519, 10.4500095, -5.1448205>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.4070519, 10.4500095, -5.1448205>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.6994603, 8.8566343, -5.6301198> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.6994603, 8.8566343, -5.6301198>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.6994603, 8.8566343, -5.6301198>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.6994603, 8.8566343, -5.6301198>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.2696816, -6.9938711, -2.0911693> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <6.2696816, -6.9938711, -2.0911693>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <6.2696816, -6.9938711, -2.0911693>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <6.2696816, -6.9938711, -2.0911693>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.2696816, -6.9938711, -2.0911693>,
  <6.2398605, -6.6361195, -1.4728245>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2398605, -6.6361205, -1.4728245>,
  <6.2100395, -6.2783700, -0.8544796>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2696816, -6.9938711, -2.0911693>,
  <5.6129991, -7.0447341, -2.3693909>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.6130001, -7.0447341, -2.3693909>,
  <4.9563186, -7.0955971, -2.6476124>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.2100395, -6.2783700, -0.8544796> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.2100395, -6.2783700, -0.8544796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.2100395, -6.2783700, -0.8544796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.2100395, -6.2783700, -0.8544796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.2100395, -6.2783700, -0.8544796>,
  <6.8977148, -6.2187646, -0.5526496>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.8977138, -6.2187646, -0.5526496>,
  <7.5853881, -6.1591591, -0.2508196>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2100395, -6.2783700, -0.8544796>,
  <5.9935325, -5.7731587, -0.9533161>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.9935325, -5.7731597, -0.9533161>,
  <5.7770255, -5.2679495, -1.0521526>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2100395, -6.2783700, -0.8544796>,
  <5.8661432, -6.5512961, -0.5093150>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.8661432, -6.5512961, -0.5093160>,
  <5.5222469, -6.8242223, -0.1641524>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.5853881, -6.1591591, -0.2508196> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.5853881, -6.1591591, -0.2508196>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.5853881, -6.1591591, -0.2508196>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.5853881, -6.1591591, -0.2508196>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.5853881, -6.1591591, -0.2508196>,
  <7.5700291, -5.7821576, 0.4055889>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5700291, -5.7821586, 0.4055889>,
  <7.5546702, -5.4051581, 1.0619974>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5853881, -6.1591591, -0.2508196>,
  <7.9265149, -5.8949516, -0.6094697>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.9265149, -5.8949516, -0.6094687>,
  <8.2676417, -5.6307441, -0.9681178>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5853881, -6.1591591, -0.2508196>,
  <7.7931210, -6.6717821, -0.1566382>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.7931210, -6.6717811, -0.1566382>,
  <8.0008539, -7.1844030, -0.0624568>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.7770255, -5.2679495, -1.0521526> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.7770255, -5.2679495, -1.0521526>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.7770255, -5.2679495, -1.0521526>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.7770255, -5.2679495, -1.0521526>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.5222469, -6.8242223, -0.1641524> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.5222469, -6.8242223, -0.1641524>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.5222469, -6.8242223, -0.1641524>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.5222469, -6.8242223, -0.1641524>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.5546702, -5.4051581, 1.0619974> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.5546702, -5.4051581, 1.0619974>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.5546702, -5.4051581, 1.0619974>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.5546702, -5.4051581, 1.0619974>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.5546702, -5.4051581, 1.0619974>,
  <8.2423627, -5.3455317, 1.3638037>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.2423617, -5.3455317, 1.3638037>,
  <8.9300532, -5.2859052, 1.6656099>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5546702, -5.4051581, 1.0619974>,
  <7.2135562, -5.6693612, 1.4206411>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.2135562, -5.6693612, 1.4206401>,
  <6.8724422, -5.9335642, 1.7792827>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5546702, -5.4051581, 1.0619974>,
  <7.3405779, -4.8934094, 0.9779266>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.3405779, -4.8934104, 0.9779266>,
  <7.1264857, -4.3816627, 0.8938559>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.2676417, -5.6307441, -0.9681178> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.2676417, -5.6307441, -0.9681178>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.2676417, -5.6307441, -0.9681178>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.2676417, -5.6307441, -0.9681178>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.0008539, -7.1844030, -0.0624568> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.0008539, -7.1844030, -0.0624568>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.0008539, -7.1844030, -0.0624568>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.0008539, -7.1844030, -0.0624568>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.9300532, -5.2859052, 1.6656099> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.9300532, -5.2859052, 1.6656099>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.9300532, -5.2859052, 1.6656099>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.9300532, -5.2859052, 1.6656099>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.9300532, -5.2859052, 1.6656099>,
  <8.9068613, -5.0066160, 2.1485151>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9068613, -5.0066170, 2.1485151>,
  <8.8836695, -4.7273289, 2.6314202>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9300532, -5.2859052, 1.6656099>,
  <9.2739155, -5.0130248, 1.3203763>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.2739155, -5.0130248, 1.3203773>,
  <9.6177778, -4.7401443, 0.9751447>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.9300532, -5.2859052, 1.6656099>,
  <9.1465652, -5.7911546, 1.7642904>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <9.1465652, -5.7911536, 1.7642904>,
  <9.3630773, -6.2964021, 1.8629708>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.8724422, -5.9335642, 1.7792827> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.8724422, -5.9335642, 1.7792827>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.8724422, -5.9335642, 1.7792827>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.8724422, -5.9335642, 1.7792827>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.1264857, -4.3816627, 0.8938559> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.1264857, -4.3816627, 0.8938559>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.1264857, -4.3816627, 0.8938559>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.1264857, -4.3816627, 0.8938559>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.8836695, -4.7273289, 2.6314202> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.8836695, -4.7273289, 2.6314202>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.8836695, -4.7273289, 2.6314202>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.8836695, -4.7273289, 2.6314202>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.6177778, -4.7401443, 0.9751447> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.6177778, -4.7401443, 0.9751447>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.6177778, -4.7401443, 0.9751447>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.6177778, -4.7401443, 0.9751447>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.3630773, -6.2964021, 1.8629708> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.3630773, -6.2964021, 1.8629708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.3630773, -6.2964021, 1.8629708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.3630773, -6.2964021, 1.8629708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.9563186, -7.0955971, -2.6476124> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.9563186, -7.0955971, -2.6476124>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.9563186, -7.0955971, -2.6476124>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.9563186, -7.0955971, -2.6476124>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.9563186, -7.0955971, -2.6476124>,
  <4.9764394, -7.4716160, -3.3001120>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9764394, -7.4716150, -3.3001120>,
  <4.9965602, -7.8476329, -3.9526116>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9563186, -7.0955971, -2.6476124>,
  <4.6284614, -7.3574553, -2.2790723>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6284614, -7.3574553, -2.2790733>,
  <4.3006041, -7.6193136, -1.9105342>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9563186, -7.0955971, -2.6476124>,
  <4.7565251, -6.5796226, -2.7234131>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.7565251, -6.5796236, -2.7234131>,
  <4.5567316, -6.0636502, -2.7992137>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9965602, -7.8476329, -3.9526116> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.9965602, -7.8476329, -3.9526116>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.9965602, -7.8476329, -3.9526116>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.9965602, -7.8476329, -3.9526116>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.9965602, -7.8476329, -3.9526116>,
  <4.3074235, -7.9097028, -4.2599835>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3074245, -7.9097028, -4.2599835>,
  <3.6182887, -7.9717727, -4.5673553>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9965602, -7.8476329, -3.9526116>,
  <5.2099291, -8.3597194, -3.8686798>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.2099291, -8.3597184, -3.8686798>,
  <5.4232979, -8.8718038, -3.7847479>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9965602, -7.8476329, -3.9526116>,
  <5.3288258, -7.5764114, -4.3143344>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3288258, -7.5764114, -4.3143334>,
  <5.6610915, -7.3051898, -4.6760553>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.3006041, -7.6193136, -1.9105342> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.3006041, -7.6193136, -1.9105342>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.3006041, -7.6193136, -1.9105342>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.3006041, -7.6193136, -1.9105342>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.5567316, -6.0636502, -2.7992137> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.5567316, -6.0636502, -2.7992137>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.5567316, -6.0636502, -2.7992137>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.5567316, -6.0636502, -2.7992137>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.6182887, -7.9717727, -4.5673553> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.6182887, -7.9717727, -4.5673553>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.6182887, -7.9717727, -4.5673553>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.6182887, -7.9717727, -4.5673553>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.6182887, -7.9717727, -4.5673553>,
  <3.6384199, -8.3478254, -5.2198442>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6384199, -8.3478244, -5.2198442>,
  <3.6585510, -8.7238761, -5.8723330>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6182887, -7.9717727, -4.5673553>,
  <3.4049264, -7.4596999, -4.6512901>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4049264, -7.4597009, -4.6512901>,
  <3.1915640, -6.9476291, -4.7352248>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6182887, -7.9717727, -4.5673553>,
  <3.2771919, -8.2353297, -4.2082163>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.2771919, -8.2353297, -4.2082173>,
  <2.9360950, -8.4988868, -3.8490794>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.4232979, -8.8718038, -3.7847479> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.4232979, -8.8718038, -3.7847479>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.4232979, -8.8718038, -3.7847479>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.4232979, -8.8718038, -3.7847479>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.6610915, -7.3051898, -4.6760553> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.6610915, -7.3051898, -4.6760553>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.6610915, -7.3051898, -4.6760553>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.6610915, -7.3051898, -4.6760553>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.6585510, -8.7238761, -5.8723330> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.6585510, -8.7238761, -5.8723330>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.6585510, -8.7238761, -5.8723330>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.6585510, -8.7238761, -5.8723330>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.6585510, -8.7238761, -5.8723330>,
  <3.1458052, -8.7635842, -6.0897123>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1458062, -8.7635842, -6.0897123>,
  <2.6330613, -8.8032923, -6.3070917>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6585510, -8.7238761, -5.8723330>,
  <3.8584065, -9.2398175, -5.7964780>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8584065, -9.2398165, -5.7964780>,
  <4.0582620, -9.7557569, -5.7206231>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6585510, -8.7238761, -5.8723330>,
  <3.9865404, -8.4620407, -6.2407852>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.9865404, -8.4620407, -6.2407842>,
  <4.3145298, -8.2002052, -6.6092354>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1915640, -6.9476291, -4.7352248> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1915640, -6.9476291, -4.7352248>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1915640, -6.9476291, -4.7352248>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1915640, -6.9476291, -4.7352248>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.9360950, -8.4988868, -3.8490794> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.9360950, -8.4988868, -3.8490794>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.9360950, -8.4988868, -3.8490794>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.9360950, -8.4988868, -3.8490794>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.6330613, -8.8032923, -6.3070917> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.6330613, -8.8032923, -6.3070917>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.6330613, -8.8032923, -6.3070917>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.6330613, -8.8032923, -6.3070917>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.0582620, -9.7557569, -5.7206231> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.0582620, -9.7557569, -5.7206231>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.0582620, -9.7557569, -5.7206231>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.0582620, -9.7557569, -5.7206231>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.3145298, -8.2002052, -6.6092354> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.3145298, -8.2002052, -6.6092354>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.3145298, -8.2002052, -6.6092354>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.3145298, -8.2002052, -6.6092354>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.2895348, -6.8183074, 0.8524709> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-4.2895348, -6.8183074, 0.8524709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-4.2895348, -6.8183074, 0.8524709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-4.2895348, -6.8183074, 0.8524709>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.2895348, -6.8183074, 0.8524709>,
  <-4.4752523, -6.1284101, 0.8803441>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.4752523, -6.1284111, 0.8803441>,
  <-4.6609699, -5.4385148, 0.9082174>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.2895348, -6.8183074, 0.8524709>,
  <-3.9227910, -6.9907371, 1.4415321>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9227910, -6.9907371, 1.4415311>,
  <-3.5560473, -7.1631668, 2.0305914>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.6609699, -5.4385148, 0.9082174> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.6609699, -5.4385148, 0.9082174>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.6609699, -5.4385148, 0.9082174>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.6609699, -5.4385148, 0.9082174>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.6609699, -5.4385148, 0.9082174>,
  <-5.0486790, -5.2462602, 0.2915564>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.0486790, -5.2462602, 0.2915574>,
  <-5.4363881, -5.0540057, -0.3251027>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6609699, -5.4385148, 0.9082174>,
  <-4.9678844, -5.3569413, 1.3675987>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.9678844, -5.3569413, 1.3675977>,
  <-5.2747990, -5.2753677, 1.8269781>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.6609699, -5.4385148, 0.9082174>,
  <-4.1959388, -5.1324055, 0.9522121>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1959398, -5.1324055, 0.9522121>,
  <-3.7309097, -4.8262962, 0.9962068>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.4363881, -5.0540057, -0.3251027> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.4363881, -5.0540057, -0.3251027>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.4363881, -5.0540057, -0.3251027>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.4363881, -5.0540057, -0.3251027>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.4363881, -5.0540057, -0.3251027>,
  <-5.6403478, -4.3250216, -0.3101935>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6403478, -4.3250226, -0.3101935>,
  <-5.8443075, -3.5960395, -0.2952843>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4363881, -5.0540057, -0.3251027>,
  <-5.8947150, -5.3748676, -0.3673804>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8947140, -5.3748676, -0.3673804>,
  <-6.3530399, -5.6957294, -0.4096581>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4363881, -5.0540057, -0.3251027>,
  <-5.1192059, -5.1406428, -0.7797395>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1192059, -5.1406428, -0.7797385>,
  <-4.8020236, -5.2272799, -1.2343743>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.2747990, -5.2753677, 1.8269781> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.2747990, -5.2753677, 1.8269781>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.2747990, -5.2753677, 1.8269781>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.2747990, -5.2753677, 1.8269781>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.7309097, -4.8262962, 0.9962068> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.7309097, -4.8262962, 0.9962068>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.7309097, -4.8262962, 0.9962068>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.7309097, -4.8262962, 0.9962068>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.8443075, -3.5960395, -0.2952843> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.8443075, -3.5960395, -0.2952843>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.8443075, -3.5960395, -0.2952843>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.8443075, -3.5960395, -0.2952843>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.8443075, -3.5960395, -0.2952843>,
  <-6.2320476, -3.4038048, -0.9119414>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.2320476, -3.4038048, -0.9119404>,
  <-6.6197877, -3.2115701, -1.5285966>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8443075, -3.5960395, -0.2952843>,
  <-5.3859926, -3.2751845, -0.2530125>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3859936, -3.2751845, -0.2530125>,
  <-4.9276798, -2.9543294, -0.2107406>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8443075, -3.5960395, -0.2952843>,
  <-6.1557587, -3.4990513, 0.1612040>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.1557587, -3.4990513, 0.1612030>,
  <-6.4672100, -3.4020632, 0.6176902>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.3530399, -5.6957294, -0.4096581> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.3530399, -5.6957294, -0.4096581>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.3530399, -5.6957294, -0.4096581>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.3530399, -5.6957294, -0.4096581>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.8020236, -5.2272799, -1.2343743> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.8020236, -5.2272799, -1.2343743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.8020236, -5.2272799, -1.2343743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.8020236, -5.2272799, -1.2343743>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.6197877, -3.2115701, -1.5285966> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-6.6197877, -3.2115701, -1.5285966>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-6.6197877, -3.2115701, -1.5285966>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-6.6197877, -3.2115701, -1.5285966>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-6.6197877, -3.2115701, -1.5285966>,
  <-6.7647965, -2.6728284, -1.5069595>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.7647965, -2.6728294, -1.5069595>,
  <-6.9098054, -2.1340887, -1.4853225>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.6197877, -3.2115701, -1.5285966>,
  <-7.0847727, -3.5177522, -1.5725671>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.0847717, -3.5177522, -1.5725671>,
  <-7.5497557, -3.8239343, -1.6165377>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.6197877, -3.2115701, -1.5285966>,
  <-6.3128672, -3.2933025, -1.9879569>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.3128672, -3.2933025, -1.9879559>,
  <-6.0059467, -3.3750349, -2.4473152>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.9276798, -2.9543294, -0.2107406> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.9276798, -2.9543294, -0.2107406>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.9276798, -2.9543294, -0.2107406>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.9276798, -2.9543294, -0.2107406>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.4672100, -3.4020632, 0.6176902> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.4672100, -3.4020632, 0.6176902>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.4672100, -3.4020632, 0.6176902>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.4672100, -3.4020632, 0.6176902>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.9098054, -2.1340887, -1.4853225> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.9098054, -2.1340887, -1.4853225>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.9098054, -2.1340887, -1.4853225>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.9098054, -2.1340887, -1.4853225>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.5497557, -3.8239343, -1.6165377> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.5497557, -3.8239343, -1.6165377>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.5497557, -3.8239343, -1.6165377>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.5497557, -3.8239343, -1.6165377>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.0059467, -3.3750349, -2.4473152> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.0059467, -3.3750349, -2.4473152>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.0059467, -3.3750349, -2.4473152>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.0059467, -3.3750349, -2.4473152>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.5560473, -7.1631668, 2.0305914> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.5560473, -7.1631668, 2.0305914>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.5560473, -7.1631668, 2.0305914>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.5560473, -7.1631668, 2.0305914>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.5560473, -7.1631668, 2.0305914>,
  <-3.3549730, -7.8889380, 2.0111785>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.3549730, -7.8889370, 2.0111785>,
  <-3.1538988, -8.6147073, 1.9917657>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5560473, -7.1631668, 2.0305914>,
  <-3.1055893, -6.8344105, 2.0604118>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1055903, -6.8344105, 2.0604118>,
  <-2.6551332, -6.5056543, 2.0902323>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.5560473, -7.1631668, 2.0305914>,
  <-3.8777115, -7.0594611, 2.4751921>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.8777115, -7.0594611, 2.4751911>,
  <-4.1993756, -6.9557554, 2.9197908>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.1538988, -8.6147073, 1.9917657> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.1538988, -8.6147073, 1.9917657>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.1538988, -8.6147073, 1.9917657>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.1538988, -8.6147073, 1.9917657>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.1538988, -8.6147073, 1.9917657>,
  <-2.7641686, -8.8126616, 2.6099598>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.7641686, -8.8126616, 2.6099588>,
  <-2.3744383, -9.0106158, 3.2281519>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1538988, -8.6147073, 1.9917657>,
  <-2.8417885, -8.7118057, 1.5357372>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.8417885, -8.7118057, 1.5357382>,
  <-2.5296782, -8.8089041, 1.0797108>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1538988, -8.6147073, 1.9917657>,
  <-3.6134736, -8.9351093, 1.9611238>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.6134726, -8.9351093, 1.9611238>,
  <-4.0730464, -9.2555113, 1.9304820>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.6551332, -6.5056543, 2.0902323> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.6551332, -6.5056543, 2.0902323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.6551332, -6.5056543, 2.0902323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.6551332, -6.5056543, 2.0902323>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1993756, -6.9557554, 2.9197908> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.1993756, -6.9557554, 2.9197908>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.1993756, -6.9557554, 2.9197908>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.1993756, -6.9557554, 2.9197908>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.3744383, -9.0106158, 3.2281519> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-2.3744383, -9.0106158, 3.2281519>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-2.3744383, -9.0106158, 3.2281519>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-2.3744383, -9.0106158, 3.2281519>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-2.3744383, -9.0106158, 3.2281519>,
  <-2.1733404, -9.7363876, 3.2087113>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1733404, -9.7363866, 3.2087113>,
  <-1.9722426, -10.4621574, 3.1892707>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3744383, -9.0106158, 3.2281519>,
  <-2.6865415, -8.9135248, 3.6841699>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.6865415, -8.9135248, 3.6841689>,
  <-2.9986448, -8.8164338, 4.1401858>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.3744383, -9.0106158, 3.2281519>,
  <-1.9165890, -8.6891148, 3.2705940>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9165900, -8.6891148, 3.2705940>,
  <-1.4587417, -8.3676139, 3.3130361>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.5296782, -8.8089041, 1.0797108> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.5296782, -8.8089041, 1.0797108>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.5296782, -8.8089041, 1.0797108>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.5296782, -8.8089041, 1.0797108>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.0730464, -9.2555113, 1.9304820> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.0730464, -9.2555113, 1.9304820>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.0730464, -9.2555113, 1.9304820>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.0730464, -9.2555113, 1.9304820>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.9722426, -10.4621574, 3.1892707> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.9722426, -10.4621574, 3.1892707>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.9722426, -10.4621574, 3.1892707>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.9722426, -10.4621574, 3.1892707>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.9722426, -10.4621574, 3.1892707>,
  <-1.6859106, -10.5969242, 3.6492601>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6859106, -10.5969242, 3.6492591>,
  <-1.3995786, -10.7316910, 4.1092475>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9722426, -10.4621574, 3.1892707>,
  <-1.6506321, -10.5658120, 2.7446200>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.6506321, -10.5658120, 2.7446210>,
  <-1.3290216, -10.6694666, 2.2999714>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.9722426, -10.4621574, 3.1892707>,
  <-2.4227425, -10.7908578, 3.1593051>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.4227415, -10.7908578, 3.1593051>,
  <-2.8732404, -11.1195582, 3.1293395>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-2.9986448, -8.8164338, 4.1401858> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.9986448, -8.8164338, 4.1401858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.9986448, -8.8164338, 4.1401858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.9986448, -8.8164338, 4.1401858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.4587417, -8.3676139, 3.3130361> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.4587417, -8.3676139, 3.3130361>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.4587417, -8.3676139, 3.3130361>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.4587417, -8.3676139, 3.3130361>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.3995786, -10.7316910, 4.1092475> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.3995786, -10.7316910, 4.1092475>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.3995786, -10.7316910, 4.1092475>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.3995786, -10.7316910, 4.1092475>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.3290216, -10.6694666, 2.2999714> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.3290216, -10.6694666, 2.2999714>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.3290216, -10.6694666, 2.2999714>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.3290216, -10.6694666, 2.2999714>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.8732404, -11.1195582, 3.1293395> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.8732404, -11.1195582, 3.1293395>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.8732404, -11.1195582, 3.1293395>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.8732404, -11.1195582, 3.1293395>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.1453941, 0.2918874, 7.8981619> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-7.1453941, 0.2918874, 7.8981619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-7.1453941, 0.2918874, 7.8981619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-7.1453941, 0.2918874, 7.8981619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.1453941, 0.2918874, 7.8981619>,
  <-6.4909329, 0.0041694, 7.8869603>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.4909339, 0.0041694, 7.8869603>,
  <-5.8364736, -0.2835485, 7.8757586>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.1453941, 0.2918874, 7.8981619>,
  <-7.2972600, 0.5646062, 7.2548996>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.2972600, 0.5646052, 7.2548996>,
  <-7.4491260, 0.8373230, 6.6116374>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.8364736, -0.2835485, 7.8757586> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.8364736, -0.2835485, 7.8757586>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.8364736, -0.2835485, 7.8757586>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.8364736, -0.2835485, 7.8757586>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.8364736, -0.2835485, 7.8757586>,
  <-5.6664103, -0.5744588, 8.5495540>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.6664103, -0.5744578, 8.5495540>,
  <-5.4963470, -0.8653671, 9.2233494>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8364736, -0.2835485, 7.8757586>,
  <-5.8243657, -0.6788673, 7.4814761>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8243657, -0.6788663, 7.4814761>,
  <-5.8122577, -1.0741840, 7.0871936>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8364736, -0.2835485, 7.8757586>,
  <-5.4711820, 0.1147569, 7.7350215>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4711820, 0.1147559, 7.7350215>,
  <-5.1058904, 0.5130603, 7.5942844>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.4963470, -0.8653671, 9.2233494> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.4963470, -0.8653671, 9.2233494>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.4963470, -0.8653671, 9.2233494>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.4963470, -0.8653671, 9.2233494>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.4963470, -0.8653671, 9.2233494>,
  <-4.8050792, -1.1741925, 9.2272582>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.8050802, -1.1741925, 9.2272582>,
  <-4.1138133, -1.4830180, 9.2311670>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4963470, -0.8653671, 9.2233494>,
  <-5.8753793, -1.2552933, 9.3615334>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.8753793, -1.2552923, 9.3615334>,
  <-6.2544116, -1.6452175, 9.4997174>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.4963470, -0.8653671, 9.2233494>,
  <-5.5122864, -0.4602025, 9.6111543>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.5122864, -0.4602035, 9.6111543>,
  <-5.5282259, -0.0550400, 9.9989592>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.8122577, -1.0741840, 7.0871936> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.8122577, -1.0741840, 7.0871936>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.8122577, -1.0741840, 7.0871936>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.8122577, -1.0741840, 7.0871936>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.1058904, 0.5130603, 7.5942844> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.1058904, 0.5130603, 7.5942844>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.1058904, 0.5130603, 7.5942844>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.1058904, 0.5130603, 7.5942844>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.1138133, -1.4830180, 9.2311670> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.1138133, -1.4830180, 9.2311670>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.1138133, -1.4830180, 9.2311670>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.1138133, -1.4830180, 9.2311670>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.1138133, -1.4830180, 9.2311670>,
  <-3.9437735, -1.7739555, 9.9049654>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.9437735, -1.7739545, 9.9049654>,
  <-3.7737338, -2.0648910, 10.5787639>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1138133, -1.4830180, 9.2311670>,
  <-3.7347890, -1.0931012, 9.0929910>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7347890, -1.0931022, 9.0929910>,
  <-3.3557646, -0.7031864, 8.9548151>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1138133, -1.4830180, 9.2311670>,
  <-4.0869410, -1.8844904, 8.8401581>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.0869410, -1.8844894, 8.8401581>,
  <-4.0600686, -2.2859609, 8.4491492>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.2544116, -1.6452175, 9.4997174> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.2544116, -1.6452175, 9.4997174>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.2544116, -1.6452175, 9.4997174>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.2544116, -1.6452175, 9.4997174>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.5282259, -0.0550400, 9.9989592> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.5282259, -0.0550400, 9.9989592>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.5282259, -0.0550400, 9.9989592>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.5282259, -0.0550400, 9.9989592>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.7737338, -2.0648910, 10.5787639> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.7737338, -2.0648910, 10.5787639>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.7737338, -2.0648910, 10.5787639>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.7737338, -2.0648910, 10.5787639>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.7737338, -2.0648910, 10.5787639>,
  <-3.2626546, -2.2895290, 10.5701393>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.2626556, -2.2895290, 10.5701393>,
  <-2.7515774, -2.5141670, 10.5615147>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7737338, -2.0648910, 10.5787639>,
  <-4.1390918, -2.4631460, 10.7194700>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.1390918, -2.4631450, 10.7194700>,
  <-4.5044499, -2.8613990, 10.8601761>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7737338, -2.0648910, 10.5787639>,
  <-3.7859997, -1.6695469, 10.9730283>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.7859997, -1.6695479, 10.9730283>,
  <-3.7982657, -1.2742049, 11.3672927>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-3.3557646, -0.7031864, 8.9548151> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.3557646, -0.7031864, 8.9548151>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.3557646, -0.7031864, 8.9548151>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.3557646, -0.7031864, 8.9548151>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.0600686, -2.2859609, 8.4491492> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.0600686, -2.2859609, 8.4491492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.0600686, -2.2859609, 8.4491492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.0600686, -2.2859609, 8.4491492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.7515774, -2.5141670, 10.5615147> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.7515774, -2.5141670, 10.5615147>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.7515774, -2.5141670, 10.5615147>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.7515774, -2.5141670, 10.5615147>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.5044499, -2.8613990, 10.8601761> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.5044499, -2.8613990, 10.8601761>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.5044499, -2.8613990, 10.8601761>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.5044499, -2.8613990, 10.8601761>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.7982657, -1.2742049, 11.3672927> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.7982657, -1.2742049, 11.3672927>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.7982657, -1.2742049, 11.3672927>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.7982657, -1.2742049, 11.3672927>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.4491260, 0.8373230, 6.6116374> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-7.4491260, 0.8373230, 6.6116374>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-7.4491260, 0.8373230, 6.6116374>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-7.4491260, 0.8373230, 6.6116374>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.4491260, 0.8373230, 6.6116374>,
  <-8.1373713, 1.1437037, 6.6126085>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.1373703, 1.1437037, 6.6126085>,
  <-8.8256146, 1.4500843, 6.6135796>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.4491260, 0.8373230, 6.6116374>,
  <-7.0626979, 1.2207426, 6.4869591>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.0626989, 1.2207426, 6.4869591>,
  <-6.6762719, 1.6041621, 6.3622809>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.4491260, 0.8373230, 6.6116374>,
  <-7.4163825, 0.4271363, 6.2340567>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.4163825, 0.4271373, 6.2340567>,
  <-7.3836391, 0.0169516, 5.8564761>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-8.8256146, 1.4500843, 6.6135796> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-8.8256146, 1.4500843, 6.6135796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-8.8256146, 1.4500843, 6.6135796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-8.8256146, 1.4500843, 6.6135796>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-8.8256146, 1.4500843, 6.6135796>,
  <-9.0011152, 1.7435176, 5.9380538>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.0011152, 1.7435166, 5.9380538>,
  <-9.1766158, 2.0369489, 5.2625279>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.8256146, 1.4500843, 6.6135796>,
  <-8.8525293, 1.8521280, 7.0040149>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.8525293, 1.8521270, 7.0040149>,
  <-8.8794441, 2.2541697, 7.3944502>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.8256146, 1.4500843, 6.6135796>,
  <-9.2050142, 1.0567223, 6.7405735>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.2050142, 1.0567233, 6.7405735>,
  <-9.5844138, 0.6633623, 6.8675673>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-6.6762719, 1.6041621, 6.3622809> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.6762719, 1.6041621, 6.3622809>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.6762719, 1.6041621, 6.3622809>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.6762719, 1.6041621, 6.3622809>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.3836391, 0.0169516, 5.8564761> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.3836391, 0.0169516, 5.8564761>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.3836391, 0.0169516, 5.8564761>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.3836391, 0.0169516, 5.8564761>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.1766158, 2.0369489, 5.2625279> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.1766158, 2.0369489, 5.2625279>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.1766158, 2.0369489, 5.2625279>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.1766158, 2.0369489, 5.2625279>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.1766158, 2.0369489, 5.2625279>,
  <-9.8648568, 2.3433577, 5.2635220>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.8648558, 2.3433577, 5.2635220>,
  <-10.5530958, 2.6497666, 5.2645161>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.1766158, 2.0369489, 5.2625279>,
  <-9.1497069, 1.6349151, 4.8721024>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.1497069, 1.6349161, 4.8721024>,
  <-9.1227979, 1.2328833, 4.4816769>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.1766158, 2.0369489, 5.2625279>,
  <-8.7970279, 2.4262866, 5.1242562>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.7970279, 2.4262856, 5.1242562>,
  <-8.4174399, 2.8156224, 4.9859846>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-8.8794441, 2.2541697, 7.3944502> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.8794441, 2.2541697, 7.3944502>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.8794441, 2.2541697, 7.3944502>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.8794441, 2.2541697, 7.3944502>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.5844138, 0.6633623, 6.8675673> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.5844138, 0.6633623, 6.8675673>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.5844138, 0.6633623, 6.8675673>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.5844138, 0.6633623, 6.8675673>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.5530958, 2.6497666, 5.2645161> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-10.5530958, 2.6497666, 5.2645161>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-10.5530958, 2.6497666, 5.2645161>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-10.5530958, 2.6497666, 5.2645161>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-10.5530958, 2.6497666, 5.2645161>,
  <-10.6718104, 2.8626954, 4.7622156>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.6718104, 2.8626944, 4.7622156>,
  <-10.7905250, 3.0756222, 4.2599151>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.5530958, 2.6497666, 5.2645161>,
  <-10.5857943, 3.0599029, 5.6421549>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.5857943, 3.0599019, 5.6421549>,
  <-10.6184928, 3.4700372, 6.0197937>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.5530958, 2.6497666, 5.2645161>,
  <-10.9394671, 2.2663252, 5.3893434>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.9394661, 2.2663252, 5.3893434>,
  <-11.3258363, 1.8828839, 5.5141708>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.1227979, 1.2328833, 4.4816769> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.1227979, 1.2328833, 4.4816769>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.1227979, 1.2328833, 4.4816769>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.1227979, 1.2328833, 4.4816769>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.4174399, 2.8156224, 4.9859846> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.4174399, 2.8156224, 4.9859846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.4174399, 2.8156224, 4.9859846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.4174399, 2.8156224, 4.9859846>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.7905250, 3.0756222, 4.2599151> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.7905250, 3.0756222, 4.2599151>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.7905250, 3.0756222, 4.2599151>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.7905250, 3.0756222, 4.2599151>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.6184928, 3.4700372, 6.0197937> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.6184928, 3.4700372, 6.0197937>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.6184928, 3.4700372, 6.0197937>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.6184928, 3.4700372, 6.0197937>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-11.3258363, 1.8828839, 5.5141708> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-11.3258363, 1.8828839, 5.5141708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-11.3258363, 1.8828839, 5.5141708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-11.3258363, 1.8828839, 5.5141708>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.5854045, -0.2288597, 5.7916767> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <5.5854045, -0.2288597, 5.7916767>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <5.5854045, -0.2288597, 5.7916767>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <5.5854045, -0.2288597, 5.7916767>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.5854045, -0.2288597, 5.7916767>,
  <5.3603851, -0.6177145, 6.3478996>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3603851, -0.6177135, 6.3478996>,
  <5.1353656, -1.0065673, 6.9041224>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.5854045, -0.2288597, 5.7916767>,
  <6.0582795, 0.2580156, 6.0165485>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.0582795, 0.2580146, 6.0165485>,
  <6.5311545, 0.7448888, 6.2414203>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<5.1353656, -1.0065673, 6.9041224> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <5.1353656, -1.0065673, 6.9041224>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <5.1353656, -1.0065673, 6.9041224>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <5.1353656, -1.0065673, 6.9041224>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <5.1353656, -1.0065673, 6.9041224>,
  <4.6362764, -1.5235277, 6.6778198>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6362764, -1.5235267, 6.6778198>,
  <4.1371872, -2.0404860, 6.4515172>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.1353656, -1.0065673, 6.9041224>,
  <5.5790397, -1.2505710, 7.1397017>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.5790387, -1.2505710, 7.1397017>,
  <6.0227118, -1.4945747, 7.3752809>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.1353656, -1.0065673, 6.9041224>,
  <4.9060605, -0.6618665, 7.2789461>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9060605, -0.6618675, 7.2789461>,
  <4.6767555, -0.3171677, 7.6537698>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.1371872, -2.0404860, 6.4515172> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.1371872, -2.0404860, 6.4515172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.1371872, -2.0404860, 6.4515172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.1371872, -2.0404860, 6.4515172>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.1371872, -2.0404860, 6.4515172>,
  <3.8892260, -2.4607900, 7.0303943>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.8892260, -2.4607890, 7.0303943>,
  <3.6412647, -2.8810921, 7.6092713>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.1371872, -2.0404860, 6.4515172>,
  <4.3724946, -2.3739647, 6.0665175>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3724946, -2.3739637, 6.0665175>,
  <4.6078019, -2.7074413, 5.6815177>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.1371872, -2.0404860, 6.4515172>,
  <3.6968393, -1.7845468, 6.2161575>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6968403, -1.7845468, 6.2161575>,
  <3.2564934, -1.5286075, 5.9807978>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.0227118, -1.4945747, 7.3752809> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.0227118, -1.4945747, 7.3752809>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.0227118, -1.4945747, 7.3752809>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.0227118, -1.4945747, 7.3752809>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.6767555, -0.3171677, 7.6537698> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.6767555, -0.3171677, 7.6537698>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.6767555, -0.3171677, 7.6537698>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.6767555, -0.3171677, 7.6537698>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.6412647, -2.8810921, 7.6092713> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <3.6412647, -2.8810921, 7.6092713>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <3.6412647, -2.8810921, 7.6092713>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <3.6412647, -2.8810921, 7.6092713>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.6412647, -2.8810921, 7.6092713>,
  <3.1421952, -3.3980746, 7.3829479>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.1421952, -3.3980736, 7.3829479>,
  <2.6431257, -3.9150550, 7.1566244>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6412647, -2.8810921, 7.6092713>,
  <3.4059578, -2.5476235, 7.9942605>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4059578, -2.5476245, 7.9942605>,
  <3.1706510, -2.2141569, 8.3792498>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.6412647, -2.8810921, 7.6092713>,
  <4.0770239, -3.1346766, 7.8554396>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.0770229, -3.1346766, 7.8554396>,
  <4.5127811, -3.3882611, 8.1016079>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.6078019, -2.7074413, 5.6815177> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.6078019, -2.7074413, 5.6815177>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.6078019, -2.7074413, 5.6815177>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.6078019, -2.7074413, 5.6815177>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.2564934, -1.5286075, 5.9807978> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.2564934, -1.5286075, 5.9807978>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.2564934, -1.5286075, 5.9807978>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.2564934, -1.5286075, 5.9807978>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.6431257, -3.9150550, 7.1566244> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.6431257, -3.9150550, 7.1566244>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.6431257, -3.9150550, 7.1566244>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.6431257, -3.9150550, 7.1566244>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.6431257, -3.9150550, 7.1566244>,
  <2.4672924, -4.2187148, 7.5909185>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4672924, -4.2187138, 7.5909185>,
  <2.2914590, -4.5223727, 8.0252125>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6431257, -3.9150550, 7.1566244>,
  <2.8724698, -4.2596856, 6.7817613>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8724698, -4.2596846, 6.7817613>,
  <3.1018139, -4.6043142, 6.4068982>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6431257, -3.9150550, 7.1566244>,
  <2.1995375, -3.6709920, 6.9209232>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.1995385, -3.6709920, 6.9209232>,
  <1.7559513, -3.4269290, 6.6852220>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1706510, -2.2141569, 8.3792498> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1706510, -2.2141569, 8.3792498>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1706510, -2.2141569, 8.3792498>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1706510, -2.2141569, 8.3792498>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.5127811, -3.3882611, 8.1016079> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.5127811, -3.3882611, 8.1016079>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.5127811, -3.3882611, 8.1016079>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.5127811, -3.3882611, 8.1016079>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2914590, -4.5223727, 8.0252125> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.2914590, -4.5223727, 8.0252125>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.2914590, -4.5223727, 8.0252125>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.2914590, -4.5223727, 8.0252125>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.1018139, -4.6043142, 6.4068982> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1018139, -4.6043142, 6.4068982>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1018139, -4.6043142, 6.4068982>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1018139, -4.6043142, 6.4068982>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.7559513, -3.4269290, 6.6852220> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.7559513, -3.4269290, 6.6852220>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.7559513, -3.4269290, 6.6852220>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.7559513, -3.4269290, 6.6852220>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.5311545, 0.7448888, 6.2414203> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.5311545, 0.7448888, 6.2414203>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.5311545, 0.7448888, 6.2414203>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.5311545, 0.7448888, 6.2414203>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.5311545, 0.7448888, 6.2414203>,
  <6.7746952, 1.1607927, 5.6624014>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7746952, 1.1607917, 5.6624014>,
  <7.0182359, 1.5766945, 5.0833825>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5311545, 0.7448888, 6.2414203>,
  <6.2840204, 1.0666157, 6.6252148>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2840204, 1.0666147, 6.6252148>,
  <6.0368863, 1.3883405, 7.0090093>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5311545, 0.7448888, 6.2414203>,
  <6.9567582, 0.4778188, 6.4851980>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9567572, 0.4778188, 6.4851980>,
  <7.3823599, 0.2107487, 6.7289757>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.0182359, 1.5766945, 5.0833825> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <7.0182359, 1.5766945, 5.0833825>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <7.0182359, 1.5766945, 5.0833825>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <7.0182359, 1.5766945, 5.0833825>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <7.0182359, 1.5766945, 5.0833825>,
  <7.5205485, 2.0975885, 5.3060715>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5205485, 2.0975875, 5.3060715>,
  <8.0228612, 2.6184806, 5.5287606>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.0182359, 1.5766945, 5.0833825>,
  <6.5827282, 1.8309995, 4.8374862>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5827292, 1.8309995, 4.8374862>,
  <6.1472225, 2.0853044, 4.5915900>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.0182359, 1.5766945, 5.0833825>,
  <7.2636198, 1.2436550, 4.7043355>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.2636198, 1.2436560, 4.7043355>,
  <7.5090038, 0.9106175, 4.3252885>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.0368863, 1.3883405, 7.0090093> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.0368863, 1.3883405, 7.0090093>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.0368863, 1.3883405, 7.0090093>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.0368863, 1.3883405, 7.0090093>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.3823599, 0.2107487, 6.7289757> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.3823599, 0.2107487, 6.7289757>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.3823599, 0.2107487, 6.7289757>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.3823599, 0.2107487, 6.7289757>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.0228612, 2.6184806, 5.5287606> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.0228612, 2.6184806, 5.5287606>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.0228612, 2.6184806, 5.5287606>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.0228612, 2.6184806, 5.5287606>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.0228612, 2.6184806, 5.5287606>,
  <8.2663717, 3.0344021, 4.9497317>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.2663717, 3.0344011, 4.9497317>,
  <8.5098823, 3.4503216, 4.3707029>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.0228612, 2.6184806, 5.5287606>,
  <8.4583612, 2.3641826, 5.7746465>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.4583602, 2.3641826, 5.7746465>,
  <8.8938592, 2.1098846, 6.0205325>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.0228612, 2.6184806, 5.5287606>,
  <7.7875505, 2.9513337, 5.9142825>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.7875505, 2.9513327, 5.9142825>,
  <7.5522398, 3.2841848, 6.2998044>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<6.1472225, 2.0853044, 4.5915900> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.1472225, 2.0853044, 4.5915900>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.1472225, 2.0853044, 4.5915900>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.1472225, 2.0853044, 4.5915900>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.5090038, 0.9106175, 4.3252885> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.5090038, 0.9106175, 4.3252885>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.5090038, 0.9106175, 4.3252885>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.5090038, 0.9106175, 4.3252885>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.5098823, 3.4503216, 4.3707029> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <8.5098823, 3.4503216, 4.3707029>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <8.5098823, 3.4503216, 4.3707029>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <8.5098823, 3.4503216, 4.3707029>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <8.5098823, 3.4503216, 4.3707029>,
  <8.8792105, 3.8305042, 4.5461911>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.8792105, 3.8305032, 4.5461911>,
  <9.2485388, 4.2106849, 4.7216793>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.5098823, 3.4503216, 4.3707029>,
  <8.0842293, 3.7173182, 4.1269318>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.0842303, 3.7173182, 4.1269318>,
  <7.6585783, 3.9843148, 3.8831607>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.5098823, 3.4503216, 4.3707029>,
  <8.7568806, 3.1285164, 3.9868740>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <8.7568806, 3.1285174, 3.9868740>,
  <9.0038789, 2.8067131, 3.6030451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<8.8938592, 2.1098846, 6.0205325> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.8938592, 2.1098846, 6.0205325>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.8938592, 2.1098846, 6.0205325>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.8938592, 2.1098846, 6.0205325>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.5522398, 3.2841848, 6.2998044> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.5522398, 3.2841848, 6.2998044>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.5522398, 3.2841848, 6.2998044>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.5522398, 3.2841848, 6.2998044>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.2485388, 4.2106849, 4.7216793> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.2485388, 4.2106849, 4.7216793>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.2485388, 4.2106849, 4.7216793>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.2485388, 4.2106849, 4.7216793>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<7.6585783, 3.9843148, 3.8831607> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.6585783, 3.9843148, 3.8831607>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.6585783, 3.9843148, 3.8831607>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.6585783, 3.9843148, 3.8831607>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<9.0038789, 2.8067131, 3.6030451> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <9.0038789, 2.8067131, 3.6030451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <9.0038789, 2.8067131, 3.6030451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <9.0038789, 2.8067131, 3.6030451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2573980, 5.7767342, 4.5549788> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <2.2573980, 5.7767342, 4.5549788>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <2.2573980, 5.7767342, 4.5549788>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <2.2573980, 5.7767342, 4.5549788>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.2573980, 5.7767342, 4.5549788>,
  <2.4541897, 6.0610219, 3.9291360>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4541897, 6.0610209, 3.9291360>,
  <2.6509814, 6.3453077, 3.3032933>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.2573980, 5.7767342, 4.5549788>,
  <1.5442406, 5.7823955, 4.6059760>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.5442416, 5.7823955, 4.6059760>,
  <0.8310852, 5.7880568, 4.6569733>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.6509814, 6.3453077, 3.3032933> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.6509814, 6.3453077, 3.3032933>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.6509814, 6.3453077, 3.3032933>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.6509814, 6.3453077, 3.3032933>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.6509814, 6.3453077, 3.3032933>,
  <3.4016056, 6.3438904, 3.2391591>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.4016046, 6.3438904, 3.2391591>,
  <4.1522278, 6.3424732, 3.1750248>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6509814, 6.3453077, 3.3032933>,
  <2.4173817, 6.0471202, 2.8929313>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4173817, 6.0471212, 2.8929313>,
  <2.1837820, 5.7489348, 2.4825694>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6509814, 6.3453077, 3.3032933>,
  <2.4516863, 6.8662894, 3.2758782>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.4516863, 6.8662884, 3.2758782>,
  <2.2523913, 7.3872692, 3.2484631>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.1522278, 6.3424732, 3.1750248> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.1522278, 6.3424732, 3.1750248>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.1522278, 6.3424732, 3.1750248>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.1522278, 6.3424732, 3.1750248>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.1522278, 6.3424732, 3.1750248>,
  <4.3763245, 6.6410662, 2.5163430>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3763245, 6.6410652, 2.5163430>,
  <4.6004212, 6.9396572, 1.8576612>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.1522278, 6.3424732, 3.1750248>,
  <4.3440322, 5.8168078, 3.2161323>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3440322, 5.8168088, 3.2161323>,
  <4.5358366, 5.2911444, 3.2572398>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.1522278, 6.3424732, 3.1750248>,
  <4.3759108, 6.6438120, 3.5921170>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3759108, 6.6438110, 3.5921170>,
  <4.5995938, 6.9451488, 4.0092091>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<2.1837820, 5.7489348, 2.4825694> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.1837820, 5.7489348, 2.4825694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.1837820, 5.7489348, 2.4825694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.1837820, 5.7489348, 2.4825694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.2523913, 7.3872692, 3.2484631> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.2523913, 7.3872692, 3.2484631>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.2523913, 7.3872692, 3.2484631>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.2523913, 7.3872692, 3.2484631>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.6004212, 6.9396572, 1.8576612> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.6004212, 6.9396572, 1.8576612>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.6004212, 6.9396572, 1.8576612>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.6004212, 6.9396572, 1.8576612>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.6004212, 6.9396572, 1.8576612>,
  <5.3510526, 6.9382050, 1.7935250>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.3510516, 6.9382050, 1.7935250>,
  <6.1016821, 6.9367528, 1.7293887>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6004212, 6.9396572, 1.8576612>,
  <4.4086260, 7.4653118, 1.8165556>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4086260, 7.4653108, 1.8165556>,
  <4.2168307, 7.9909644, 1.7754499>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6004212, 6.9396572, 1.8576612>,
  <4.3744227, 6.6484763, 1.4346624>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.3744227, 6.6484773, 1.4346624>,
  <4.1484242, 6.3572974, 1.0116635>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.5358366, 5.2911444, 3.2572398> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.5358366, 5.2911444, 3.2572398>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.5358366, 5.2911444, 3.2572398>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.5358366, 5.2911444, 3.2572398>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.5995938, 6.9451488, 4.0092091> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.5995938, 6.9451488, 4.0092091>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.5995938, 6.9451488, 4.0092091>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.5995938, 6.9451488, 4.0092091>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.1016821, 6.9367528, 1.7293887> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.1016821, 6.9367528, 1.7293887>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.1016821, 6.9367528, 1.7293887>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.1016821, 6.9367528, 1.7293887>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.1016821, 6.9367528, 1.7293887>,
  <6.2554592, 7.1588010, 1.2407330>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.2554592, 7.1588000, 1.2407330>,
  <6.4092363, 7.3808472, 0.7520773>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.1016821, 6.9367528, 1.7293887>,
  <6.3009208, 6.4157529, 1.7568711>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.3009208, 6.4157539, 1.7568711>,
  <6.5001595, 5.8947549, 1.7843534>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.1016821, 6.9367528, 1.7293887>,
  <6.3352306, 7.2348396, 2.1398654>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.3352306, 7.2348386, 2.1398654>,
  <6.5687790, 7.5329244, 2.5503420>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.2168307, 7.9909644, 1.7754499> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.2168307, 7.9909644, 1.7754499>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.2168307, 7.9909644, 1.7754499>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.2168307, 7.9909644, 1.7754499>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.1484242, 6.3572974, 1.0116635> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.1484242, 6.3572974, 1.0116635>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.1484242, 6.3572974, 1.0116635>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.1484242, 6.3572974, 1.0116635>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.4092363, 7.3808472, 0.7520773> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.4092363, 7.3808472, 0.7520773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.4092363, 7.3808472, 0.7520773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.4092363, 7.3808472, 0.7520773>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.5001595, 5.8947549, 1.7843534> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.5001595, 5.8947549, 1.7843534>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.5001595, 5.8947549, 1.7843534>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.5001595, 5.8947549, 1.7843534>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.5687790, 7.5329244, 2.5503420> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.5687790, 7.5329244, 2.5503420>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.5687790, 7.5329244, 2.5503420>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.5687790, 7.5329244, 2.5503420>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.8310852, 5.7880568, 4.6569733> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.8310852, 5.7880568, 4.6569733>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.8310852, 5.7880568, 4.6569733>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.8310852, 5.7880568, 4.6569733>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.8310852, 5.7880568, 4.6569733>,
  <0.6128438, 5.4905374, 5.3137865>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6128438, 5.4905384, 5.3137865>,
  <0.3946024, 5.1930200, 5.9705997>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8310852, 5.7880568, 4.6569733>,
  <0.6552331, 6.3161579, 4.6115058>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6552331, 6.3161569, 4.6115058>,
  <0.4793810, 6.8442571, 4.5660384>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8310852, 5.7880568, 4.6569733>,
  <0.6214338, 5.4967011, 4.2291296>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6214338, 5.4967021, 4.2291296>,
  <0.4117824, 5.2053475, 3.8012860>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.3946024, 5.1930200, 5.9705997> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.3946024, 5.1930200, 5.9705997>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.3946024, 5.1930200, 5.9705997>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.3946024, 5.1930200, 5.9705997>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.3946024, 5.1930200, 5.9705997>,
  <-0.3593929, 5.1919755, 6.0393710>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.3593919, 5.1919755, 6.0393710>,
  <-1.1133863, 5.1909310, 6.1081422>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3946024, 5.1930200, 5.9705997>,
  <0.6198726, 5.4844949, 6.3937999>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6198726, 5.4844939, 6.3937999>,
  <0.8451428, 5.7759679, 6.8170000>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.3946024, 5.1930200, 5.9705997>,
  <0.5770880, 4.6636114, 6.0056818>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5770880, 4.6636124, 6.0056818>,
  <0.7595736, 4.1342047, 6.0407638>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.4793810, 6.8442571, 4.5660384> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.4793810, 6.8442571, 4.5660384>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.4793810, 6.8442571, 4.5660384>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.4793810, 6.8442571, 4.5660384>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.4117824, 5.2053475, 3.8012860> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.4117824, 5.2053475, 3.8012860>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.4117824, 5.2053475, 3.8012860>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.4117824, 5.2053475, 3.8012860>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.1133863, 5.1909310, 6.1081422> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.1133863, 5.1909310, 6.1081422>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.1133863, 5.1909310, 6.1081422>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.1133863, 5.1909310, 6.1081422>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.1133863, 5.1909310, 6.1081422>,
  <-1.3316152, 4.8934357, 6.7649794>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3316152, 4.8934367, 6.7649794>,
  <-1.5498441, 4.5959425, 7.4218165>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1133863, 5.1909310, 6.1081422>,
  <-1.3386520, 4.8994590, 5.6849559>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3386520, 4.8994600, 5.6849559>,
  <-1.5639176, 4.6079889, 5.2617696>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1133863, 5.1909310, 6.1081422>,
  <-1.3049828, 5.7165978, 6.0662471>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3049828, 5.7165968, 6.0662471>,
  <-1.4965793, 6.2422626, 6.0243519>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.8451428, 5.7759679, 6.8170000> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.8451428, 5.7759679, 6.8170000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.8451428, 5.7759679, 6.8170000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.8451428, 5.7759679, 6.8170000>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.7595736, 4.1342047, 6.0407638> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.7595736, 4.1342047, 6.0407638>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.7595736, 4.1342047, 6.0407638>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.7595736, 4.1342047, 6.0407638>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.5498441, 4.5959425, 7.4218165> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-1.5498441, 4.5959425, 7.4218165>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-1.5498441, 4.5959425, 7.4218165>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-1.5498441, 4.5959425, 7.4218165>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-1.5498441, 4.5959425, 7.4218165>,
  <-2.1067360, 4.6002505, 7.4617041>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-2.1067350, 4.6002505, 7.4617041>,
  <-2.6636260, 4.6045586, 7.5015917>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5498441, 4.5959425, 7.4218165>,
  <-1.3401147, 4.8873037, 7.8496176>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3401147, 4.8873027, 7.8496176>,
  <-1.1303853, 5.1786629, 8.2774187>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.5498441, 4.5959425, 7.4218165>,
  <-1.3738372, 4.0678833, 7.4672847>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.3738372, 4.0678843, 7.4672847>,
  <-1.1978302, 3.5398261, 7.5127529>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-1.5639176, 4.6079889, 5.2617696> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.5639176, 4.6079889, 5.2617696>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.5639176, 4.6079889, 5.2617696>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.5639176, 4.6079889, 5.2617696>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.4965793, 6.2422626, 6.0243519> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.4965793, 6.2422626, 6.0243519>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.4965793, 6.2422626, 6.0243519>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.4965793, 6.2422626, 6.0243519>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.6636260, 4.6045586, 7.5015917> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.6636260, 4.6045586, 7.5015917>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.6636260, 4.6045586, 7.5015917>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.6636260, 4.6045586, 7.5015917>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.1303853, 5.1786629, 8.2774187> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.1303853, 5.1786629, 8.2774187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.1303853, 5.1786629, 8.2774187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.1303853, 5.1786629, 8.2774187>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.1978302, 3.5398261, 7.5127529> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.1978302, 3.5398261, 7.5127529>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.1978302, 3.5398261, 7.5127529>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.1978302, 3.5398261, 7.5127529>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<3.0754532, 6.1756322, -7.8758356> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <3.0754532, 6.1756322, -7.8758356>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <3.0754532, 6.1756322, -7.8758356>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <3.0754532, 6.1756322, -7.8758356>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <3.0754532, 6.1756322, -7.8758356>,
  <3.7642672, 6.0173672, -7.7676037>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.7642662, 6.0173672, -7.7676037>,
  <4.4530791, 5.8591023, -7.6593719>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <3.0754532, 6.1756322, -7.8758356>,
  <2.8275596, 5.7966182, -8.4291193>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8275596, 5.7966192, -8.4291193>,
  <2.5796661, 5.4176062, -8.9824030>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.4530791, 5.8591023, -7.6593719> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.4530791, 5.8591023, -7.6593719>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.4530791, 5.8591023, -7.6593719>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.4530791, 5.8591023, -7.6593719>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.4530791, 5.8591023, -7.6593719>,
  <4.7243870, 6.2533685, -7.0775673>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.7243870, 6.2533675, -7.0775673>,
  <4.9956949, 6.6476327, -6.4957628>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4530791, 5.8591023, -7.6593719>,
  <4.4949124, 5.3106703, -7.5626510>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4949124, 5.3106713, -7.5626510>,
  <4.5367456, 4.7622404, -7.4659301>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.4530791, 5.8591023, -7.6593719>,
  <4.7363355, 5.9762376, -8.1262095>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.7363355, 5.9762376, -8.1262085>,
  <5.0195919, 6.0933729, -8.5930451>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.9956949, 6.6476327, -6.4957628> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <4.9956949, 6.6476327, -6.4957628>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <4.9956949, 6.6476327, -6.4957628>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <4.9956949, 6.6476327, -6.4957628>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <4.9956949, 6.6476327, -6.4957628>,
  <5.7253786, 6.4906519, -6.3686473>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <5.7253776, 6.4906519, -6.3686473>,
  <6.4550603, 6.3336711, -6.2415319>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9956949, 6.6476327, -6.4957628>,
  <4.6973642, 6.5328461, -6.0346494>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.6973642, 6.5328461, -6.0346504>,
  <4.3990335, 6.4180594, -5.5735381>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9956949, 6.6476327, -6.4957628>,
  <4.9479614, 7.1962176, -6.6033805>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <4.9479614, 7.1962166, -6.6033805>,
  <4.9002279, 7.7448006, -6.7109983>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.5367456, 4.7622404, -7.4659301> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.5367456, 4.7622404, -7.4659301>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.5367456, 4.7622404, -7.4659301>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.5367456, 4.7622404, -7.4659301>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<5.0195919, 6.0933729, -8.5930451> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <5.0195919, 6.0933729, -8.5930451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <5.0195919, 6.0933729, -8.5930451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <5.0195919, 6.0933729, -8.5930451>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.4550603, 6.3336711, -6.2415319> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.4550603, 6.3336711, -6.2415319>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.4550603, 6.3336711, -6.2415319>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.4550603, 6.3336711, -6.2415319>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.4550603, 6.3336711, -6.2415319>,
  <6.7263501, 6.7279239, -5.6596990>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7263501, 6.7279229, -5.6596990>,
  <6.9976398, 7.1221747, -5.0778662>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.4550603, 6.3336711, -6.2415319>,
  <6.7533862, 6.4484592, -6.7026316>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7533862, 6.4484592, -6.7026306>,
  <7.0517121, 6.5632472, -7.1637293>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.4550603, 6.3336711, -6.2415319>,
  <6.5126793, 5.7847660, -6.1406678>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.5126793, 5.7847670, -6.1406678>,
  <6.5702983, 5.2358628, -6.0398036>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<4.3990335, 6.4180594, -5.5735381> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.3990335, 6.4180594, -5.5735381>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.3990335, 6.4180594, -5.5735381>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.3990335, 6.4180594, -5.5735381>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<4.9002279, 7.7448006, -6.7109983> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <4.9002279, 7.7448006, -6.7109983>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <4.9002279, 7.7448006, -6.7109983>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <4.9002279, 7.7448006, -6.7109983>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.9976398, 7.1221747, -5.0778662> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <6.9976398, 7.1221747, -5.0778662>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <6.9976398, 7.1221747, -5.0778662>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <6.9976398, 7.1221747, -5.0778662>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <6.9976398, 7.1221747, -5.0778662>,
  <7.5355486, 6.9987105, -4.9933146>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <7.5355476, 6.9987105, -4.9933146>,
  <8.0734553, 6.8752462, -4.9087631>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9976398, 7.1221747, -5.0778662>,
  <6.7143070, 7.0050415, -4.6110745>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.7143070, 7.0050415, -4.6110755>,
  <6.4309742, 6.8879083, -4.1442849>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9976398, 7.1221747, -5.0778662>,
  <6.9556459, 7.6706028, -5.1745885>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <6.9556459, 7.6706018, -5.1745885>,
  <6.9136520, 8.2190288, -5.2713109>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<7.0517121, 6.5632472, -7.1637293> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <7.0517121, 6.5632472, -7.1637293>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <7.0517121, 6.5632472, -7.1637293>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <7.0517121, 6.5632472, -7.1637293>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.5702983, 5.2358628, -6.0398036> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.5702983, 5.2358628, -6.0398036>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.5702983, 5.2358628, -6.0398036>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.5702983, 5.2358628, -6.0398036>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<8.0734553, 6.8752462, -4.9087631> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <8.0734553, 6.8752462, -4.9087631>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <8.0734553, 6.8752462, -4.9087631>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <8.0734553, 6.8752462, -4.9087631>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.4309742, 6.8879083, -4.1442849> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.4309742, 6.8879083, -4.1442849>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.4309742, 6.8879083, -4.1442849>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.4309742, 6.8879083, -4.1442849>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<6.9136520, 8.2190288, -5.2713109> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <6.9136520, 8.2190288, -5.2713109>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <6.9136520, 8.2190288, -5.2713109>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <6.9136520, 8.2190288, -5.2713109>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.5796661, 5.4176062, -8.9824030> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <2.5796661, 5.4176062, -8.9824030>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <2.5796661, 5.4176062, -8.9824030>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <2.5796661, 5.4176062, -8.9824030>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <2.5796661, 5.4176062, -8.9824030>,
  <1.8537629, 5.5772897, -9.1053549>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.8537639, 5.5772897, -9.1053549>,
  <1.1278618, 5.7369732, -9.2283067>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5796661, 5.4176062, -8.9824030>,
  <2.8874640, 5.5399980, -9.4320282>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.8874640, 5.5399980, -9.4320272>,
  <3.1952620, 5.6623898, -9.8816515>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.5796661, 5.4176062, -8.9824030>,
  <2.6456014, 4.8749605, -8.8680338>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <2.6456014, 4.8749615, -8.8680338>,
  <2.7115368, 4.3323167, -8.7536646>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.1278618, 5.7369732, -9.2283067> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <1.1278618, 5.7369732, -9.2283067>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <1.1278618, 5.7369732, -9.2283067>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <1.1278618, 5.7369732, -9.2283067>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <1.1278618, 5.7369732, -9.2283067>,
  <0.8506543, 5.3425936, -9.8121389>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8506543, 5.3425946, -9.8121389>,
  <0.5734469, 4.9482161, -10.3959712>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.1278618, 5.7369732, -9.2283067>,
  <1.0700613, 6.2857272, -9.3299463>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.0700613, 6.2857262, -9.3299463>,
  <1.0122609, 6.8344792, -9.4315858>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <1.1278618, 5.7369732, -9.2283067>,
  <0.8287685, 5.6110113, -8.7706144>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8287685, 5.6110113, -8.7706154>,
  <0.5296752, 5.4850494, -8.3129242>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<3.1952620, 5.6623898, -9.8816515> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <3.1952620, 5.6623898, -9.8816515>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <3.1952620, 5.6623898, -9.8816515>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <3.1952620, 5.6623898, -9.8816515>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<2.7115368, 4.3323167, -8.7536646> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <2.7115368, 4.3323167, -8.7536646>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <2.7115368, 4.3323167, -8.7536646>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <2.7115368, 4.3323167, -8.7536646>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.5734469, 4.9482161, -10.3959712> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <0.5734469, 4.9482161, -10.3959712>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <0.5734469, 4.9482161, -10.3959712>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <0.5734469, 4.9482161, -10.3959712>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <0.5734469, 4.9482161, -10.3959712>,
  <-0.1524548, 5.1079343, -10.5189339>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.1524538, 5.1079343, -10.5189339>,
  <-0.8783544, 5.2676525, -10.6418966>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5734469, 4.9482161, -10.3959712>,
  <0.6312415, 4.3994751, -10.2943333>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.6312415, 4.3994761, -10.2943333>,
  <0.6890361, 3.8507362, -10.1926955>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.5734469, 4.9482161, -10.3959712>,
  <0.8724121, 5.0626091, -10.8567582>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <0.8724121, 5.0626091, -10.8567572>,
  <1.1713773, 5.1770022, -11.3175433>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<1.0122609, 6.8344792, -9.4315858> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.0122609, 6.8344792, -9.4315858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.0122609, 6.8344792, -9.4315858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.0122609, 6.8344792, -9.4315858>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<0.5296752, 5.4850494, -8.3129242> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.5296752, 5.4850494, -8.3129242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.5296752, 5.4850494, -8.3129242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.5296752, 5.4850494, -8.3129242>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-0.8783544, 5.2676525, -10.6418966> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-0.8783544, 5.2676525, -10.6418966>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-0.8783544, 5.2676525, -10.6418966>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-0.8783544, 5.2676525, -10.6418966>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-0.8783544, 5.2676525, -10.6418966>,
  <-1.0720470, 4.9716751, -11.0738903>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.0720470, 4.9716761, -11.0738903>,
  <-1.2657395, 4.6756997, -11.5058841>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.8783544, 5.2676525, -10.6418966>,
  <-0.9442315, 5.8103189, -10.7562008>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.9442315, 5.8103179, -10.7562008>,
  <-1.0101085, 6.3529833, -10.8705051>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-0.8783544, 5.2676525, -10.6418966>,
  <-1.1860798, 5.1453721, -10.1921803>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-1.1860798, 5.1453721, -10.1921813>,
  <-1.4938051, 5.0230917, -9.7424661>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<0.6890361, 3.8507362, -10.1926955> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <0.6890361, 3.8507362, -10.1926955>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <0.6890361, 3.8507362, -10.1926955>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <0.6890361, 3.8507362, -10.1926955>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<1.1713773, 5.1770022, -11.3175433> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <1.1713773, 5.1770022, -11.3175433>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <1.1713773, 5.1770022, -11.3175433>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <1.1713773, 5.1770022, -11.3175433>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.2657395, 4.6756997, -11.5058841> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.2657395, 4.6756997, -11.5058841>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.2657395, 4.6756997, -11.5058841>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.2657395, 4.6756997, -11.5058841>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.0101085, 6.3529833, -10.8705051> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.0101085, 6.3529833, -10.8705051>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.0101085, 6.3529833, -10.8705051>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.0101085, 6.3529833, -10.8705051>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-1.4938051, 5.0230917, -9.7424661> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-1.4938051, 5.0230917, -9.7424661>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-1.4938051, 5.0230917, -9.7424661>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-1.4938051, 5.0230917, -9.7424661>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.2336039, -7.3108384, -1.9283362> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-7.2336039, -7.3108384, -1.9283362>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-7.2336039, -7.3108384, -1.9283362>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-7.2336039, -7.3108384, -1.9283362>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.2336039, -7.3108384, -1.9283362>,
  <-7.9210783, -7.2794437, -1.7343778>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.9210773, -7.2794437, -1.7343778>,
  <-8.6085507, -7.2480490, -1.5404193>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.2336039, -7.3108384, -1.9283362>,
  <-7.0361578, -7.9945301, -1.9976670>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.0361578, -7.9945291, -1.9976670>,
  <-6.8387117, -8.6782198, -2.0669977>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-8.6085507, -7.2480490, -1.5404193> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-8.6085507, -7.2480490, -1.5404193>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-8.6085507, -7.2480490, -1.5404193>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-8.6085507, -7.2480490, -1.5404193>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-8.6085507, -7.2480490, -1.5404193>,
  <-8.8271404, -6.5310754, -1.4647947>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.8271404, -6.5310764, -1.4647947>,
  <-9.0457301, -5.8141038, -1.3891701>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.6085507, -7.2480490, -1.5404193>,
  <-8.9136400, -7.5072614, -1.9297927>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.9136400, -7.5072614, -1.9297917>,
  <-9.2187294, -7.7664737, -2.3191640>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.6085507, -7.2480490, -1.5404193>,
  <-8.6686495, -7.5243946, -1.0588455>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.6686495, -7.5243936, -1.0588455>,
  <-8.7287484, -7.8007383, -0.5772717>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.0457301, -5.8141038, -1.3891701> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.0457301, -5.8141038, -1.3891701>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.0457301, -5.8141038, -1.3891701>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.0457301, -5.8141038, -1.3891701>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.0457301, -5.8141038, -1.3891701>,
  <-9.7727344, -5.7644861, -1.1836424>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.7727334, -5.7644861, -1.1836424>,
  <-10.4997368, -5.7148683, -0.9781147>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.0457301, -5.8141038, -1.3891701>,
  <-8.9701470, -5.5417674, -1.8738578>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.9701470, -5.5417684, -1.8738578>,
  <-8.8945639, -5.2694329, -2.3585454>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.0457301, -5.8141038, -1.3891701>,
  <-8.7325143, -5.5637290, -0.9967243>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.7325143, -5.5637290, -0.9967253>,
  <-8.4192985, -5.3133542, -0.6042804>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.2187294, -7.7664737, -2.3191640> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.2187294, -7.7664737, -2.3191640>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.2187294, -7.7664737, -2.3191640>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.2187294, -7.7664737, -2.3191640>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.7287484, -7.8007383, -0.5772717> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.7287484, -7.8007383, -0.5772717>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.7287484, -7.8007383, -0.5772717>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.7287484, -7.8007383, -0.5772717>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.4997368, -5.7148683, -0.9781147> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-10.4997368, -5.7148683, -0.9781147>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-10.4997368, -5.7148683, -0.9781147>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-10.4997368, -5.7148683, -0.9781147>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-10.4997368, -5.7148683, -0.9781147>,
  <-10.7183251, -4.9978824, -0.9025241>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.7183251, -4.9978834, -0.9025241>,
  <-10.9369133, -4.2808984, -0.8269335>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.4997368, -5.7148683, -0.9781147>,
  <-10.5753189, -5.9871938, -0.4934363>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.5753189, -5.9871928, -0.4934363>,
  <-10.6509010, -6.2595174, -0.0087579>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.4997368, -5.7148683, -0.9781147>,
  <-10.8196482, -5.9701127, -1.3619076>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.8196482, -5.9701127, -1.3619066>,
  <-11.1395597, -6.2253571, -1.7456985>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-8.8945639, -5.2694329, -2.3585454> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.8945639, -5.2694329, -2.3585454>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.8945639, -5.2694329, -2.3585454>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.8945639, -5.2694329, -2.3585454>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.4192985, -5.3133542, -0.6042804> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.4192985, -5.3133542, -0.6042804>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.4192985, -5.3133542, -0.6042804>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.4192985, -5.3133542, -0.6042804>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.9369133, -4.2808984, -0.8269335> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-10.9369133, -4.2808984, -0.8269335>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-10.9369133, -4.2808984, -0.8269335>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-10.9369133, -4.2808984, -0.8269335>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-10.9369133, -4.2808984, -0.8269335>,
  <-11.4737280, -4.2562781, -0.6754015>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-11.4737270, -4.2562781, -0.6754015>,
  <-12.0105407, -4.2316577, -0.5238694>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.9369133, -4.2808984, -0.8269335>,
  <-10.8767354, -4.0045925, -1.3085195>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.8767354, -4.0045935, -1.3085195>,
  <-10.8165574, -3.7282886, -1.7901055>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.9369133, -4.2808984, -0.8269335>,
  <-10.6316876, -4.0216995, -0.4376452>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.6316876, -4.0216995, -0.4376462>,
  <-10.3264619, -3.7625006, -0.0483589>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-10.6509010, -6.2595174, -0.0087579> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.6509010, -6.2595174, -0.0087579>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.6509010, -6.2595174, -0.0087579>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.6509010, -6.2595174, -0.0087579>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-11.1395597, -6.2253571, -1.7456985> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-11.1395597, -6.2253571, -1.7456985>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-11.1395597, -6.2253571, -1.7456985>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-11.1395597, -6.2253571, -1.7456985>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-12.0105407, -4.2316577, -0.5238694> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-12.0105407, -4.2316577, -0.5238694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-12.0105407, -4.2316577, -0.5238694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-12.0105407, -4.2316577, -0.5238694>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.8165574, -3.7282886, -1.7901055> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.8165574, -3.7282886, -1.7901055>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.8165574, -3.7282886, -1.7901055>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.8165574, -3.7282886, -1.7901055>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.3264619, -3.7625006, -0.0483589> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.3264619, -3.7625006, -0.0483589>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.3264619, -3.7625006, -0.0483589>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.3264619, -3.7625006, -0.0483589>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.8387117, -8.6782198, -2.0669977> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-6.8387117, -8.6782198, -2.0669977>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-6.8387117, -8.6782198, -2.0669977>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-6.8387117, -8.6782198, -2.0669977>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-6.8387117, -8.6782198, -2.0669977>,
  <-6.1148925, -8.7226629, -2.2711089>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.1148935, -8.7226629, -2.2711089>,
  <-5.3910753, -8.7671061, -2.4752200>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.8387117, -8.6782198, -2.0669977>,
  <-6.9221952, -8.9362490, -1.5788041>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.9221952, -8.9362480, -1.5788041>,
  <-7.0056787, -9.1942762, -1.0906104>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-6.8387117, -8.6782198, -2.0669977>,
  <-7.1666981, -8.9184749, -2.4498744>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.1666981, -8.9184749, -2.4498734>,
  <-7.4946845, -9.1587300, -2.8327492>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.3910753, -8.7671061, -2.4752200> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-5.3910753, -8.7671061, -2.4752200>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-5.3910753, -8.7671061, -2.4752200>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-5.3910753, -8.7671061, -2.4752200>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-5.3910753, -8.7671061, -2.4752200>,
  <-5.1669415, -9.4861173, -2.5528534>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.1669415, -9.4861163, -2.5528534>,
  <-4.9428078, -10.2051265, -2.6304867>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3910753, -8.7671061, -2.4752200>,
  <-5.0708596, -8.5125750, -2.0911904>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.0708596, -8.5125750, -2.0911914>,
  <-4.7506440, -8.2580439, -1.7071627>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3910753, -8.7671061, -2.4752200>,
  <-5.3188338, -8.5043877, -2.9656946>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.3188338, -8.5043887, -2.9656946>,
  <-5.2465922, -8.2416714, -3.4561692>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-7.0056787, -9.1942762, -1.0906104> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.0056787, -9.1942762, -1.0906104>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.0056787, -9.1942762, -1.0906104>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.0056787, -9.1942762, -1.0906104>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.4946845, -9.1587300, -2.8327492> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.4946845, -9.1587300, -2.8327492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.4946845, -9.1587300, -2.8327492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.4946845, -9.1587300, -2.8327492>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-4.9428078, -10.2051265, -2.6304867> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-4.9428078, -10.2051265, -2.6304867>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-4.9428078, -10.2051265, -2.6304867>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-4.9428078, -10.2051265, -2.6304867>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-4.9428078, -10.2051265, -2.6304867>,
  <-4.2189707, -10.2495569, -2.8345689>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.2189717, -10.2495569, -2.8345689>,
  <-3.4951356, -10.2939872, -3.0386511>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.9428078, -10.2051265, -2.6304867>,
  <-5.2630111, -10.4596513, -3.0145102>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.2630111, -10.4596513, -3.0145092>,
  <-5.5832144, -10.7141761, -3.3985317>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-4.9428078, -10.2051265, -2.6304867>,
  <-5.0191958, -10.4774088, -2.1459080>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-5.0191958, -10.4774078, -2.1459080>,
  <-5.0955838, -10.7496892, -1.6613292>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-4.7506440, -8.2580439, -1.7071627> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-4.7506440, -8.2580439, -1.7071627>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-4.7506440, -8.2580439, -1.7071627>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-4.7506440, -8.2580439, -1.7071627>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.2465922, -8.2416714, -3.4561692> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.2465922, -8.2416714, -3.4561692>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.2465922, -8.2416714, -3.4561692>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.2465922, -8.2416714, -3.4561692>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.4951356, -10.2939872, -3.0386511> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-3.4951356, -10.2939872, -3.0386511>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-3.4951356, -10.2939872, -3.0386511>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-3.4951356, -10.2939872, -3.0386511>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-3.4951356, -10.2939872, -3.0386511>,
  <-3.3408749, -10.8278409, -3.0928891>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.3408749, -10.8278399, -3.0928891>,
  <-3.1866142, -11.3616926, -3.1471271>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4951356, -10.2939872, -3.0386511>,
  <-3.1672079, -10.0536649, -2.6557665>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.1672079, -10.0536649, -2.6557675>,
  <-2.8392801, -9.8133425, -2.2728839>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4951356, -10.2939872, -3.0386511>,
  <-3.4116900, -10.0358135, -3.5267852>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-3.4116900, -10.0358145, -3.5267852>,
  <-3.3282444, -9.7776417, -4.0149193>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-5.5832144, -10.7141761, -3.3985317> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.5832144, -10.7141761, -3.3985317>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.5832144, -10.7141761, -3.3985317>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.5832144, -10.7141761, -3.3985317>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-5.0955838, -10.7496892, -1.6613292> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-5.0955838, -10.7496892, -1.6613292>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-5.0955838, -10.7496892, -1.6613292>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-5.0955838, -10.7496892, -1.6613292>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.1866142, -11.3616926, -3.1471271> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.1866142, -11.3616926, -3.1471271>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.1866142, -11.3616926, -3.1471271>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.1866142, -11.3616926, -3.1471271>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-2.8392801, -9.8133425, -2.2728839> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-2.8392801, -9.8133425, -2.2728839>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-2.8392801, -9.8133425, -2.2728839>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-2.8392801, -9.8133425, -2.2728839>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-3.3282444, -9.7776417, -4.0149193> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-3.3282444, -9.7776417, -4.0149193>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-3.3282444, -9.7776417, -4.0149193>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-3.3282444, -9.7776417, -4.0149193>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.6567293, -0.1384891, -1.9828896> 0.2737500
   pigment{color rgbt <1.0,0.0,0.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.274, 0.011 rotate <90,0,0> translate <-8.6567293, -0.1384891, -1.9828896>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,0> translate <-8.6567293, -0.1384891, -1.9828896>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.274, 0.005 rotate <-30,0,90> translate <-8.6567293, -0.1384891, -1.9828896>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-8.6567293, -0.1384891, -1.9828896>,
  <-9.2002251, -0.4562486, -2.3218097>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.2002241, -0.4562486, -2.3218097>,
  <-9.7437189, -0.7740081, -2.6607299>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.6567293, -0.1384891, -1.9828896>,
  <-8.9049427, 0.2160762, -1.4137676>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.9049427, 0.2160752, -1.4137676>,
  <-9.1531561, 0.5706395, -0.8446456>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.7437189, -0.7740081, -2.6607299> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.7437189, -0.7740081, -2.6607299>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.7437189, -0.7740081, -2.6607299>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.7437189, -0.7740081, -2.6607299>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.7437189, -0.7740081, -2.6607299>,
  <-9.4927510, -1.1511731, -3.2626539>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.4927510, -1.1511721, -3.2626539>,
  <-9.2417830, -1.5283362, -3.8645779>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.7437189, -0.7740081, -2.6607299>,
  <-9.9967895, -1.1198645, -2.3026508>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.9967895, -1.1198635, -2.3026508>,
  <-10.2498601, -1.4657188, -1.9445718>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.7437189, -0.7740081, -2.6607299>,
  <-10.1103934, -0.3812152, -2.8129004>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.1103934, -0.3812162, -2.8129004>,
  <-10.4770679, 0.0115757, -2.9650710>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.2417830, -1.5283362, -3.8645779> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.2417830, -1.5283362, -3.8645779>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.2417830, -1.5283362, -3.8645779>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.2417830, -1.5283362, -3.8645779>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.2417830, -1.5283362, -3.8645779>,
  <-9.8067193, -1.8707181, -4.2345247>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.8067183, -1.8707181, -4.2345247>,
  <-10.3716536, -2.2131000, -4.6044714>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.2417830, -1.5283362, -3.8645779>,
  <-8.8652729, -1.9118080, -3.7033574>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.8652729, -1.9118070, -3.7033574>,
  <-8.4887628, -2.2952779, -3.5421369>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.2417830, -1.5283362, -3.8645779>,
  <-8.9891508, -1.1717505, -4.2164707>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.9891508, -1.1717515, -4.2164707>,
  <-8.7365186, -0.8151669, -4.5683636>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-10.2498601, -1.4657188, -1.9445718> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.2498601, -1.4657188, -1.9445718>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.2498601, -1.4657188, -1.9445718>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.2498601, -1.4657188, -1.9445718>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.4770679, 0.0115757, -2.9650710> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.4770679, 0.0115757, -2.9650710>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.4770679, 0.0115757, -2.9650710>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.4770679, 0.0115757, -2.9650710>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.3716536, -2.2131000, -4.6044714> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-10.3716536, -2.2131000, -4.6044714>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-10.3716536, -2.2131000, -4.6044714>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-10.3716536, -2.2131000, -4.6044714>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-10.3716536, -2.2131000, -4.6044714>,
  <-10.1206656, -2.5902913, -5.2063800>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.1206656, -2.5902903, -5.2063800>,
  <-9.8696776, -2.9674806, -5.8082885>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.3716536, -2.2131000, -4.6044714>,
  <-10.7481532, -1.8296382, -4.7656924>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.7481532, -1.8296392, -4.7656924>,
  <-11.1246529, -1.4461784, -4.9269134>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.3716536, -2.2131000, -4.6044714>,
  <-10.6348999, -2.5662087, -4.2569006>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.6348999, -2.5662077, -4.2569006>,
  <-10.8981463, -2.9193154, -3.9093298>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-8.4887628, -2.2952779, -3.5421369> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.4887628, -2.2952779, -3.5421369>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.4887628, -2.2952779, -3.5421369>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.4887628, -2.2952779, -3.5421369>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.7365186, -0.8151669, -4.5683636> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-8.7365186, -0.8151669, -4.5683636>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-8.7365186, -0.8151669, -4.5683636>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-8.7365186, -0.8151669, -4.5683636>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.8696776, -2.9674806, -5.8082885> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.8696776, -2.9674806, -5.8082885>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.8696776, -2.9674806, -5.8082885>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.8696776, -2.9674806, -5.8082885>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.8696776, -2.9674806, -5.8082885>,
  <-10.2940283, -3.2155933, -6.0730609>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-10.2940273, -3.2155933, -6.0730609>,
  <-10.7183770, -3.4637061, -6.3378333>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.8696776, -2.9674806, -5.8082885>,
  <-9.5029661, -3.3602162, -5.6560612>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.5029661, -3.3602152, -5.6560612>,
  <-9.1362546, -3.7529497, -5.5038339>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.8696776, -2.9674806, -5.8082885>,
  <-9.6164891, -2.6215894, -6.1662643>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.6164891, -2.6215904, -6.1662643>,
  <-9.3633007, -2.2757002, -6.5242400>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-11.1246529, -1.4461784, -4.9269134> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-11.1246529, -1.4461784, -4.9269134>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-11.1246529, -1.4461784, -4.9269134>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-11.1246529, -1.4461784, -4.9269134>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.8981463, -2.9193154, -3.9093298> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.8981463, -2.9193154, -3.9093298>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.8981463, -2.9193154, -3.9093298>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.8981463, -2.9193154, -3.9093298>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-10.7183770, -3.4637061, -6.3378333> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-10.7183770, -3.4637061, -6.3378333>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-10.7183770, -3.4637061, -6.3378333>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-10.7183770, -3.4637061, -6.3378333>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.1362546, -3.7529497, -5.5038339> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.1362546, -3.7529497, -5.5038339>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.1362546, -3.7529497, -5.5038339>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.1362546, -3.7529497, -5.5038339>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.3633007, -2.2757002, -6.5242400> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.3633007, -2.2757002, -6.5242400>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.3633007, -2.2757002, -6.5242400>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.3633007, -2.2757002, -6.5242400>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.1531561, 0.5706395, -0.8446456> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-9.1531561, 0.5706395, -0.8446456>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-9.1531561, 0.5706395, -0.8446456>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-9.1531561, 0.5706395, -0.8446456>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-9.1531561, 0.5706395, -0.8446456>,
  <-8.5878585, 0.9098627, -0.4800675>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.5878595, 0.9098627, -0.4800675>,
  <-8.0225630, 1.2490859, -0.1154895>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.1531561, 0.5706395, -0.8446456>,
  <-9.5278757, 0.9456768, -1.0201864>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.5278757, 0.9456758, -1.0201864>,
  <-9.9025953, 1.3207121, -1.1957273>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.1531561, 0.5706395, -0.8446456>,
  <-9.4134889, 0.2069938, -0.5101601>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-9.4134889, 0.2069948, -0.5101601>,
  <-9.6738217, -0.1566498, -0.1756745>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-8.0225630, 1.2490859, -0.1154895> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-8.0225630, 1.2490859, -0.1154895>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-8.0225630, 1.2490859, -0.1154895>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-8.0225630, 1.2490859, -0.1154895>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-8.0225630, 1.2490859, -0.1154895>,
  <-8.2700854, 1.6292385, 0.4906912>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.2700854, 1.6292375, 0.4906912>,
  <-8.5176078, 2.0093891, 1.0968720>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.0225630, 1.2490859, -0.1154895>,
  <-7.7596041, 1.6028314, -0.4626491>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.7596041, 1.6028304, -0.4626491>,
  <-7.4966451, 1.9565748, -0.8098087>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.0225630, 1.2490859, -0.1154895>,
  <-7.6524398, 0.8635538, 0.0553289>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.6524398, 0.8635548, 0.0553289>,
  <-7.2823165, 0.4780237, 0.2261473>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.9025953, 1.3207121, -1.1957273> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.9025953, 1.3207121, -1.1957273>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.9025953, 1.3207121, -1.1957273>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.9025953, 1.3207121, -1.1957273>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.6738217, -0.1566498, -0.1756745> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.6738217, -0.1566498, -0.1756745>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.6738217, -0.1566498, -0.1756745>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.6738217, -0.1566498, -0.1756745>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-8.5176078, 2.0093891, 1.0968720> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-8.5176078, 2.0093891, 1.0968720>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-8.5176078, 2.0093891, 1.0968720>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-8.5176078, 2.0093891, 1.0968720>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-8.5176078, 2.0093891, 1.0968720>,
  <-7.9522996, 2.3486377, 1.4614265>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.9523006, 2.3486377, 1.4614265>,
  <-7.3869934, 2.6878863, 1.8259810>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.5176078, 2.0093891, 1.0968720>,
  <-8.7805563, 1.6556532, 1.4440265>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.7805563, 1.6556542, 1.4440265>,
  <-9.0435047, 1.3019192, 1.7911810>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.5176078, 2.0093891, 1.0968720>,
  <-8.8946355, 2.3922589, 0.9354700>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-8.8946355, 2.3922579, 0.9354700>,
  <-9.2716632, 2.7751267, 0.7740681>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-7.4966451, 1.9565748, -0.8098087> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.4966451, 1.9565748, -0.8098087>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.4966451, 1.9565748, -0.8098087>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.4966451, 1.9565748, -0.8098087>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.2823165, 0.4780237, 0.2261473> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.2823165, 0.4780237, 0.2261473>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.2823165, 0.4780237, 0.2261473>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.2823165, 0.4780237, 0.2261473>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.3869934, 2.6878863, 1.8259810> 0.2887500
   pigment{color rgbt <0.8,0.8,0.8,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.289, 0.011 rotate <90,0,0> translate <-7.3869934, 2.6878863, 1.8259810>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,0> translate <-7.3869934, 2.6878863, 1.8259810>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.289, 0.005 rotate <-30,0,90> translate <-7.3869934, 2.6878863, 1.8259810>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
cylinder{
  <-7.3869934, 2.6878863, 1.8259810>,
  <-7.5807118, 2.9647326, 2.2704662>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.5807118, 2.9647316, 2.2704662>,
  <-7.7744302, 3.2415768, 2.7149513>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.3869934, 2.6878863, 1.8259810>,
  <-7.1266643, 3.0514724, 1.4914283>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.1266643, 3.0514714, 1.4914283>,
  <-6.8663353, 3.4150565, 1.1568756>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.3869934, 2.6878863, 1.8259810>,
  <-7.0122328, 2.3128064, 2.0013715>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
cylinder{
  <-7.0122328, 2.3128074, 2.0013715>,
  <-6.6374723, 1.9377284, 2.1767619>, 0.090
  pigment{color rgbt <0.00,0.00,0.00,0.80>}
  finish{F_normal}
 no_shadow 
 }
sphere {<-9.0435047, 1.3019192, 1.7911810> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.0435047, 1.3019192, 1.7911810>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.0435047, 1.3019192, 1.7911810>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.0435047, 1.3019192, 1.7911810>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-9.2716632, 2.7751267, 0.7740681> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-9.2716632, 2.7751267, 0.7740681>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-9.2716632, 2.7751267, 0.7740681>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-9.2716632, 2.7751267, 0.7740681>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-7.7744302, 3.2415768, 2.7149513> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-7.7744302, 3.2415768, 2.7149513>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-7.7744302, 3.2415768, 2.7149513>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-7.7744302, 3.2415768, 2.7149513>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.8663353, 3.4150565, 1.1568756> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.8663353, 3.4150565, 1.1568756>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.8663353, 3.4150565, 1.1568756>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.8663353, 3.4150565, 1.1568756>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
sphere {<-6.6374723, 1.9377284, 2.1767619> 0.1500000
   pigment{color rgbt <1.0,1.0,1.0,0.80>}
   finish{F_normal}
   no_shadow
}
torus {0.150, 0.011 rotate <90,0,0> translate <-6.6374723, 1.9377284, 2.1767619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,0> translate <-6.6374723, 1.9377284, 2.1767619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
torus {0.150, 0.005 rotate <-30,0,90> translate <-6.6374723, 1.9377284, 2.1767619>
   pigment{color rgbt <0.00,0.00,0.00,0.80>}
   finish{F_flat}
   no_shadow}
 no_shadow }
