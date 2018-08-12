#include<stdio.h>
int main()
{
    int t,a,b,i,j,k,l;
    while(scanf("%d",&t)==1)
    {
        for(k=1; k<=t; k++)
        {
            scanf("%d%d",&a,&b);
            for(l=1; l<=b; l++)
            {
                for(j=1; j<=a; j++)
                {
                    for(i=1; i<=j; i++)
                    {
                        printf("%d",j);
                    }
                    printf("\n");
                }
                for(j=a-1; j>=1; j--)
                {
                    for(i=1; i<=j; i++)
                    {
                        printf("%d",j);
                    }
                    printf("\n");
                }
                if(k!=t || l!=b)
                    printf("\n");
            }
        }
    }
    return 0;
}
