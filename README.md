# Jetson-opencv-conda-env

The scripts are based largely on [This blog](https://spyjetson.blogspot.com/2020/08/jetson-xavier-nx-opencv-44.html)

## Steps

- Run ```./buildOpenCV_4__4.sh (Path to folder to install in)```
This will install OpenCV 4.4 for the default python (in case of conda it will be for the python in **base** env)
- After installing Opencv it is possible enable it on other environments just by copying the next files from **Path_to_default_python**/site-packages to **your_env**/lib/**python_version**/site-packages
1. cv2 (*folder*)
2. opencv_python-4.4.0.46.dist-info (*folder*)
3. cv2.cpython-36m-aarch64-linux-gnu.so

