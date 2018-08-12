#include<stdio.h>
int main()
{
    int a,i;
    long long sum;
    while(scanf("%d",&a)==1)
    {
        sum=1;
        for(i=1;i<=a;i++)
        {
            sum=sum*i;
            while(sum%10==0)
                sum/=10;
                sum%=100000;
        }
        sum=sum%10;
        printf("%5d -> %lld\n",a,sum);
    }
    return 0;
}
