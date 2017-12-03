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
elective = data(:, 8);
requirement = data(:, 9);

deltaY = y1-y2;     % Change in enrollment
percentInc = (y1-y2)./y2;
ele_req = elective+requirement;
X=[overall_rating workload_hours recommend inst_overall inst_access];
% X=[workload_hours recommend, requirement];
% plots the data
[~, ax] = plotmatrix([percentInc X])
ax(1,1).YLabel.String='Change in Enrollment'; 
ax(2,1).YLabel.String='Overall Rating'; 
ax(3,1).YLabel.String='Workload Hours'; 
ax(4,1).YLabel.String='Recommendation'; 
ax(5,1).YLabel.String='Instructor Overall'; 
ax(6,1).YLabel.String='Instructor Accessibility'; 

% ax(1,1).YLabel.String='Change in Enrollment'; 
% ax(2,1).YLabel.String='Workload Hours'; 
% ax(3,1).YLabel.String='Recommendation'; 
% ax(4,1).YLabel.String='Requirement'; 
% 
ax(6,1).XLabel.String='Change in Enrollment'; 
ax(6,2).XLabel.String='Overall Rating'; 
ax(6,3).XLabel.String='Workload Hours'; 
ax(6,4).XLabel.String='Recommendation'; 
ax(6,5).XLabel.String='Instructor Overall'; 
ax(6,6).XLabel.String='Instructor Accessibility'; 

% 
% ax(4,1).XLabel.String='Change in Enrollment'; 
% ax(4,2).XLabel.String='Workload Hours'; 
% ax(4,3).XLabel.String='Recommendation'; 
% ax(4,4).XLabel.String='Requirement'; 

% fits linear regression
fitlm(X, deltaY)
%% Big Data Analysis
clc
clear all

% data=csvread('QGuideData3.csv', 1, 1);
data=csvread('QGuideDataBigClass2.csv', 1, 1);
y1 = data(:,1);               % next year student enrollment
y2 = data(:,2);               % current year student enrollment
overall_rating = data(:,3);   % Overall Rating
workload_hours = data(:,4);   % Workload Hours
recommend = data(:,5);        % Recommend
inst_overall = data(:,6);     % Instructor Overall
inst_access = data(:, 7);     % Instructor Accessibility
elective = data(:, 8);
requirement = data(:, 9);
assignments = data(:, 10);
feedback = data(:, 11);
section = data(:, 12);

deltaY = y1-y2;     % Change in enrollment
percentInc = (y1-y2)./y2;
ele_req = elective+requirement;
X=[workload_hours recommend inst_access requirement feedback section];

[~, ax] = plotmatrix([percentInc X])
figure; [R, PValue] = corrplot([percentInc X])

% ax(1,1).YLabel.String='Change in Enrollment'; 
% ax(2,1).YLabel.String='Overall Rating'; 
% ax(3,1).YLabel.String='Workload Hours'; 
% ax(4,1).YLabel.String='Recommendation'; 
% ax(5,1).YLabel.String='Instructor Overall'; 
% ax(6,1).YLabel.String='Instructor Accessibility'; 
% ax(7,1).YLabel.String='Elective'; 
% ax(8,1).YLabel.String='Requirement'; 
% ax(9,1).YLabel.String='Assignments'; 
% ax(10,1).YLabel.String='Feedback'; 
% ax(11,1).YLabel.String='Section'; 
% 
% ax(11,1).XLabel.String='Change in Enrollment'; 
% ax(11,2).XLabel.String='Overall Rating'; 
% ax(11,3).XLabel.String='Workload Hours'; 
% ax(11,4).XLabel.String='Recommendation'; 
% ax(11,5).XLabel.String='Instructor Overall'; 
% ax(11,6).XLabel.String='Instructor Accessibility'; 
% ax(11,7).XLabel.String='Elective'; 
% ax(11,8).XLabel.String='Requirement'; 
% ax(11,9).XLabel.String='Assignments';
% ax(11,10).XLabel.String='Feedback';
% ax(11,11).XLabel.String='Section'; 

% fits linear regression
fitlm(X, percentInc)

