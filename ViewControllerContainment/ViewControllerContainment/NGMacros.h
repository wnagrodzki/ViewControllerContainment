/** Define NG_DEBUG_LEVEL preprocessor macro to turn NGLog on */

#if !defined(NG_DEBUG_LEVEL) || NG_DEBUG_LEVEL == 0
#define NGLog(...)
#define NGLogMessage()

#elif NG_DEBUG_LEVEL == 1
#define NGLog(...) NSLog(__VA_ARGS__)
#define NGLogMessage() NSLog(@"%@", NSStringFromSelector(_cmd))

#elif NG_DEBUG_LEVEL > 1
#define NGLog( s, ... ) NSLog( @"%s : %@", __PRETTY_FUNCTION__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define NGLogMessage() NSLog(@"%s", __PRETTY_FUNCTION__)

#endif