#include<stdio.h>
int main()
{
    long int a;
    while(scanf("%ld",&a)==1 && a>0)
    {
        if(a==1)
            printf("0%%\n");
        else
            printf("%ld%%\n",25*a);
    }
    return 0;
}
