-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

include "map_builder.lua"
include "trajectory_builder.lua"

options = {
  map_builder = MAP_BUILDER,
  trajectory_builder = TRAJECTORY_BUILDER,
  map_frame = "map",
  tracking_frame = "imu_link",
  published_frame = "base_link",
  odom_frame = "odom",
  provide_odom_frame = true,
  publish_frame_projected_to_2d = false,
  use_odometry = false,
  use_nav_sat = false,
  use_landmarks = false,
  num_laser_scans = 0,
  num_multi_echo_laser_scans = 0,
  num_subdivisions_per_laser_scan = 1,
  num_point_clouds = 1,
  lookup_transform_timeout_sec = 0.2,
  submap_publish_period_sec = 0.3,
  pose_publish_period_sec = 5e-3,
  trajectory_publish_period_sec = 30e-3,
  rangefinder_sampling_ratio = 1.,
  odometry_sampling_ratio = 1.,
  fixed_frame_pose_sampling_ratio = 1.,
  imu_sampling_ratio = 1.,
  landmarks_sampling_ratio = 1.,
}
-- ============================================
--        TRAJECTORY_BUILDER_3D params (local SLAM)
-- ============================================
TRAJECTORY_BUILDER_3D.num_accumulated_range_data = 1
TRAJECTORY_BUILDER_3D.ceres_scan_matcher.translation_weight = 5. 
TRAJECTORY_BUILDER_3D.use_online_correlative_scan_matching = true
TRAJECTORY_BUILDER_3D.imu_gravity_time_constant = .1
TRAJECTORY_BUILDER_3D.voxel_filter_size = 0.3
--TRAJECTORY_BUILDER_3D.submaps.high_resolution = 0.2
TRAJECTORY_BUILDER_3D.submaps.high_resolution = 0.2
TRAJECTORY_BUILDER_3D.submaps.high_resolution_max_range = 50.
-- TRAJECTORY_BUILDER_3D.submaps.num_range_data= 300.


-- No point of trying to SLAM over the points on your car
TRAJECTORY_BUILDER_3D.min_range = 1.0
TRAJECTORY_BUILDER_3D.max_range = 100.
TRAJECTORY_BUILDER_3D.motion_filter.max_time_seconds = 0.5
TRAJECTORY_BUILDER_3D.motion_filter.max_distance_meters = 0.3
TRAJECTORY_BUILDER_3D.motion_filter.max_angle_radians = math.rad(5.)
TRAJECTORY_BUILDER_3D.ceres_scan_matcher.rotation_weight = 4.5e1 --4e1
TRAJECTORY_BUILDER_3D.ceres_scan_matcher.translation_weight = 7 --6
--TRAJECTORY_BUILDER_3D.ceres_scan_matcher.rotation_weight = 5 --2e1 --4e1
--TRAJECTORY_BUILDER_3D.ceres_scan_matcher.translation_weight = 3 --6

-- ============================================
--        MAP_BUILDER params (trivial thing that switching 2D or 3D)
-- ============================================
MAP_BUILDER.use_trajectory_builder_3d = true
MAP_BUILDER.num_background_threads = 8

-- ============================================
--        POSE_GRAPH params (global SLAM)
-- ============================================
-- The bigger the Huber scale, the higher is the impact of (potential) outliers.
-- high huber scale allows more outliers with more noisy samples
POSE_GRAPH.optimization_problem.huber_scale = 1e2

--POSE_GRAPH.optimization_problem.rotation_weight = 6e5
--POSE_GRAPH.optimize_every_n_nodes = 320
POSE_GRAPH.optimize_every_n_nodes = 150
-- POSE_GRAPH.global_constraint_search_after_n_seconds = 3.
POSE_GRAPH.global_sampling_ratio = 0.1

--POSE_GRAPH.constraint_builder.sampling_ratio = 0.03
POSE_GRAPH.constraint_builder.sampling_ratio = 0.1

POSE_GRAPH.optimization_problem.ceres_solver_options.max_num_iterations = 100
--POSE_GRAPH.constraint_builder.min_score = 0.62
POSE_GRAPH.constraint_builder.min_score = 0.45

--POSE_GRAPH.constraint_builder.global_localization_min_score = 0.66
POSE_GRAPH.constraint_builder.global_localization_min_score = 0.45
POSE_GRAPH.constraint_builder.loop_closure_rotation_weight = 1e2

POSE_GRAPH.constraint_builder.max_constraint_distance = 50.
-- POSE_GRAPH.max_num_final_iterations=400
POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher_3d.linear_xy_search_window = 25.
POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher_3d.linear_z_search_window = 10.
POSE_GRAPH.constraint_builder.fast_correlative_scan_matcher_3d.angular_search_window = math.rad(15.)

-- POSE_GRAPH.constraint_builder.ceres_scan_matcher.rotation_weight = 10.

-- POSE_GRAPH.constraint_builder.min_score = 0.55
-- POSE_GRAPH.constraint_builder.global_localization_min_score = 0.55
POSE_GRAPH.optimization_problem.log_solver_summary = true




return options
