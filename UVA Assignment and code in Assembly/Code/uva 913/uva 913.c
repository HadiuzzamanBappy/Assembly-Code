#include<stdio.h>
int main()
{
    long long int n;
    while(scanf("%lld",&n)==1)
    {
        long long int i,j=1,finall,sum=0,k;
        for(i=1;i<n;i+=2)
            j++;
        finall=(j*i)+j-1;
        for(k=1;k<=3;k++)
        {
            sum=sum+finall;
            finall-=2;
        }
        printf("%lld\n",sum);
    }
    return 0;
}
