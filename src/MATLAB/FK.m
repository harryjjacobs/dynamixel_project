function pos = FK(Theta1, Theta2, Theta3)
    alpha0 = 0; a0=0; d1=3; theta1=0;					% DH table row: i=1
    L(1) = Link([theta1 d1 a0 alpha0 0 0], 'modified'); % We use the modified DH

    alpha1 = -90*pi/180; a1=1; d2=2; theta2=0;			% DH table row: i=2
    L(2) = Link([theta2 d2 a1 alpha1 0 -90*pi/180], 'modified'); % We use the modified DH

    alpha2 = 90*pi/180; a2=0; d3=0; theta3=0;			% DH table row: i=3
    L(3) = Link([theta3 d3 a2 alpha2 1 2], 'modified'); % We use the modified DH

    RRP_robot = SerialLink(L, 'name', 'RRP Robot')
    
    
end