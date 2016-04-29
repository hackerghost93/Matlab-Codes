clc ;
close All ;
T = 120 ;
t = 0 : 1/5000 : 200 ;
y1 = RectSignal(t,0,T/3);
y2 = RectSignal(t,0,2*T/3);
y3 = RectSignal(t,T/3,T);
y4 = RectSignal(t,0,T);
y_total = [y1;y2;y3;y4] ;
[time , basis_total , basisNumber] = BasisGenerator(t,y_total);
%DrawConstellation(basis_total , y_total);

signalNumber = 4;
points = zeros(signalNumber,basisNumber);
for i = 1 : signalNumber
    for j = 1 : basisNumber 
        points(i,j) = dot(y_total(i,:),basis_total(j,:));
    end
end
figure ;
%points 
scatter3(points(:,1),points(:,2),points(:,3),'filled');
xlabel('first basis')
ylabel('2nd basis')
zlabel('third basis')


y_total = [y2;y1;y3;y4] ;
[time , basis_total , basisNumber] = BasisGenerator(t,y_total);
%DrawConstellation(basis_total , y_total);

signalNumber = 4;
points = zeros(signalNumber,basisNumber);
for i = 1 : signalNumber
    for j = 1 : basisNumber 
        points(i,j) = dot(y_total(i,:),basis_total(j,:));
    end
end
figure;
%points 
scatter3(points(:,1),points(:,2),points(:,3),'filled');
xlabel('first basis')
ylabel('2nd basis')
zlabel('third basis')