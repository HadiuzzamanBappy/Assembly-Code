#include<stdio.h>
int main()
{
    int a,b[1000],c,i,j,d;
    while(scanf("%d",&a)!=EOF)
    {
        d=0;
        for(i=0; i<a; i++)
            scanf("%d",&b[i]);
        for(i=1; i<a; i++)
            for(j=0; j<a-1; j++)
            {
                if(b[j]>b[j+1])
                {
                    c=b[j];
                    b[j]=b[j+1];
                    b[j+1]=c;
                    d++;
                }
            }
        printf("Minimum exchange operations : %d\n",d);
    }
    return 0;
}
