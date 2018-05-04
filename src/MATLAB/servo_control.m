rosinit
rostopic list

motors = rossubscriber('/motor_states/pan_tilt_port')
motorstatelist = receive(motors,10)

%robotpose = rossubscriber('/pose',@servoPoseCallback)

% run these in command window to stop
%clear robotpose
rosshutdown