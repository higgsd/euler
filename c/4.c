/* 906609 */
#include <string.h>
#include <stdio.h>

#define P 3
#define B 999
#define A (B+1)/10

int main(int argc, char **argv)
{
    char s1[P*2+1], s2[P*2+1];
    int i, j, k, len, m = 0;

    for (i = A; i <= B; i++)
    {
        for (j = i; j <= B; j++)
        {
            if (i * j > m)
            {
                sprintf(s1, "%d", i * j);
                len = strlen(s1);
                s2[len] = '\0';
                for (k = 0; k < len; k++)
                    s2[len - k - 1] = s1[k];
                if (strcmp(s1, s2) == 0)
                    m = i * j;
            }
        }
    }
    printf("%d\n", m);
    return 0;
}
