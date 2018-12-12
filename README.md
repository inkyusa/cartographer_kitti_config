# cartographer_kitti_config
cartographer configuration files for KITTI dataset including .lua and .launch

Example
Assuming you have a bag file at `/home/enddl22/workspace/bags/kitti/kitti_2011_09_26_drive_0002_synced.bag`.

## demo KITTI 3D
```
roslaunch cartographer_kitti_config demo_kitti_3d.launch bag_filename:=/home/enddl22/workspace/bags/kitti/kitti_2011_09_26_drive_0002_synced.bag
```
## demo offline KITTI 3D
```
roslaunch cartographer_kitti_config offline_kitti_3d.launch bag_filenames:=/home/enddl22/workspace/bags/kitti/kitti_2011_09_26_drive_0002_synced.bag
```
## assets writer KITTI 3D
```
roslaunch cartographer_kitti_config assets_writer_kitti_3d.launch bag_filenames:=/home/enddl22/workspace/bags/kitti/kitti_2011_09_26_drive_0002_synced.bag pose_graph_filename:=/home/enddl22/workspace/bags/kitti/kitti_2011_09_26_drive_0002_synced.bag.pbstream
```

