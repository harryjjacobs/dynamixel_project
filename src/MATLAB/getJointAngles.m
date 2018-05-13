function angles = getJointAngles(subscribers)
    n = len(subscribers);
    angles = zeros(n);
    for i = 1:n
        data = receive(subscribers(i), 1);
        angles(i) = data.CurrentPos;
    end
end