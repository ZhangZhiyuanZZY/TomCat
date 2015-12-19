//
//  ViewController.m
//  Tom
//
//  Created by 章芝源 on 15/12/19.
//  Copyright © 2015年 ZZY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomCatImgview;
@property (weak, nonatomic) IBOutlet UIButton *headerBtn;
@property (weak, nonatomic) IBOutlet UIButton *stomach;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clickHeaderBtn:(id)sender {
    [self setupImage:@"knockout" count:81];
}
- (IBAction)clickStomachBtn:(id)sender {
    [self setupImage:@"stomach" count:34];
}

//设置图片动画
- (void)setupImage:(NSString *)imageName count:(int)imageCount
{
    //图片正在播放, 返回
    if (self.tomCatImgview.isAnimating) {
        return;
    }
    
    //数组
    NSMutableArray *array = [NSMutableArray array];
    
    //循环遍历设置图片放入数组
    for (int i = 0; i < imageCount ; i++ ) {
        NSString *imageString = [NSString stringWithFormat:@"%@_%02d", imageName, i];
        //加载对应图片
        NSString *path = [[NSBundle mainBundle] pathForResource:imageString ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        [array addObject:image];
    }
    //设置动画
    self.tomCatImgview.animationImages = array;
    self.tomCatImgview.animationDuration = imageCount / 12;
    self.tomCatImgview.animationRepeatCount = 1;
    [self.tomCatImgview startAnimating];
    
    
    [self.tomCatImgview performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.tomCatImgview.animationDuration + 0.01];
}

@end
