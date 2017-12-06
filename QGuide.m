%%
% Name: Dong Hur and Andrew Yang
% Date: December 4, 2017
% Description: MATLAB code for final project
% Class: AM101
%%
% All of the Q guide data can be found here: http://q.fas.harvard.edu/
% We will look across all departments for course evaluation data.

% VARIABLES IN FILE:
% y1        number of students enrolled in the class the following year
% y2        number of students current year
% x1        overall_rating       
% x2        workload_hours
% x3        recommend
% x4        inst_overall
% x5        inst_access
% x6        elective
% x7        requirement
% x8        assignments
% x9        feedback
% x10       section
%%
% Clear all data
clc
clear all
close all
% Load data
data=csvread('data/QGuideDataBigClass4.csv', 1, 1);
% Abstract data to corresponding variables
y1 = data(:,1);                 % next year student enrollment
y2 = data(:,2);                 % current year student enrollment
overall_rating = data(:,3);     % Overall Rating
workload_hours = data(:,4);     % Workload Hours
recommend = data(:,5);          % Recommend
inst_overall = data(:,6);       % Instructor Overall
inst_access = data(:, 7);       % Instructor Accessibility
elective = data(:, 8);          % Percentage for Elective
requirement = data(:, 9);       % Percentage for Requirement
assignments = data(:, 10);      % Assignments Rating
feedback = data(:, 11);         % Feedback Rating
section = data(:, 12);          % Section Rating

% Variable declaration used in analysis
deltaY = y1-y2;                 % Change in enrollment
percentInc = (y1-y2)./y2;       % Percent Increase
ele_req = elective+requirement; % Elective + Requirement percentages

%% Analysis of ALL regressors
% Combines all the variables
X=[ overall_rating workload_hours recommend inst_overall inst_access elective requirement assignments feedback section];
plot_name = {
    'Enrollment % Inc.'; 'overall_rating'; 'workload_hours'; 'recommend'; 'inst_overall'; 'inst_access';
    'elective'; 'requirement'; 'assignments'; 'feedback'; 'section'
    };

% Creates plot of each Xs and Y
[~, ax] = plotmatrix([deltaY X]);
[R, PValue] = corrplot([percentInc X]);
% Places labels on plot based on plot_name
for i = 1:length(plot_name)
    ax(i,1).YLabel.String = plot_name{i};
    ax(length(plot_name),i).XLabel.String = plot_name{i};
end

% fits linear regression
fitlm(X, deltaY)
%% Analysis of regressors that make the best fit line
% Combines all the variables
X=[ recommend elective requirement ];
plot_name = {
    'Enrollment % Inc.'; 'recommend';
    'elective'; 'requirement'
    };

% Creates plot of each Xs and Y
[~, ax] = plotmatrix([deltaY X]);
[R, PValue] = corrplot([percentInc X]);
% Places labels on plot based on plot_name
for i = 1:length(plot_name)
    ax(i,1).YLabel.String = plot_name{i};
    ax(length(plot_name),i).XLabel.String = plot_name{i};
end

% fits linear regression
fitlm(X, deltaY)