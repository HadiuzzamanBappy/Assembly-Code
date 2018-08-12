#include<stdio.h>
int main()
{
    int ti,i,m,b,w,a,t,cas=1;
    char n;
    scanf("%d",&ti);
    while(ti-->0)
    {
        b=0;
        w=0;
        t=0;
        a=0;
        scanf("%d",&m);
        for(i=0; i<=m; i++)
        {
            scanf("%c",&n);
            switch (n)
            {
            case 'B':
                b++;
                break;
            case 'W':
                w++;
                break;
            case 'T':
                t++;
                break;
            case 'A':
                a++;
                break;
            }
        }
            if(b==0 && w==0 && a==m)
                printf("Case %d: ABANDONED\n",cas++);
            else if(w==0 && t==0)
                printf("Case %d: BANGLAWASH\n",cas++);
            else if(b==0 && t==0)
                printf("Case %d: WHITEWASH\n",cas++);
            else if(b>w)
                printf("Case %d: BANGLADESH %d - %d\n",cas++,b,w);
            else if(b<w)
                printf("Case %d: WWW %d - %d\n",cas++,w,b);
            else if(b==w)
                printf("Case %d: DRAW %d %d\n",cas++,b,t);
    }
    return 0;
}
