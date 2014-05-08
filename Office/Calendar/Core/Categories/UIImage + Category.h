//
//  UIImage + Category.h
//  Office
//
//  Created by 东华创元 on 14-5-8.
//  Copyright (c) 2014年 东华创元. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)

- (UIImage*) imageNamed:(NSString*)path;

- (UIImage *) imageCroppedToRect:(CGRect)rect;

- (UIImage *) squareImage;

/*****************
 @return An image with the applied lighting effect.
 *****************/
- (UIImage *) imageByApplyingLightEffect;

/*****************
 @return An image with the applied lighting effect.
 *****************/
- (UIImage *) imageByApplyingExtraLightEffect;

/*****************
 @param blurRadius the blur radius applied to the image
 @param saturation The saturation change applied to the original image. 1.0 is the default.
 @return An image with the applied lighting effect.
 *****************/
- (UIImage*) imageByApplyingDarkEffectWithBlurRadius:(CGFloat)blurRadius saturationFactor:(CGFloat)saturation;

/*****************
 @return An image with the applied lighting effect.
 *****************/
- (UIImage *) imageByApplyingDarkEffect;

/*****************
 @param tintColor The color that will applied to the image. For subtle changes, make sure the alpha of the color is less than 1.
 @return An image with the applied lighting effect.
 *****************/
- (UIImage *) imageByApplyingTintEffectWithColor:(UIColor *)tintColor;

/*****************
 @param blurRadius the blur radius applied to the image
 @param tintColor The color that will applied to the image. For subtle changes, make sure the alpha of the color is less than 1.
 @param saturationDeltaFactor The saturation change applied to the original image. 1.0 is the default.
 @param maskImage The mask image applied to the original image.
 *****************/
- (UIImage *) imageByApplyingBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;
@end
