//
//  AWADTicketsSpec.m
//  AWAD
//
//  Created by user on 03.03.16.
//  Copyright © 2016 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AWADTicketsServiceImpl.h"
#import "AWADTicketsRepositoryImpl.h"
#import "SharingTestingData.h"
SpecBegin(AWADTicketsSpec)

AWADTestDALAssembly *assembly = [[SharingTestingData sharedInstance] testDALAssembly];

describe(@"Get request for  o5e0rId5zsvk04 repository", ^{
    id<AWADTicketsRepository> ticketRepository = assembly.ticketsRepository;
    it(@"Should get json for R=o5e0rId5zsvk04", ^{
        waitUntil(^(DoneCallback done) {
            
            [ticketRepository ticketsForString:@"o5e0rId5zsvk04"].then(^(id result){
//                expect(result).to.beAKindOf([AWADSearchRequestModel class]);
                done();
            }).catch(^(NSError *error){
                expect(error).to.beNil;
            });
        });
    });
});
describe(@"Get request for  o5e0rId5zsvk04 service", ^{
    id<AWADTicketsService> ticketService = assembly.ticketsService;
    fit(@"Should get json for R=o5e0rId5zsvk04", ^{
        waitUntil(^(DoneCallback done) {
            
            [ticketService ticketsForString:@"o5e0rId5zsvk04"].then(^(id result){
                //                expect(result).to.beAKindOf([AWADSearchRequestModel class]);
                done();
            }).catch(^(NSError *error){
                expect(error).to.beNil;
            });
        });
    });
});



SpecEnd