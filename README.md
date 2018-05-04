This project should be placed in a catkin workspace

do 'catkin\_make' in the catkin_ws after cloning this repo
and then do 'source devel/setup.bash'

First you need to start the controller manager:

`roslaunch dynamixel_project controller_manager.launch`

Then once this is running you launch the meta controller:

`roslaunch dynamixel_project start_meta_controller.launch`

You can adjust the launch parameters in the tilt.yaml file


Set the angle with:
`rostopic pub -1 /joint2_controller/command std_msgs/Float64`
