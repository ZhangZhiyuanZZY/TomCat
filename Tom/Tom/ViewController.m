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
    [self setupImage:@"knockout_" count:81];
}
- (IBAction)clickStomachBtn:(id)sender {
    [self setupImage:@"stomach_" count:34];
}

//设置图片动画
- (void)setupImage:(NSString *)imageName count:(int)imageCount
{
    //数组
    NSMutableArray *array = [NSMutableArray array];
    
    //循环遍历设置图片放入数组
    for (int i = 0; i < imageCount ; i++ ) {
        NSString *imageString = [NSString stringWithFormat:@"%@%02d", imageName, i];
        UIImage *image = [UIImage imageNamed:imageString];
        [array addObject:image];
    }
    //设置动画
    self.tomCatImgview.animationImages = array;
    self.tomCatImgview.animationDuration = imageCount / 12;
    self.tomCatImgview.animationRepeatCount = 1;
    [self.tomCatImgview startAnimating];
}

@end
