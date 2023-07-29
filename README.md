# radar-slam

## Prerequisites
- Docker
- VSCode
- - [Visual Studio Code Remote Extension pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
- [vcstool](http://wiki.ros.org/vcstool)

## Install
1. Clone this repository and some dependencies
```  
git clone https://github.com/ivr0ma/radar-slam.git
vcs import --recursive ws/src < radar-dependencies.repos
```
2. Reopen in Container  
2.1. Open an Remote Window
![image](https://github.com/ivr0ma/radar-slam/assets/101193011/73b33717-7fb5-4cbe-b93e-dc99e799430f)
2.2. Choose "Reopen in Container"

3. `ctrl+shift+b` and choose "catkin_make_isolated: build"
4. Restart container  
   4.1. Reopen Folder Localy  
   4.2. Reopen in Container  

## Sample datasets
**4D millimeter wave radar data set**：[Google-drive](https://drive.google.com/file/d/13xzZ3uGyV6l2fjjCZix_S3XPCB6JCgLJ/view?usp=sharing)

## Run
1. `ctrl+shift+b` to build package
2. After build
```
source devel_isolated/setup.bash
```
3. Run "ROS: Launch"  
![image](https://github.com/ivr0ma/radar-slam/assets/101193011/b637c6a5-a74a-4f4c-9e72-a398bb92ec05)
4. Enter in terminal
```
rosbag play lib.bag --clock
```
