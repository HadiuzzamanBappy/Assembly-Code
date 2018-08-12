#include<stdio.h>
int main()
{
    long long int T,sum,i;
    while(scanf("%lld",&T)==1)
    {
        if(T<0)
            return 0;
        sum=1;
        for(i=0;i<=T;i++)
            sum+=i;
        printf("%lld\n",sum);
    }
    return 0;
}
