# cartographer_kitti_config
cartographer configuration files for KITTI dataset including .lua and .launch

# download bagfiles
We provide two bag files (kitti_2011_09_30_drive_0027_synced_imu_velo.bag and kitti_2011_09_30_drive_0028_synced_imu_velo.bag) that were generated from the oroginal KITTI datasets. Note that these bags only contain IMU and 3D point clouds from Velodyne. Stereo images are exclueded for the sake of file size and they aren't exploited with Cartographer.

* [kitti_2011_09_30_drive_0027_synced_imu_velo.bag](https://drive.google.com/open?id=1KXX1tgWKL1D50oDpIjYe6UMDJKKTwW8U)
* [kitti_2011_09_30_drive_0028_synced_imu_velo.bag](https://drive.google.com/open?id=1Fu5OsjAzozjJ_Q2xdqkoq-gbmo9Mb7uL)


Examples below assume that you have a bag file at `/home/userHome/workspace/bags/kitti/kitti_2011_09_30_drive_0027_synced_imu_velo.bag`.

## demo KITTI 3D
```
roslaunch cartographer_kitti_config demo_kitti_3d.launch bag_filename:=/home/userHome/workspace/bags/kitti/kitti_2011_09_30_drive_0027_synced_imu_velo.bag
```
After execute the script, this is what you expect,

<img src="http://drive.google.com/uc?export=view&id=1YHmrHMK3e7XNiHg9p34nF_eD4P1Xu0wV" height="450">
https://youtu.be/29Knm-phAyI

## demo offline KITTI 3D
```
roslaunch cartographer_kitti_config offline_kitti_3d.launch bag_filenames:=/home/userHome/workspace/bags/kitti/kitti_2011_09_30_drive_0027_synced_imu_velo.bag
```
## assets writer KITTI 3D
```
roslaunch cartographer_kitti_config assets_writer_kitti_3d.launch bag_filenames:=/home/userHome/workspace/bags/kitti/kitti_2011_09_30_drive_0027_synced_imu_velo.bag pose_graph_filename:=/home/userHome/workspace/bags/kitti/kitti_2011_09_30_drive_0027_synced_imu_velo.bag.pbstream
```

For the longer sequence dataset (i.e., kitti_2011_09_30_drive_0028_synced_imu_velo.bag), just substitue the name of bag file and you expect to see a similar figure as below (no stereo images).

<img src="http://drive.google.com/uc?export=view&id=1CZmB5XL2z3nIYwLFVKTzXCemA5JXPe8u" height="450">
https://youtu.be/mn4y3yQm3Pc


## Citation
If this small piece of software is somehow useful for your work, please cite this repository:
```
@misc{kitti_lidar_cartographer_2018,
  title={Cartographer configurations for processing KITTI datasets},
  author={Inkyu Sa},
  year={2018},
  publisher={Github},
  journal={GitHub repository},
  howpublished={\url{https://tinyurl.com/ub35aah}},
}
```
