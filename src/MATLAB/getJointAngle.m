function angle = getJointAngle(subscriber)
    data = receive(subscriber, 1);
    angle = data.CurrentPos;
end