% All of the q guide data can be found here: http://q.fas.harvard.edu/
% We will look across all departments for course evaluation data.


% VARIABLES IN FILE:
% y1        number of students enrolled in the class the following year
% y2       number of students current year
% overall_rating       
% workload_hours
% recommend
% inst_overall
% inst_access
clc
clear

data=csvread('QGuideData3.csv', 1, 1);

y1 = data(:,1);               % next year student enrollment
y2 = data(:,2);               % current year student enrollment
overall_rating = data(:,3);   % Overall Rating
workload_hours = data(:,4);   % Workload Hours
recommend = data(:,5);        % Recommend
inst_overall = data(:,6);     % Instructor Overall
inst_access = data(:, 7);     % Instructor Accessibility

deltaY = y2-y1;     % Change in enrollment
% X=[overall_rating workload_hours recommend inst_overall inst_access];
X=[workload_hours recommend];
% plots the data
[~, ax] = plotmatrix([deltaY X])
% ax(1,1).YLabel.String='Change in Enrollment'; 
% ax(2,1).YLabel.String='Overall Rating'; 
% ax(3,1).YLabel.String='Workload Hours'; 
% ax(4,1).YLabel.String='Recommendation'; 
% ax(5,1).YLabel.String='Instructor Overall'; 
% ax(6,1).YLabel.String='Instructor Accessibility'; 

ax(1,1).YLabel.String='Change in Enrollment'; 
ax(2,1).YLabel.String='Workload Hours'; 
ax(3,1).YLabel.String='Recommendation'; 

% 
% ax(6,1).XLabel.String='Change in Enrollment'; 
% ax(6,2).XLabel.String='Overall Rating'; 
% ax(6,3).XLabel.String='Workload Hours'; 
% ax(6,4).XLabel.String='Recommendation'; 
% ax(6,5).XLabel.String='Instructor Overall'; 
% ax(6,6).XLabel.String='Instructor Accessibility'; 


ax(3,1).XLabel.String='Change in Enrollment'; 
ax(3,2).XLabel.String='Workload Hours'; 
ax(3,3).XLabel.String='Recommendation'; 

% fits linear regression
fitlm(X, deltaY)





