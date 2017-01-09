* Build LLVM RPMs

```
make sources llvm=latest-stable system=centos6
```

* How to build  

```
docker build --tag llvm-centos6:latest docker/centos6 --build-arg llvm-version=latest-stable
```

Available llvm-version:

* latest-stable
* latest-trunk
* 3.8.0
* 3.8.1
* 3.9.0
* 3.9.1