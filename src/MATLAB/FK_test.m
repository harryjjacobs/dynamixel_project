clear all;

L1 = 0.1;
L2 = 0.1;

% Define the D-H table for the robot
alpha0 = 0; a0=0; d1=0; theta1=0;					% DH table row: i=1
L(1) = Link([theta1 d1 a0 alpha0 0 0], 'modified'); % We use the modified DH

alpha1 = 90*pi/180; a1=0; d2=0; theta2=0;			% DH table row: i=2
L(2) = Link([theta2 d2 a1 alpha1 0 90*pi/180], 'modified'); % We use the modified DH

alpha3 = 0; a3=L1*10; d4=0; theta4=0;			% DH table row: i=3
L(3) = Link([theta4 d4 a3 alpha3 0 0], 'modified'); % We use the modified DH

alpha4 = -90*pi/180; a4=L2*10; d5=0; theta5=0;			% DH table row: i=4
L(4) = Link([theta5 d5 a4 alpha4 0 0], 'modified'); % We use the modified DH

robot = SerialLink(L, 'name', 'RRP Robot')

w=[-4 4 -4 4 0 6];

figure;
robot.plot([0,0,0,0], 'workspace', w);
robot.qlim = [[-pi pi]; [-pi pi]; [-pi pi]; [-pi pi];]; % Need to set the joint limits
robot.teach