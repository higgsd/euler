/* 232792560 */
#include <stdio.h>

#define N 20

int isdiv(long long v)
{
    int n;
    for (n = 2; n <= N; n++)
        if (v % n != 0)
            return 0;
    return 1;
}

int main(int argc, char **argv)
{
    int n;
    long long val = 1;
    for (n = 2; n <= N; n++)
        val *= n;
    for (n = 2; n <= N; n++)
        while (isdiv(val / n))
            val /= n;
    printf("%lld\n", val);
    return 0;
}
