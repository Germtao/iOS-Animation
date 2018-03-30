## CAShapeLayer

### 1. 优点

- CAShapeLayer作为继承自CALayer的子类，当然可使用CALayer的所有属性
- CAShapeLayer是一个通过矢量图形而不是位图来绘制的图层子类。指定诸如颜色和线宽等属性，用path来定义想要绘制的图形，最后CAShapeLayer就自动渲染出来了。也就是说，CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形。而且是矢量图形，所以无论有多大，都不会占用太多的内存
- CAShapeLayer使用了硬件加速，绘制同一图形会比用CoreGraphics快很多

### 2. 基本属性

- path：图像的绘制路径，path不支持隐式动画
- fillColor：填充path的颜色，或无填充。默认为不透明黑色
- fillRule：填充path的规则。选项是非零和偶奇。默认为非零
- lineCap：线端点类型
- lineDashPattern：线性模板
- lineDashPhase：线性模板的起点
- lineJoin：线连接类型
- lineWidth：线宽
- miterLimit：最大斜接长度
- strokeColor：描边颜色
- strokeStart：描边起点
- strokeEnd：描边终点
