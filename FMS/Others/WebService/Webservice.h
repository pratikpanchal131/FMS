//
//  Webservice.h
//  Nobby
//
//  Created by ind563 on 7/21/14.
//  Copyright (c) 2014 Indianic. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Webservice : NSObject
{
    NSDictionary *dictDownload;
}
@property(nonatomic,copy)NSDictionary *dictMetaData;
-(void)callWebserviceWithURL:(NSString *)aStrURL withSilentCall:(BOOL)boolIsSilent withParams:(NSDictionary *)aDict forViewController:(UIViewController*)aVCObj withCompletionBlock:(void(^)(NSDictionary * responseData))completionBlock withFailureBlock:(void(^)(NSError * error))failureBlock;

-(void)callWebserviceToUploadImageWithURL:(NSString *)aStrURL withSilentCall:(BOOL)boolIsSilent withParams:(NSMutableDictionary *)aDict forViewController:(UIViewController*)aVCObj withCompletionBlock:(void(^)(NSDictionary * responseData))completionBlock withFailureBlock:(void(^)(NSError * error))failureBlock;

-(void)callWebserviceWithGET:(NSString *)aStrURL withSilentCall:(BOOL)boolIsSilent withParams:(NSDictionary *)aDict forViewController:(UIViewController*)aVCObj withCompletionBlock:(void(^)(NSDictionary * responseData))completionBlock withFailureBlock:(void(^)(NSError * error))failureBlock;

@end
