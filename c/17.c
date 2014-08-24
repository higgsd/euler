/* 21124 */
#include <string.h>
#include <stdio.h>

int main(int argc, char **argv)
{
    char *ones[] = {"", "one", "two", "three", "four", "five", "six",
        "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen",
        "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"};
    char *tens[] = {"", "", "twenty", "thirty", "forty",
        "fifty", "sixty", "seventy", "eighty", "ninety"};

    int i, n, s = 0;
    for (i = 1; i <= 1000; i++)
    {
        n = i;
        if (n >= 1000)
        {
            s += strlen(ones[n / 1000]) + strlen("thousand");
            n %= 1000;
        }
        if (n >= 100)
        {
            s += strlen(ones[n / 100]) + strlen("hundred");
            n %= 100;
            if (n > 0)
                s += strlen("and");
        }
        if (n >= 20)
        {
            s += strlen(tens[n / 10]);
            n %= 10;
        }
        s += strlen(ones[n]);
    }
    printf("%d\n", s);
    return 0;
}
