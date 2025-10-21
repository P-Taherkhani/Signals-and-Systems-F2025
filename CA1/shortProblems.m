% Scalar Variables
a = 10;
b = 2.5 * 10^23;
c = 2 + 3j;
d = exp(j * 2 * pi / 3);

% Vector Variables
aVec = [3.14, 15, 9, 26];
bVec = [2.71; 8; 28; 182];
%disp(aVec);
%disp(bVec);

cVec = 5 : -0.2 : -5;
%disp(cVec);

dVec = logspace(0, 1, 101);
%disp(dVec);

eVec = 'Hello';
%disp(eVec);
%length(eVec);
%strlength(eVec);

% Matrix Variables 

aMat = 2 * ones(9);
%disp(aMat)

main_diag = [1, 2, 3, 4, 5, 4, 3, 2, 1];
bMat = diag(main_diag);
%disp(bMat)

vTemp = 1 : 1 : 100;
cMat = reshape(vTemp, [10, 10]);

dMat = NaN(3,4);

eMat = [13 -1 5; -22 10 -87];

fMat_1 = floor(-3 + (7).*rand(5,3));
fMat_2 = ceil(-3 - 1 + 7*rand(5,3));
fMat_3 = randi([-3, 3], 5, 3);

% Scalar Equations 
x = 1 / (1 + exp(-(a-15)/6));

y = (sqrt(a) + nthroot(b, 21)) ^ pi;

z = log(real((c + d) * (c - d)) * sin (a * pi / 3)) / ( c * conj(c));

% Matrix Equations

xMat = (aVec * bVec) * aMat ^ 2;

yMat = (bVec * aVec);

zMat = det(cMat) * (aMat * bMat)';

% Common Functions and Indexing

cSum = sum(cMat);

eMean = mean(eMat, 2);

eMat(1, : ) = [1 1 1];

cSub = cMat(2:9, 2:9);

lin = 1:20;

lin(2:2:end) = -lin(2:2:end);

r = rand(1, 5);

r(find(r < 0.5)) = 0;