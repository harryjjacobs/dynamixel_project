function angles = IK(pos)
    % Inverse kinematics
    l1 = 0.1;
    l2 = 0.1;
    Px = pos(1);
    Py = pos(2);
    Pz = pos(3);
    ThetaY = atan(Pz/Px);
    Pxz = sqrt(Px^2 + Pz^2);
    Beta = atan(Py/Pxz);
    Pd = sqrt(Pxz^2 + Py^2);
    Gamma = acos((Pxz^2 + Py^2 + l1^2 - l2^2) / (2*l1*Pd));
    theta2 = -acos((Pxz^2 + Py^2 - l1^2 - l2^2) / (2*l1*l2));
    theta1 = Beta + Gamma;
    theta3 = ThetaY;
    
    angles = [theta1, theta2, theta3];
    
    %if Theta2 >0, Theta1 = Beta - Gamma) % under arm
	  % over arm

    %ThetaHand = -(Theta1 + Theta2)
end