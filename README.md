# animal social behaviour
狗与人社交各种状态时间的统计

项目总结的是，统计狗行为交互阶段的时间所需的程序。统计时间分别是：亲近人的总时间，亲近饲养员休息的时间，亲近饲养员社交的时间；   亲近陌生人的总时间，
亲近陌生人社交的时间，亲近陌生人休息的时间；  远离人的时间，远离人休息的时间，远离人社交的时间；


 技术难点：  因为使用bonsai得到各段时间，使用像素来定义在哪一个区域（饲养员，陌生人，远离他们），因为场地背景是蓝色不好处理； 另外由于饲养员腿的位置
 造成干扰， 统计时间造成不准确；
 
 
 未来展望： 未来期望使用深度学习的方法，来识别狗的站立和蹲下的状态；站立定义为社交，蹲下定义为休息；以及利用坐标距离确定所在的区域；
 （这种方法比较麻烦，但是更加精确）；
 
 
 将相关的bonsai代码和matlab代码放入相应的文件夹中：
