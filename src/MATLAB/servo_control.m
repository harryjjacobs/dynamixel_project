rosinit
rostopic list

%motors = rossubscriber('/joint1_controller/pan_tilt_port')
%motorstatelist = receive(motors,10)

joint1 = rospublisher

%robotpose = rossubscriber('/pose',@servoPoseCallback)

% run these in command window to stop
%clear robotpose
rosshutdown