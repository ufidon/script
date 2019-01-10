:: from http://www.bluffton.edu/homepages/facstaff/nesterd/batch-examples.html#zipcode.txt
set thisdigit=
if %1==1 set thisdigit=...II
if %1==2 set thisdigit=..I.I
if %1==3 set thisdigit=..II.
if %1==4 set thisdigit=.I..I
if %1==5 set thisdigit=.I.I.
if %1==6 set thisdigit=.II..
if %1==7 set thisdigit=I...I
if %1==8 set thisdigit=I..I.
if %1==9 set thisdigit=I.I..
if %1==0 set thisdigit=II...
if _%thisdigit%==_ set ziperror=YES
set digits=%digits%%thisdigit%