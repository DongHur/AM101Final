% Baseball stats and salary
% http://www4.stat.ncsu.edu/~boos/var.select/baseball.html

% VARIABLES IN FILE:
% Y        Salary (in thousands of dollars)
% X1       Batting average
% X2       On-base percentage
% X3       Number of runs
% X4       Number of hits
% X5       Number of doubles
% X6       Number of triples
% X7       Number of home runs
% X8       Number of runs batted in
% X9       Number of walks
% X10      Number of strike-outs
% X11      Number of stolen bases
% X12      Number of errors
% X13      Indicator of "free agency eligibility"
% X14      Indicator of "free agent in 1991/2"
% X15      Indicator of "arbitration eligibility"
% X16      Indicator of "arbitration in 1991/2"

clear

data=csvread('baseball.csv');
y=data(:,1);  % Salary
bat=data(:,2);  % Batting average
hr=data(:,8);   % Home runs
stk=data(:,11);  % Strike outs
sto=data(:,12);  % Stolen bases

X=[bat hr stk sto];

plotmatrix([y X])
fitlm(X,y)
