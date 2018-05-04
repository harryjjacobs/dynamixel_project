function servoPoseCallback(~, message)
    % Declare global variables to store
    global pos
    
    % Extract position and orientation from the ROS message and assign the
    % data to the global variables.
    pos = [message.Linear.X message.Linear.Y message.Linear.Z];
end