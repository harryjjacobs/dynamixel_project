#include <ros.h>

#include <std_msgs/Bool.h>

ros::NodeHandle nh;

void messageCb( const std_msgs::Bool& toggle_msg){
  if (toggle_msg.data == true)
  {
    digitalWrite(13, HIGH);   // Turn on the electromagnet
  }
  else
  {
    digitalWrite(13, LOW);   // Turn off the electromagnet
  }
}

ros::Subscriber<std_msgs::Bool> sub("toggle_electromag", &messageCb );

void setup()
{
  pinMode(13, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{
  nh.spinOnce();
  delay(1);
}
