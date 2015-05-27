%
% Affine & Projective Alignments
% fvx507@alumni.ku.dk
%

%% assignment 4.2

clc, clear all;

X = [0.0 0.0; 1.0 0.0; 1.0 1.0; 0.0 1.0; 0.0 0.0];
Y = [0.6 0.6; 1.3 0.8; 1.0 1.6; 0.4 1.0; 0.6 0.6];

[D, Z, transform] = procrustes(Y, X);

figure (4-2);
plot(X(:,1),X(:,2),Y(:,1),Y(:,2),Z(:,1),Z(:,2)), axis image;

%% assignment 4.3

clc, clear all;

X = [0.0 0.0; 1.0 0.0; 1.0 1.0; 0.0 1.0; 0.0 0.0];
Y = [0.6 0.6; 1.3 0.8; 1.0 1.6; 0.4 1.0; 0.6 0.6];

[M,N] = size(X);
t = fitgeotrans(X, Y, 'affine');

X = X';
Z = zeros(N,M);
for i = 1:M
    s = X(:,i);
    s = [s(1) s(2) 1]';
    u = (t.T') * s;
    Z(:,i) = [u(1) u(2)]';
end

X=X', Y, Z=Z' % print for comparison
plot(X(:,1),X(:,2),Y(:,1),Y(:,2),Z(:,1),Z(:,2)), axis image;

%% assignment 4.4

clc, clear all;

X = [0.0 0.0; 1.0 0.0; 1.0 1.0; 0.0 1.0; 0.0 0.0];
Y = [0.6 0.6; 1.3 0.8; 1.0 1.6; 0.4 1.0; 0.6 0.6];

[M,N] = size(X);
t = fitgeotrans(X, Y, 'projective');

X = X';
Z = zeros(N,M);
for i = 1:M
    s = X(:,i);
    s = [s(1) s(2) 1]';
    u = (t.T') * s;
    Z(:,i) = [u(1) u(2)]';
end

X=X', Y, Z=Z' % print for comparison
plot(X(:,1),X(:,2),Y(:,1),Y(:,2),Z(:,1),Z(:,2)), axis image;