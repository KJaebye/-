# 具身智能教材六、七章节代码 EmbodiedAI-6-7-Codes
使用即用即弃的docker containner和脚本运行的形式以简化代码复现的难度。

## 第六章
### NerveNet 实验

首先在chapter-6文件夹中运行`download_docker_image.sh`:
```shell
sh download_docker_image.sh
```
然后运行训练脚本`run_docker_script.sh`，后缀输入命令与参数来分别对应不同的实验：
```shell
sh run_docker_script.sh {nervenet官网运行命令}
```
运行命令可以在https://github.com/WilsonWangTHU/NerveNet找到。
例如：
```shell
sh run_docker_script.sh python main.py --task ReacherOne-v1 --use_gnn_as_policy 1 --network_shape 64,64 --lr 0.0003 --num_threads 4 --lr_schedule adaptive --max_timesteps 1000000 --use_gnn_as_value 0 --gnn_embedding_option noninput_shared --root_connection_option nN,Rn,uE --gnn_node_option nG,nB
```
类似的，运行脚本`run_docker_script.sh`，查看训练曲线：
```shell
sh run_docker_script tensorboard --logdir=$(pwd)/dict-to-tb --port 6006
```

## 第七章
### 形态参数的优化
首先在终端cd到`co-evo`文件夹，并运行`build_docker_image.sh`：
```shell
sh build_docker_image.sh
```
然后运行训练脚本`run_docker_script.sh`，后缀输入命令与参数来分别对应不同的实验：
```shell
sh run_docker_script.sh {astool官网运行命令}
```
运行命令可以在https://github.com/hardmaru/astool找到。
例如：
训练`augmentbipedhard`任务
```shell
sh run_docker_script.sh python train.py augmentbipedhard -n 40 -e 10 -t 2
```
加载`augmentbipedhard`已经训练好的模型并运行可视化展示：
```shell
sh run_docker_script.sh python model.py augmentbipedhard zoo/augmentbipedhard.json
```
### 形态结构的优化