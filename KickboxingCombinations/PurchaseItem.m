//
//  PurchaseItem.m
//  KickboxingCombinations
//
//  Created by Vincent Lee on 2/20/15.
//  Copyright (c) 2015 VincentLee. All rights reserved.
//

#import "PurchaseItem.h"

@implementation PurchaseItem

-(instancetype)initWithName:(NSString *)name sku:(NSString *)sku category:(NSString *)category price:(NSString *)price {
    _name = name;
    _sku = sku;
    _category = category;
    _price = price;
    return self;
}

@end
