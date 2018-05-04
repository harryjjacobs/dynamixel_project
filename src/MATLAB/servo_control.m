rosshutdown
rosinit
rostopic list

% Angle is in radians between -2.6 and 2.6
% Can calculate as motor is between 0..300 degrees (-150..150)
% 300*pi/180/2 is the max angle

minangle = -300*pi/180/2;
maxangle = 300*pi/180/2;

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

%motors = rossubscriber('/joint1_controller/pan_tilt_port')
%motorstatelist = receive(motors,10)

setJointAngle(minangle, publishers(1));
pause(3);
getJointAngle(subscribers(1))

%robotpose = rossubscriber('/pose',@servoPoseCallback)
% run these in command window to stop
%clear robotpose

pause(1);
rosshutdown