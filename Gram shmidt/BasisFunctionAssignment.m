clc ;
close All ;
T = 120 ;
t = 0 : 1/5000 : 200 ;
y1 = RectSignal(t,0,T/3);
y2 = RectSignal(t,0,2*T/3);
y3 = RectSignal(t,T/3,T);
y4 = RectSignal(t,0,T);
y_total = [y1;y2;y3;y4] ;
[time , basis_total] = BasisGenerator(t,y_total);
DrawConstellation(basis_total , y_total);

