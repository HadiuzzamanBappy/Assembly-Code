#include<stdio.h>
int main()
{
    int t,sum,n,i,cas=1;
    scanf("%d",&t);
    while(t-->0)
    {
        scanf("%d",&n);
        i=1;
        sum=1;
        while(i!=n)
        {
            sum+=2;
            i++;
        }
        printf("Case #%d: %d\n",cas++,sum);
    }
    return 0;
}
