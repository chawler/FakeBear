//
//  QRCodeView.h
//  FakeBear
//
//  Created by 郑先生 on 16/2/17.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "BaseView.h"

@class QRCodeView;

@protocol QRCodeViewDelegate <NSObject>

- (void)qrCodeView:(QRCodeView *)qrCodeView didCatchCodeString:(NSString *)codeString;

@end

@interface QRCodeView : BaseView

@property (nonatomic, weak) id<QRCodeViewDelegate> delegate;

- (void)start;

@end
