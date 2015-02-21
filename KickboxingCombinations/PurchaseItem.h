//
//  PurchaseItem.h
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/20/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PurchaseItem : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *sku;
@property (strong, nonatomic) NSString *category;
@property (strong, nonatomic) NSString *price;


-(instancetype)initWithName:(NSString *)name sku:(NSString *)sku category:(NSString *)category price:(NSString *)price;

@end
