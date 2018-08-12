#include<stdio.h>
int main()
{
    int t,i;
    while(scanf("%d",&t)==1 && t!=0)
    {
        int a=0,b=1,sum=0,c;
        for(i=0;i<t;i++)
        {
            c=b;
            b=a+b;
            a=c;
        }
        printf("%d\n",b);
    }
    return 0;
}
