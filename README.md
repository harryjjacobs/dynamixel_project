This project should be placed in a catkin workspace

do 'catkin\_make' in the catkin_ws after cloning this repo
and then do 'source devel/setup.bash'

First you need to start the controller manager:

`roslaunch dynamixel_project controller_manager.launch`

Then once this is running you launch the tilt controller:

`roslaunch dynamixel_project start_tilt_controller.launch`

You can adjust the launch parameters in the .yaml file
