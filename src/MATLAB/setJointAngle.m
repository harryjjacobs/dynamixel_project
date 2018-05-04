function setJointAngle(angle, jointPublisher)
    msg = rosmessage(jointPublisher);
    msg.Data = angle;
    send(jointPublisher, msg);
end