rosshutdown
rosinit
rostopic list

% Angle is in radians between -2.6 and 2.6
% Can calculate as motor is between 0..300 degrees (-150..150)
% 300*pi/180/2 is the max angle

minangle = -300*pi/180/2;
maxangle = 300*pi/180/2;

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

% Create new publisher
emPub = rospublisher('/toggle_electromag', 'std_msgs/Bool')
pause(2) % Wait to ensure publisher is registered
msg = rosmessage(emPub);
msg.Data = angle;
send(emPub, msg);

%motors = rossubscriber('/joint1_controller/pan_tilt_port')
%motorstatelist = receive(motors,10)

setJointAngle(0, publishers(1));
setJointAngle(minangles(2), publishers(2));
setJointAngle(0, publishers(3));
pause(3);
getJointAngle(subscribers(1))

%robotpose = rossubscriber('/pose',@servoPoseCallback)
% run these in command window to stop
%clear robotpose

pause(1);
rosshutdown