#include<bits/stdc++.h>
using namespace std;
int main()
{
    int a,b;
    while(cin>>a>>b)
    {
        if(a==0 && b==0)
            cout<<0<<"\n";
        else
            cout<<2*a*b<<"\n";
    }
}
