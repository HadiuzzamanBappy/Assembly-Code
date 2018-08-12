#include<stdio.h>
int main()
{
    long int a,b,c,i;
    while(scanf("%ld",&a)!=EOF)
    {
        b=0;
        for(i=1;i<=a;i++)
        {
            c=i*i*i;
            b=b+c;
        }
        printf("%ld\n",b);
    }
    return 0;
}
