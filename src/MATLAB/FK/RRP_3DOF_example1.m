%**************************************************************************
% Roco216/217
%**************************************************************************
% 
% Description:
%	A DH example of a 3DOF RRP Arm
%
% INPUTS:
%	None
%
% OUTPUTS:
%   Plots the robot
%

clear all               % Clear all varibles in the workspace
close all               % Close all open figures
clc                     % Clear the command window
format short			% Set the representation of numbers to be short

% Define the D-H table for the RRP robot
alpha0 = 0; a0=0; d1=3; theta1=0;					% DH table row: i=1
L(1) = Link([theta1 d1 a0 alpha0 0 0], 'modified'); % We use the modified DH

alpha1 = -90*pi/180; a1=1; d2=2; theta2=0;			% DH table row: i=2
L(2) = Link([theta2 d2 a1 alpha1 0 -90*pi/180], 'modified'); % We use the modified DH

alpha2 = 90*pi/180; a2=0; d3=0; theta3=0;			% DH table row: i=3
L(3) = Link([theta3 d3 a2 alpha2 1 2], 'modified'); % We use the modified DH

RRP_robot = SerialLink(L, 'name', 'RRP Robot')

% We could also set the "tool" frame - we called it frame#4
RRP_robot.tool = transl(0,0,2);

w=[-8 8 -8 8 -2 12];

% Vary joint variable #1
for q1 = 0:0.1:pi/2
	RRP_robot.plot([q1,0,0], 'workspace', w);
	pause(0.1);
end
for q1 = pi/2:-0.1:0
	RRP_robot.plot([q1,0,0],  'workspace', w);
	pause(0.1);
end

% Vary joint variable #2
for q2 = 0:0.1:pi/2
	RRP_robot.plot([0,q2,0],  'workspace', w);
	pause(0.1);
end
for q2 = pi/2:-0.1:0
	RRP_robot.plot([0,q2,0],  'workspace', w);
	pause(0.1);
end

% Vary joint variable #3
for q3 = 0:0.1:2
	RRP_robot.plot([0,0,q3],  'workspace', w);
	pause(0.1);
end
for q3 = 2:-0.1:0
	RRP_robot.plot([0,0,q3],  'workspace', w);
	pause(0.1);
end

figure;
RRP_robot.plot([0,0,0],  'workspace', w);

% Now we will try to use the "Teach Pendant"
disp('Hit any key to continue - Use the "Teach Pendant"')
RRP_robot.qlim = [[-pi pi]; [-pi pi]; [0 4]]; % Need to set the joint limits
RRP_robot.teach