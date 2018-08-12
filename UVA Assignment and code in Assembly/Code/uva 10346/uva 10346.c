#include<stdio.h>
int main()
{
    int a,b,x,z;
    while(scanf("%d%d",&a,&b)!=EOF && b>1)
    {
        int n=a, sum=0;
        while(a>=b){
        z=a/b;
        x=a%b;
        a=z+x;
        sum=sum+z;
        }
        printf("%d\n",sum+n);
    }
    return 0;
}
