function Xp  = Segway_Lin0(X, F, T, m, M, g, l)
Xp = zeros([1,4]);
Xp(2) = (m*g*X(3)+F+T/l)/M; % X = (tp xp t x) so Xp = (tpp xpp tp xp)
Xp(1) = ((M+m)*g*l*X(3)+T*(M+m)/m+l*F)/((l^2)*M);
Xp(3) = X(1);
Xp(4) = X(2);
end
