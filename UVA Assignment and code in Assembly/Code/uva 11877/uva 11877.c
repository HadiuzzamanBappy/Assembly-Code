#include<stdio.h>
int main()
{
    int a,b,c,sum;
    while(scanf("%d",&a)==1 && a!=0)
    {
        sum=0;
        while(a>0){
        b=a/3;
        c=a%3;
        a=b+c;
        sum=sum+b;
        if(a==2 || a==1)
        {
            if(a==2)
                 a+=1;
            else
                break;
        }
        }
        printf("%d\n",sum);
    }
    return 0;
}
