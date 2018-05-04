function angle = getJointAngle(subscriber)
    receive(subscriber, 1)
    data = receive(subscriber, 1);
    angle = data.CurrentPos;
end