# Used code from multiple sources as (https://spyjetson.blogspot.com/2020/08/jetson-xavier-nx-opencv-44.html) and JetsonHacks code (https://github.com/jetsonhacks/buildOpenCVXavier/blob/master/buildOpenCV.sh) 

PYTHON_DIR="_"
INSTALL_DIR=$HOME

function usage
{
    echo "usage: ./buildOpenCV.sh [[-s sourcedir ] | [-h]]"
    echo "-p | --pythondir   Directory directory of the python you want to use (exapmle: path_to_your_env/bin/python)"
    echo "-i | --installdir  Directory in which to install opencv libraries (default /usr/local)"
    echo "-h | --help  This message"
}


# Iterate through command line inputs
while [ "$1" != "" ]; do
    case $1 in
        -p | --pythondir )      shift
				PYTHON_DIR=$1
                                ;;
        -i | --installdir )     shift
                                INSTALL_DIR=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

if [ $PYTHON_DIR == "_" ] ; then
 echo "You need to provide the directory of the Python you want to use"
 exit
fi


echo "** Remove OpenCV4.1 first"
sudo sudo apt-get purge *libopencv*

echo "** Install requirement"
sudo apt-get update
sudo apt-get install -y build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt-get install -y python3.6-dev python-dev python-numpy python3-numpy
sudo apt-get install -y libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y libv4l-dev v4l-utils qv4l2 v4l2ucp
sudo apt-get install -y curl
sudo apt-get update

echo "** Download opencv-4.4.0"
cd $INSTALL_DIR
curl -L https://github.com/opencv/opencv/archive/4.4.0.zip -o opencv-4.4.0.zip
curl -L https://github.com/opencv/opencv_contrib/archive/4.4.0.zip -o opencv_contrib-4.4.0.zip
unzip opencv-4.4.0.zip
sudo rm opencv-4.4.0.zip
unzip opencv_contrib-4.4.0.zip
sudo rm opencv_contrib-4.4.0.zip
cd opencv-4.4.0/

echo "** Building..."
mkdir release
cd release/
cmake 	-D WITH_CUDA=ON \
	-D ENABLE_PRECOMPILED_HEADERS=OFF \
	-D CUDA_ARCH_BIN="7.2" \
	-D CUDA_ARCH_PTX="" \
	-D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-4.4.0/modules \
	-D WITH_GSTREAMER=ON \
	-D WITH_LIBV4L=ON \
	-D BUILD_opencv_python2=ON \
	-D BUILD_opencv_python3=ON \
	-D BUILD_TESTS=OFF \
	-D BUILD_PERF_TESTS=OFF \
	-D BUILD_EXAMPLES=OFF \
	-D CMAKE_BUILD_TYPE=RELEASE \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D PYTHON_EXECUTABLE=$PYTHON_DIR \
	..
	
make -j8
sudo make install

echo "** Install opencv-4.4.0 successfully"

