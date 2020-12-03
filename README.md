# Jetson-opencv-conda-env

The scripts are based largely on [Jetsonhacks code](https://github.com/jetsonhacks/buildOpenCVXavier), and on [AerialRoboticsGuru post](https://forums.developer.nvidia.com/t/installing-opencv4-on-xavier-solved/65436)

## Steps

- ```./buildOpenCV.sh```
- In the build folder issue the command ```sudo ldconfig```
- 


## Side code
***Cmake code***
```
cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D WITH_CUDA=ON \
-D CUDA_ARCH_BIN=7.2 \
-D ENABLE_FAST_MATH=ON \
-D CUDA_FAST_MATH=ON \
-D WITH_CUBLAS=ON \
-D WITH_LIBV4L=ON \
-D WITH_GSTREAMER=ON \
-D WITH_GSTREAMER_0_10=OFF \
-D WITH_QT=ON \
-D WITH_OPENGL=ON \
-D OPENCV_EXTRA_MODULES_PATH=/media/ubuntu/SSD1/opencv-4-4/opencv_contrib-4.4.0/modules \
-D PYTHON_EXECUTABLE=/media/ubuntu/SSD1/archiconda3/envs/ANS-py36/bin/python3.6 \
-D BUILD_EXAMPLES=ON \
-D CUDA_NVCC_FLAGS="--expt-relaxed-constexpr" \
-D WITH_TBB=ON \
..
```
