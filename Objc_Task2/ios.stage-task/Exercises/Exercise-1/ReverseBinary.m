#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 reverse = 0;
    for (int pos = 7; pos >= 0 && n; pos--) {
        if (n & 1) {
            reverse = reverse | (1 << pos);
        }
        n >>= 1;
    }
    return reverse;
}
