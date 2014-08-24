/* 871198282 */
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "tree.h"
#include "euler.h"

struct name
{
    RB_ENTRY(name) next;
    char *name;
};
RB_HEAD(name_list, name);

int cmp_name(struct name *a, struct name *b)
{
    return strcmp(a->name, b->name);
}

RB_GENERATE(name_list, name, next, cmp_name);

int main(int argc, char **argv)
{
    struct name *n;
    struct name_list names;

    char *input = load_file("../names.txt");
    RB_INIT(&names);

    char *tok, *tmp;
    tok = strtok_r(input, ",", &tmp);
    while (tok != NULL)
    {
        tok[strlen(tok) - 1] = '\0';
        tok[0] = '\0';
        n = malloc(sizeof(*n));
        n->name = strdup(tok + 1);
        RB_INSERT(name_list, &names, n);
        tok = strtok_r(NULL, ",", &tmp);
    }
    free(input);

    int i, s = 0, nn = 1;
    RB_FOREACH(n, name_list, &names)
    {
        int v = 0;
        for (i = 0; i < strlen(n->name); i++)
            v += n->name[i] - 'A' + 1;
        s += v * nn;
        nn++;
    }
    printf("%d\n", s);

    while (!RB_EMPTY(&names))
    {
        n = RB_MIN(name_list, &names);
        RB_REMOVE(name_list, &names, n);
        free(n->name);
        free(n);
    }
    return 0;
}
