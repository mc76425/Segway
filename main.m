clear all; clc;

l = 1;
m = 0.5;
M = 0.5;
g = 9.81;
T = 0;
F = 0;

%J'ai dû merder mes matrices; ça marche pas
A = [0 0 (m+M)/(M*l^2)*l*g 0;
    0 0 (M+m)/M 0;
    1 0 0 0;
    0 1 0 0]

B = [(l*F + T/m*(M+m))/(M*l^2);
    (T/l + F)/M;
    0
    0]
%Pole placement
%Test
Mc = ctrb(A,B); rank(Mc);
desiredPoles = [-1,-1,-1,-1];
K = acker(A, B, desiredPoles)
