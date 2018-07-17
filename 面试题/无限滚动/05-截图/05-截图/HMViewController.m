//
//  HMViewController.m
//  05-截图
//
//  Created by apple on 14-7-29.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HMViewController.h"

@interface HMViewController ()

@end

@implementation HMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 1.开启图形上下文
    CGSize imageSize = self.view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    // 2.将某个view的所有内容渲染到图形上下文中
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    
    // 3.取得图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGImageRef subimageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, 640, 480));
    UIImage *subImage = [UIImage imageWithCGImage:subimageRef];
    [UIImagePNGRepresentation(subImage) writeToFile:@"/Users/apple/Desktop/view.png" atomically:YES];
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
}

@end
