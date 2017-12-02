% Drug Overdoes - state data 

% Columns: 
% Drug Overdose deaths per 100,000 persons
%   above from https://www.cdc.gov/drugoverdose/data/statedeaths.html
% Povery rate (%)	
% Median Household Income ($/year)	
% Unemployment rate (%)		
%   above from https://www.census.gov/data/tables/2016/demo/income-poverty/glassman-acs.html
% State population  
% Population density (persons/sq mile)
%   above from http://population.us/states

clear

data=csvread('Drug_overdose_2015.csv');
y=data(:,1); % Overdoes deaths
d1=data(:,2); % Poverty 
d2=data(:,3); % Income
d3=data(:,4); % Unemployment
d4=data(:,5); % Population
d5=data(:,6); % Density

X=[d1 d2 d3 d4 d5];

