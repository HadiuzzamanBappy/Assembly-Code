#include<stdio.h>
int main()
{
    int sum,i,a,b;
    while(scanf("%d",&a)==1)
    {
        sum=0;
        for(i=0;i<5;i++)
        {
            scanf("%d",&b);
            if(a==b)
                sum++;
        }
        printf("%d\n",sum);
    }
    return 0;
}
