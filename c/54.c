/* 376 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "euler.h"

#define N 1000
#define C 13
#define H 5
#define P 2

char card2val(char card)
{
    if (card >= '2' && card <= '9')
        return card - '2';
    if (card == 'T')
        return 8;
    if (card == 'J')
        return 9;
    if (card == 'Q')
        return 10;
    if (card == 'K')
        return 11;
    if (card == 'A')
        return 12;
    return -1;
}

int is_flush(char *suits)
{
    int i;
    for (i = 1; i < H; i++)
        if (suits[i] != suits[0])
            return 0;
    return 1;
}

int is_straight(char *vals)
{
    int i;
    for (i = 1; i < H; i++)
        if (vals[i] != vals[0] + i)
            return 0;
    return 1;
}

void get_kinds(char *vals, char *counts, char *cvals)
{
    int i, j, n;
    char c[C] = {0};

    for (i = 0; i < H; i++)
    {
        cvals[i] = -1;
        counts[i] = 0;
        c[(int)vals[i]]++;
    }
    j = 0;
    for (n = 4; n >= 1; n--)
    {
        for (i = C-1; i >= 0; i--)
        {
            if (c[i] == n)
            {
                cvals[j] = i;
                counts[j++] = n;
            }
        }
    }
}

int cmp_kinds(char *c1, char *v1, char *c2, char *v2)
{
    int i;
    for (i = 0; i < H; i++)
    {
        if (c1[i] != c2[i])
            return c1[i] - c2[i];
        if (v1[i] != v2[i])
            return v1[i] - v2[i];
    }
    return 0;
}

void sort(char *vals)
{
    char t;
    int i, j;
    for (i = 0; i < H; i++)
    {
        for (j = i + 1; j < H; j++)
        {
            if (vals[i] > vals[j])
            {
                t = vals[i];
                vals[i] = vals[j];
                vals[j] = t;
            }
        }
    }
}

int main(int argc, char **argv)
{
    int h, p, c, m;
    char *tok, *tmp;
    char vals[P][H], suits[P][H];
    int flush[P], straight[P], win;
    char counts[P][H], cvals[P][H];
    char *input= load_file("../poker.txt");

    m = 0;
    tok = strtok_r(input, " \r\n", &tmp);
    for (h = 0; h < N; h++)
    {
        for (p = 0; p < P; p++)
        {
            for (c = 0; c < H; c++)
            {
                vals[p][c] = card2val(tok[0]);
                suits[p][c] = tok[1];
                tok = strtok_r(NULL, " \r\n", &tmp);
            }
            sort(vals[p]);
            flush[p] = is_flush(suits[p]);
            straight[p] = is_straight(vals[p]);
            get_kinds(vals[p], counts[p], cvals[p]);
        }
        win = cmp_kinds(counts[0], cvals[0], counts[1], cvals[1]) > 0;

        if (flush[1] && straight[1])
        {
            if (flush[0] && straight[0] && win)
                m++;
        }
        else if (flush[0] && straight[0])
            m++;
        else if (counts[1][0] == 4)
        {
            if (counts[0][0] == 4 && win)
                m++;
        }
        else if (counts[0][0] == 4)
            m++;
        else if (counts[1][0] == 3 && counts[1][1] == 2)
        {
            if (counts[0][0] == 3 && counts[0][1] == 2 && win)
                m++;
        }
        else if (counts[0][0] == 3 && counts[0][1] == 2)
            m++;
        else if (flush[1])
        {
            if (flush[0] && win)
                m++;
        }
        else if (flush[0])
            m++;
        else if (straight[1])
        {
            if (straight[0] && win)
                m++;
        }
        else if (straight[0])
            m++;
        else if (counts[1][0] == 3)
        {
            if (counts[0][0] == 3 && win)
                m++;
        }
        else if (counts[0][0] == 3)
            m++;
        else if (counts[1][0] == 2 && counts[1][1] == 2)
        {
            if (counts[0][0] == 2 && counts[0][1] == 2 && win)
                m++;
        }
        else if (counts[0][0] == 2 && counts[0][1] == 2)
            m++;
        else if (win)
            m++;
    }
    printf("%d\n", m);
    free(input);
    return 0;
}
