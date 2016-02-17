//
//  QRCodeView.m
//  FakeBear
//
//  Created by 郑先生 on 16/2/17.
//  Copyright © 2016年 郑先生. All rights reserved.
//

#import "QRCodeView.h"
#import <AVFoundation/AVFoundation.h>

@interface QRCodeView() <AVCaptureMetadataOutputObjectsDelegate>

@property (strong,nonatomic) AVCaptureDevice *device;
@property (strong,nonatomic) AVCaptureDeviceInput *input;
@property (strong,nonatomic) AVCaptureMetadataOutput *output;
@property (strong,nonatomic) AVCaptureSession *session;
@property (strong,nonatomic) AVCaptureVideoPreviewLayer *preview;

@end

@implementation QRCodeView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor blackColor];
        [self.layer addSublayer:self.preview];
    }
    return self;
}

- (void)start
{
    [self.session startRunning];
}

#pragma mark - AVCaptureMetadataOutputObjects Delegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0)
    {
        [self.session stopRunning];
        [self.delegate qrCodeView:self didCatchCodeString:[metadataObjects.firstObject stringValue]];
    }
}

#pragma mark - getters

- (AVCaptureDevice *)device
{
    if (!_device) {
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    return _device;
}

- (AVCaptureDeviceInput *)input
{
    if (!_input) {
        _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    }
    return _input;
}

- (AVCaptureMetadataOutput *)output
{
    if (!_output) {
        _output = [[AVCaptureMetadataOutput alloc] init];
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    }
    return _output;
}

- (AVCaptureSession *)session
{
    if (!_session) {
        _session = [[AVCaptureSession alloc] init];
        _session.sessionPreset = AVCaptureSessionPresetHigh;
        if ([_session canAddInput:self.input]) {
            [_session addInput:self.input];
        }
        if ([_session canAddOutput:self.output]) {
            [_session addOutput:self.output];
        }
        self.output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    }
    return _session;
}

- (AVCaptureVideoPreviewLayer *)preview
{
    if (!_preview) {
        _preview = [AVCaptureVideoPreviewLayer layerWithSession:self.session];
        _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _preview.frame = self.bounds;
    }
    return _preview;
}

@end
