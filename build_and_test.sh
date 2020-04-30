#! /bin/bash -e

SCRIPT_DIR="$( cd "$(dirname "$0")" ; pwd -P )"
cd ${SCRIPT_DIR}


make clean
make -j4
echo "finished build"

make tests
echo "finished unit tests"

# TODO(clang): add other tests
#sudo pip install cffi hypothesis colorama
#make test_fuzzer
#make test_virtraft
#echo "finished emulation tests"

sudo mkdir -p /usr/include/raft/
sudo cp include/* /usr/include/raft/
sudo cp libraft.a /usr/lib
sudo cp libraft.so /usr/lib
echo "finished installation"
