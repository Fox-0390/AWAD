//
//  AWADCitySuggestsSpec.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//


#import "SharingTestingData.h"
#import "AWADCitySuggestRepository.h"
#import "AWADCitySuggestResult.h"
SpecBegin(AWADCitySuggest)

AWADTestDALAssembly *assembly = [[SharingTestingData sharedInstance] testDALAssembly];
describe(@"Get City for letter Mo", ^{
    id<AWADCitySuggestRepository> citySuggest = assembly.citySuggestsRepository;
    it(@"Should make image from view, save it, read it, delete it", ^{
        waitUntil(^(DoneCallback done) {
        
        [citySuggest suggestCityForText:@"kiev"].then(^(id result){
            expect(result).to.beAKindOf([AWADCitySuggestResult class]);
            AWADCitySuggestResult *suggestResult = result;
            expect(suggestResult.items).toNot.beNil;
            done();
        }).catch(^(NSError *error){
            expect(error).to.beNil;
        });
        });
    });
});
SpecEnd