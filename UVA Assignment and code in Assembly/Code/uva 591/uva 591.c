#include<stdio.h>
int main()
{
    int T,sum,sum2,i,n,m,j=1;
    while(scanf("%d",&T)==1 && T!=0)
    {
        sum=0;
        sum2=0;
        int a[T];
        for(i=0; i<T; i++)
        {
            scanf("%d",&a[i]);
            sum+=a[i];
        }
        n=sum/T;
        for(i=0; i<T; i++)
        {
            if(a[i]>n)
            {
                m=a[i]-n;
                sum2+=m;
            }
        }
        printf("Set #%d\nThe minimum number of moves is %d.\n\n",j,sum2);
        j++;
    }
    return 0;
}
