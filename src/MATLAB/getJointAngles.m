function angles = getJointAngles(subscribers)
    n = length(subscribers);
    angles = zeros(n);
    for i = 1:n
        data = receive(subscribers(i), 1);
        angles(i) = data.CurrentPos;
    end
end