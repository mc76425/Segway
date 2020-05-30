clear all; clc;

l = 1;
m = 0.5;
M = 0.5;
g = 9.81;
T = 0;
F = 0;

%J'ai dû merder mes matrices; ça marche pas
A = [0 0 (m*g)/M 0;
    0 0 ((M+m)*g)/(M*l) 0;
    1 0 0 0;
    0 1 0 0]

B = [1/M;
    1/(M*l);
    0;
    0]
%Pole placement
%Test
Mc = ctrb(A,B); rank(Mc);
desiredPoles = [-1,-1,-1,-1];
K = acker(A, B, desiredPoles)
