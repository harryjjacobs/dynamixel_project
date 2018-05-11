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
%   Plots the robot and the axis
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

RRP_robot = SerialLink(L, 'name', 'RRP Robot');

d4 = 2;
RRP_robot.tool = transl([0, 0, d4]);	% Set the "tool" frame - we called it frame#4 (T34)
RRP_robot						% Print the DH table and other robot properties

% Extract the Ti-1,i homogeneous matrices
T00 = RRP_robot.base;			% The base frame
T01 = L(1).A(0);				% The link#1 frame (at theta_1(t)=0)
T12 = L(2).A(0);				% The link#2 frame (at theta_2(t)=0)
T23 = L(3).A(0); 				% The link#3 frame (at d_3(t)=0)

w=[-8 8 -8 8 -2 12];
RRP_robot.plot([0,0,0], 'nobase','noshadow', 'workspace', w);		% Plot the robot using the Robotics Toolbox
title('A RRP 3DOF Robot - With Link Frames')
hold on
trplot(T00, 'frame', '0', 'color', 'k');		% Plot the T00-frame (base)
trplot(T01, 'frame', '1', 'color', 'r');		% Plot the T01-frame (link#1 frame)
trplot(T01*T12, 'frame', '2', 'color', 'g');	% Plot the T02-frame (link#2 frame)
trplot(T01*T12*T23, 'frame', '3', 'color', 'b');% Plot the T03-frame (link#3 frame)
hold off