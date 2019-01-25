//
//  ViewController.h
//  t115_squircle
//
//  Created by Xiao Yu on 1/24/19.
//  Copyright © 2019 Xiao Yu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

IB_DESIGNABLE
@interface ArcView : UIView

@property(nonatomic) IBInspectable CGFloat radius;
@property(nonatomic) IBInspectable CGSize insets;

@end
