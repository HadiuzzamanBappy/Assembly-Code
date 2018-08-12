#include<stdio.h>
int main()
{
    int m,n,temp,i,t=1;
    while(scanf("%d%d",&m,&n)==2)
    {
        if(t==0)
            printf("\n");
        if(m>n){
            temp=m;
            m=n;
            n=temp;
        }
        if(m==n)
            printf("%d\n",m+1);
        else
        for(i=m+1;i<=n+1;i++)
            printf("%d\n",i);
        t=0;
    }
    return 0;
}
