rosinit
rostopic list

%motors = rossubscriber('/joint1_controller/pan_tilt_port')
%motorstatelist = receive(motors,10)

joint4 = rospublisher('joint4_controller/command', 'std_msgs/Float64')
msg = rosmessage(joint4);
msg.Data = 0;
send(joint4, msg)


%robotpose = rossubscriber('/pose',@servoPoseCallback)

% run these in command window to stop
%clear robotpose
pause(3);
rosshutdown