# 带ssh的lede docker 编译环境

综合了吸收了ws01/ubuntu-sshd，rastasheep/ubuntu-sshd，hanxi/lede-docker-builder等docker项目

### 使用命令

来自ws01：
```
docker run -d -v /tmp/.X11-unix:/tmp/.X11-unix -v 自己的目录:/home/123 -p 22:22 -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE registry.cn-hangzhou.aliyuncs.com/muxinghe/ubuntu-sshd-lede:latest
```

或

```
docker run -d -v /tmp/.X11-unix:/tmp/.X11-unix -v 自己的目录:/home/123 -p 22:22 -e DISPLAY=unix$DISPLAY -e GDK_SCALE -e GDK_DPI_SCALE muxinghe/ubuntu-ssh-lede:latest
```
自用的命令：

```
docker run -d --name ubuntu-sshd-lede -v 自己的目录:/home/123 -p 22:22 registry.cn-hangzhou.aliyuncs.com/muxinghe/ubuntu-sshd-lede:latest
```
或
```
docker run -d --name ubuntu-sshd-lede -v 自己的目录:/home/123 -p 22:22 muxinghe/ubuntu-sshd-lede:latest
```


### lede编译

可通过ssh连接到docker，或使用

```
docker exec -it ubuntu-sshd-lede /bin/bash
```

然后按照 [lean](https://github.com/coolsnowwolf/lede) 的教程编译
