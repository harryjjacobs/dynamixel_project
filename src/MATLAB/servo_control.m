rosshutdown
rosinit
rostopic list

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

setJointAngle(1, publishers(1));
getJointAngle(subscribers(1));

%robotpose = rossubscriber('/pose',@servoPoseCallback)
% run these in command window to stop
%clear robotpose

pause(3);
rosshutdown