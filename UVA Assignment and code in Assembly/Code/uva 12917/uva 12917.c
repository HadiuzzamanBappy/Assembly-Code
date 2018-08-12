#include<stdio.h>
int main()
{
    int p,h,o;
    while(scanf("%d%d%d",&p,&h,&o)==3)
    {
        if(p+h>o)
            printf("Hunters win!\n");
        else
            printf("Props win!\n");
    }
    return 0;
}
