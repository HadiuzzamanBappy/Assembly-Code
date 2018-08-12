#include<stdio.h>
int main()
{
    int t,m,n,x,y;
    while(scanf("%d",&t)==1 && t!=0)
    {
        scanf("%d%d",&m,&n);
        while(t-->0)
        {
            scanf("%d%d",&x,&y);
            if(x==m || y==n)
                printf("divisa\n");
            else if(x>m && y>n)
                printf("NE\n");
            else if(x>m && y<n)
                printf("SE\n");
            else if(x<m && y>n)
                printf("NO\n");
            else if(x<m && y<n)
                printf("SO\n");
        }
    }
    return 0;
}
