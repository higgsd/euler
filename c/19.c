/* 171 */
#include <stdio.h>

int main(int argc, char **argv)
{
    /*            j   f   m   a   m   j   j   a   s   o   n   d */
    int days[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    int sundays = 0;
    int weekday = 1;
    int year, month;
    for (year = 1900; year < 2001; year++)
    {
        for (month = 0; month < 12; month++)
        {
            if (year >= 1901 && weekday == 0)
                sundays++;
            weekday += days[month];
            if (month == 1 && year % 4 == 0 &&
                    (year % 100 != 0 || year % 400 == 0))
                weekday++;
            weekday %= 7;
        }
    }
    printf("%d\n", sundays);
    return 0;
}
