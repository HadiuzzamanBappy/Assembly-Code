#include<stdio.h>
int main()
{
    int i,j,a,b,c,d,e;
    while(scanf("%d",&a)==1)
    {
        for(i=0;i<a;i++)
        {
            int sum=0;
            scanf("%d",&b);
            for(j=0;j<b;j++)
            {
                scanf("%d%d%d",&c,&d,&e);
                sum=sum+(c*e);
            }
            printf("%d\n",sum);
        }
    }
    return 0;
}
