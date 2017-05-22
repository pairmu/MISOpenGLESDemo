//
//  DemoView.m
//  OpenGLES
//
//  Created by Mistletoe on 2017/5/22.
//  Copyright © 2017年 Mistletoe. All rights reserved.
//

#import "DemoView.h"

#import <OpenGLES/ES2/gl.h>

@interface DemoView()
@property (nonatomic, strong) EAGLContext *context;

@property (nonatomic, assign) GLuint colorRenderBuffer;
@end

@implementation DemoView

+ (Class)layerClass {
    return [CAEAGLLayer class];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupContext];
        [self setupRenderBuffer];
        [self setupFrameBuffer];
        [self render];
    }
    return self;
}

#pragma mark - Setup Context

- (void)setupContext {
    _context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!_context) {
        NSLog(@"initialize OpenGLES2.0 context failed");
    }
    
    if (![EAGLContext setCurrentContext:_context]) {
        NSLog(@"failed set current context");
    }
}

- (void)setupRenderBuffer {
    glGenBuffers(1, &_colorRenderBuffer);
    glBindRenderbuffer(GL_RENDERBUFFER, _colorRenderBuffer);
    
    [_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:(CAEAGLLayer *)self.layer];
}

- (void)setupFrameBuffer {
    GLuint frameBuffer;
    glGenBuffers(1, &frameBuffer);
    glBindFramebuffer(GL_FRAMEBUFFER, frameBuffer);
    
    // 将 colorRenderBuffer 依附在 frameBuffer 的 GL_COLOR_ATTACHMENT0 位置上
    glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderBuffer);
}

- (void)render {
    glClearColor(0.0f, 0.0f, 1.0f, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);
    
    [_context presentRenderbuffer:GL_RENDERBUFFER];
}
@end
