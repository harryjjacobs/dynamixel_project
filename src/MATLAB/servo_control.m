rosshutdown
rosinit
rostopic list

% Angle is in radians between -2.6 and 2.6
% Can calculate as motor is between 0..300 degrees (-150..150)
% 300*pi/180/2 is the max angle

minangle = -300*pi/180/2;
maxangle = 300*pi/180/2;

halfpi = pi/2;

minangles = [minangle; minangle/4; minangle/4; minangle/4; minangle];
maxangles = [maxangle; maxangle/4; maxangle/4; maxangle/2; maxangle];

publishers = [
    rospublisher('joint1_controller/command', 'std_msgs/Float64');
    rospublisher('joint2_controller/command', 'std_msgs/Float64');
    rospublisher('joint3_controller/command', 'std_msgs/Float64');
    rospublisher('joint4_controller/command', 'std_msgs/Float64');
    rospublisher('joint5_controller/command', 'std_msgs/Float64');
];


subscribers = [
    rossubscriber('joint1_controller/state');
    rossubscriber('joint2_controller/state');
    rossubscriber('joint3_controller/state');
    rossubscriber('joint4_controller/state');
    rossubscriber('joint5_controller/state');
];

% Create new publisher for electromagnet
emPub = rospublisher('/toggle_electromag', 'std_msgs/Bool')
pause(2) % Wait to ensure publisher is registered

% For testing
%{
% Turn on electromagnet
msg = rosmessage(emPub);
msg.Data = true;
send(emPub, msg);
pause(5);
% Turn off electromagnet
msg = rosmessage(emPub);
msg.Data = false;
send(emPub, msg);
pause(3);
return;
%}

L0 = 0.06;
L1 = 0.1;
L2 = 0.1;

% Define the D-H table for the robot
alpha0 = 0; a0=0; d1=L0; theta1=0;					% DH table row: i=1
L(1) = Link([theta1 d1 a0 alpha0 0 0], 'modified'); % We use the modified DH

alpha1 = 90*pi/180; a1=0; d2=0; theta2=0;			% DH table row: i=2
L(2) = Link([theta2 d2 a1 alpha1 0 0], 'modified'); % We use the modified DH

alpha3 = 0; a3=L1; d4=0; theta4=0;			% DH table row: i=3
L(3) = Link([theta4 d4 a3 alpha3 0 90*pi/180], 'modified'); % We use the modified DH

alpha4 = 90*pi/180; a4=0; d5=L2; theta5=90*pi/180;			% DH table row: i=4
L(4) = Link([theta5 d5 a4 alpha4 0 0], 'modified'); % We use the modified DH

arm = SerialLink(L, 'name', 'Arm')

%%{
% Reset all motors to position
% This is (0.1, 0.1, 0) in cartesian space
setJointAngle(0, publishers(1));
pause(0.1);
setJointAngle(0, publishers(2));
pause(0.1);
setJointAngle(pi/2, publishers(3));
pause(0.1);
setJointAngle(-pi/2, publishers(4));
pause(0.1);
setJointAngle(0, publishers(5));

pause(3);

for I = 1:4
    % Move to initial position
    angles = IK([0.1 0.1 0])
    setJointAngle(angles(3), publishers(4));
    setJointAngle(angles(2), publishers(3));
    setJointAngle(angles(1), publishers(1));
    
    pause(2);
    
    % Move to first position
    angles = IK([0.1 -0.04 0.1])
    setJointAngle(angles(3), publishers(4));
    setJointAngle(angles(2), publishers(3));
    setJointAngle(angles(1), publishers(1));

    % Turn on electromagnet
    msg = rosmessage(emPub);
    msg.Data = true;
    send(emPub, msg);

    pause(4);

    % Move to position
    angles = IK([0.1 0.04 -0.1])
    setJointAngle(angles(3), publishers(4));
    setJointAngle(angles(2), publishers(3));
    setJointAngle(angles(1), publishers(1));

    pause(2)

    % Turn off electromagnet
    msg = rosmessage(emPub);
    msg.Data = false;
    send(emPub, msg);

    pause(4);
end


% Use forward kinematics to find position
angles = getJointAngles(subscribers)
%angles = [0 0 0 0]
t = arm.fkine([angles(1) angles(2) angles(3) angles(4)]).t
position(1) = t(1);
position(2) = t(2);
position(3) = t(3);
position

%robotpose = rossubscriber('/pose',@servoPoseCallback)
% run these in command window to stop
%clear robotpose

pause(1);
rosshutdown