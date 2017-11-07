
#import <Foundation/Foundation.h>


@class  JWAuthors, JWProgrammers, JWMusicians;

/**======= <#description#> ========*/
@interface Person : NSObject

/** <#description#> */
@property (nonatomic, strong) NSArray* authors;

/** <#description#> */
@property (nonatomic, strong) NSArray* programmers;

/** <#description#> */
@property (nonatomic, strong) NSArray* musicians;

@end

/**======= <#description#> ========*/
@interface JWAuthors : NSObject

/** <#description#> */
@property (nonatomic, copy) NSString* firstName;

/** <#description#> */
@property (nonatomic, copy) NSString* genre;

/** <#description#> */
@property (nonatomic, copy) NSString* lastName;

@end

/**======= <#description#> ========*/
@interface JWProgrammers : NSObject

/** <#description#> */
@property (nonatomic, copy) NSString* firstName;

/** <#description#> */
@property (nonatomic, copy) NSString* email;

/** <#description#> */
@property (nonatomic, copy) NSString* lastName;

@end

/**======= <#description#> ========*/
@interface JWMusicians : NSObject

/** <#description#> */
@property (nonatomic, copy) NSString* firstName;

/** <#description#> */
@property (nonatomic, copy) NSString* instrument;

/** <#description#> */
@property (nonatomic, copy) NSString* lastName;

@end
