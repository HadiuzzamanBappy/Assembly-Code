#include<stdio.h>
int main()
{
    int a,b,n,i,value;
    while(scanf("%d",&n)!=EOF)
    {
        value=n;
        for(i=1; value>i; i++)
            value-=i;
        if(i%2==1)
            a=1+i-value;
        else
            a=value;
        b=i-a+1;
        printf("TERM %d IS %d/%d\n",n,a,b);
    }
    return 0;
}
