This project should be placed in a catkin workspace

do 'catkin\_make' in the catkin_ws after cloning this repo
and then do: 
`source /opt/ros/kinetic/setup.bash`
Followed by:
`source devel/setup.bash`

First you need to start the controller manager:

`roslaunch dynamixel_project controller_manager.launch`

Then once this is running you launch the meta controller:

`roslaunch dynamixel_project start_meta_controller.launch`

You can adjust the launch parameters in the tilt.yaml file


Set the angle with:
`rostopic pub -1 /joint2_controller/command std_msgs/Float64`

[http://wiki.ros.org/dynamixel_controllers/Tutorials/Creatingmetacontroller] (http://wiki.ros.org/dynamixel_controllers/Tutorials/Creatingmetacontroller)

To install rosserial for arduino:
`sudo apt install ros-kinetic-rosserial-python ros-kinetic-rosserial-arduino`

Then:

`cd <sketchbook>/libraries`
Where <sketchbook> is your arduino sketch directory. 

The `ros_lib` directory must be deleted if it exists:

`rm -rf ros_lib`

`rosrun rosserial_arduino make_libraries.py .`

Then restart the Arduino IDE

Run:
`rosrun rosserial_python serial_node.py /dev/ttyACM0`
