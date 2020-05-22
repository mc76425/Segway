function Xp  = Segway_Nolin(X, F, T, m, M, g, l)
% X = (tp xp t x) so Xp = (tpp xpp tp xp)
Xp = zeros([1,4]);
Xp(2) = (-m*l*(X(1)^2)*sin(X(3))+m*g*cosd(X(3))*sind(X(3))+F+ ...
    ((T*cosd(X(3)))/l))/(M+m-m*(cosd(X(3))^2)); 
Xp(1) = ((M+m)*g*l*sind(X(3))-m*((l*X(1))^2)*cosd(X(3))*sind(X(3))+ ...
    T*(M+m)/m+l*F*cosd(X(3))/((l^2)*(M+m-m*(cosd(X(3))^2))));
Xp(3) = X(1);
Xp(4) = X(2);
end
