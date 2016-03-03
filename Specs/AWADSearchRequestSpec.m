//
//  AWADSearchRequestSpec.m
//  AWAD
//
//  Created by user on 02.03.16.
//  Copyright © 2016 user. All rights reserved.
//


#import "SharingTestingData.h"
#import "AWADSearchRepositoryImpl.h"
#import "AWADSearchService.h"
#import "AWADSearchRequestModel.h"
SpecBegin(AWADSearchRequest)
AWADTestDALAssembly *assembly = [[SharingTestingData sharedInstance] testDALAssembly];

describe(@"Get request for  2505MOWIEV", ^{
    id<AWADSearchRepository> citySuggest = assembly.searchRepository;
    it(@"Should make image from view, save it, read it, delete it", ^{
        waitUntil(^(DoneCallback done) {
            
            [citySuggest searchForText:@"2505MOWIEV"].then(^(id result){
                expect(result).to.beAKindOf([AWADSearchRequestModel class]);
                done();
            }).catch(^(NSError *error){
                expect(error).to.beNil;
            });
        });
    });
});


SpecEnd