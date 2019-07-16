//
//  VCRoot.h
//  EventResponse
//
//  Created by WingChing Yip on 2019/7/16.
//  Copyright © 2019 WingChing Yip. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "SubView.h"

NS_ASSUME_NONNULL_BEGIN

@interface VCRoot : UIViewController
{
    MainView *_mainView;
    SubView *_subView;
}

@end

NS_ASSUME_NONNULL_END
