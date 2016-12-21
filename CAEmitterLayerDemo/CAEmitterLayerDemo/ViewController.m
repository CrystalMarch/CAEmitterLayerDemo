//
//  ViewController.m
//  CAEmitterLayerDemo
//
//  Created by 朱慧平 on 16/12/21.
//  Copyright © 2016年 Crystal. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.view addSubview:containerView];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = containerView.bounds;
    [containerView.layer addSublayer:emitter];
    /*
     emitter的emitterShape属性:
     常用到的有三种:
     
     kCAEmitterLayerPoint 将所有的粒子集中在position的位置,可用来做火花爆炸效果
     kCAEmitterLayerLine 所有的粒子位于一条线上,可用来作瀑布效果,下雪效果
     kCAEmitterLayerRectangle 所有粒子随机出现在所给定的矩形框内
     */
    emitter.emitterShape = kCAEmitterLayerPoint;
    //configure emitter
    emitter.renderMode = kCAEmitterLayerAdditive;
    //
    emitter.emitterPosition = CGPointMake(emitter.frame.size.width / 2.0, emitter.frame.size.height / 2.0);
    
    //create a particle template
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
//    contents：是个CGImageRef的对象,既粒子要展现的图片；
    cell.contents = (__bridge id)[UIImage imageNamed:@"fullvideo_level_star_yellow"].CGImage;
//    birthrate：粒子参数的速度乘数因子；每秒发射的粒子数量
    cell.birthRate = 50;
//    lifetime：生命周期
    cell.lifetime = 5.0;
//    color:粒子的颜色
    cell.color = [UIColor colorWithRed:1 green:0.5 blue:0.1 alpha:1.0].CGColor;
//    alphaSpeed:粒子透明度在生命周期内的改变速度；
    cell.alphaSpeed = -0.4;
//    velocity：速度
    cell.velocity = 50;
//    spin:自旋转速度
    cell.spin = 5;
//    velocityRange：速度范围
    cell.velocityRange = 200;
//    emissionRange；周围发射角度
    cell.emissionRange = M_PI * 2.0;
    // 给微粒设置一个发射角度
//    cell.emissionLongitude = -M_PI;
//    // 制造一个y轴的加速度
//    cell.yAcceleration = 70.0;
//    // 制造一个x轴的加速度
//    cell.xAcceleration = 10.0;
    //add particle template to emitter emitterCells：粒子发射的粒子
    emitter.emitterCells = @[cell];
    
//    // 添加随机的速度,如果有velocity,那么范围为 -180 ~ 220
//    cell.velocityRange = 200.0;
//    cell.emissionRange = M_PI_2;
//    
//    cell.lifetimeRange = 18;
//    
//    //    emitterCell.color = UIColor(red: 0.9, green: 1.0, blue: 1.0, alpha: 1.0).CGColor
//    // 值为0.3 的范围为 0.7~1.3,但由于高于1算1,所以值得范围为 0.7~1
//    cell.redRange = 0.3;
//    cell.greenRange = 0.3;
//    cell.blueRange = 0.3;
//    // 随机大小
//    cell.scaleRange = 0.8;
//    // 每秒缩小15%
//    cell.scaleSpeed = -0.05;
//    
//    cell.alphaRange = 0.75;
//    cell.alphaSpeed = -0.15;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
