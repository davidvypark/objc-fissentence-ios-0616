//
//  FISSentence.m
//  objc-fissentence
//
//  Created by David Park on 6/9/16.
//  Copyright © 2016 The Flatiron School. All rights reserved.
//

#import "FISSentence.h"

@interface FISSentence()

@property (strong, nonatomic, readwrite)NSString *sentence;
@end


//These are private methods

@implementation FISSentence


-(void)assembleSentence{
        
    self.sentence = [[self.words componentsJoinedByString:@" "] mutableCopy];
    self.sentence = [self.sentence stringByAppendingString:self.punctuation];
    
}



-(BOOL)validWord:(NSString *)word{
    
    if ([word isEqualToString:@""] || [word isEqualToString:@" "] || word == nil){
        return FALSE;
    }

    return TRUE;
}



-(BOOL)validPunctuation:(NSString *)punctuation{
    
    NSString *punctuationString = @"//.?!,;:-";
    
    if(punctuation != nil) {
        if ([punctuationString containsString:punctuation]) {
            return YES;
        }
    }
    return NO;
}



-(BOOL)validIndex:(NSUInteger)index{
    
    if (index <[self.words count]) {
        return YES;
    }
    
    return NO;
}




//These are public methods

-(void)addWord:(NSString *)word{
   
    if([self validWord:word]){
        [self.words addObject:word];
    }
    NSLog(@"\n\n\n\nSELF.WORDS = %@\n\n\n\n", self.words);
    
    [self assembleSentence];
}



-(void)addWords:(NSArray *)words withPunctuation:(NSString *)punctuation{
    
    if ([self validPunctuation:punctuation] && [words count] != 0) {
        for (NSString *element in words) {
            if ([self validWord:element]) {
                [self.words addObject:element];
                [self replacePunctuationWithPunctuation:punctuation];
            }
        }
    }
    
    [self assembleSentence];
}



-(void)removeWordAtIndex:(NSUInteger)index{
    
    if([self validIndex:index]) {
    
        [self.words removeObjectAtIndex:index];
    
    }
    
    [self assembleSentence];
}



-(void)insertWord:(NSString *)word atIndex:(NSUInteger)index{
    
    if ([self validIndex:index] && [self validWord:word]) {
        
        [self.words insertObject:word atIndex:index];
    }
    
    
    [self assembleSentence];
}



-(void)replacePunctuationWithPunctuation:(NSString *)punctuation{
    
    if([self validPunctuation:punctuation]) {
        
        self.punctuation = punctuation;
    }
    
    [self assembleSentence];
}



-(void)replaceWordAtIndex:(NSUInteger)index withWord:(NSString *)word{
    
    if([self validWord:word] && [self validIndex:index]) {
        
        [self.words replaceObjectAtIndex:index withObject:word];
    }
    
    [self assembleSentence];
}


@end
