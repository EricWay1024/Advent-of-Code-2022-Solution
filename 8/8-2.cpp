#include<algorithm>
#include<bitset>
#include<cmath>
#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<ctime>
#include<deque>
#include<iostream>
#include<map>
#include<queue>
#include<set>
#include<stack>
#include<string>
// #include<unordered_map>
#include<utility>
#include<vector>
#include<numeric>
#include<functional>
#include<climits>
#include<iomanip>
using namespace std;
#define rep(i,from,to) for(int i=(int)(from);i<=(int)(to);++i)
#define rev(i,from,to) for(int i=(int)(from);i>=(int)(to);--i)
#define For(i,to) for(int i=0;i<(int)(to);++i)
#define see(x) (cerr<<(#x)<<'='<<(x)<<endl)
#define printCase(i) printf("Case %d: ", i)
#define endl '\n'
#define coutP(i) cout<<fixed<<setprecision(i)
#ifdef D
    void dbg() {cerr << "\n";}
    template<typename T, typename... A> void dbg(T a, A... x) {cerr << a << ' '; dbg(x...);}
    #define logs(x...) {cerr << #x << " -> "; dbg(x);}
#else
    #define logs(...) {}
#endif
#define mmst(a,x) memset(a, x, sizeof(a))
typedef long long ll; typedef long double ld; typedef double db;
typedef pair<ll,ll> pll; typedef pair<int,int> pii; typedef vector<ll> vll; typedef vector<int> vint;
template <typename T> vector<T>& operator<< (vector<T> &v, T &x) { v.emplace_back(x); return v; }
struct MyIn { 
    template <typename T> MyIn& operator>> (T &x) { x=0;bool s=0;char c=getchar();while(c>'9'||c<'0'){if(c=='-')s=1;c=getchar();}while(c>='0'&&c<='9'){x=x*10+c-'0';c=getchar();}if(s)x=-x;return (*this); } 
} rin;
const int N2 = 112; const int N3 = 1123; const int N4 = 11234; const int N5 = 112345; const int N6 = 1123456; const int N7 = 11234567;
#define whileneof while((cin >> ws) && (~cin.peek()))

vector<string> game;
bool mark[N2][N2];
int n, m;

int find(int x, int y) {
    int ans = 1;
    char h = game[x][y];

    int i, j;

    i = x, j = y;
    while (j + 1 < m) if (game[i][++j] >= h) break;
    ans *= abs(j - y);
    
    i = x, j = y;
    while (j - 1 >= 0) if (game[i][--j] >= h) break;
    ans *= abs(j - y);

    i = x, j = y;
    while (i + 1 < n) if (game[++i][j] >= h) break;
    ans *= abs(i - x);

    i = x, j = y;
    while (i - 1 >= 0) if (game[--i][j] >= h) break;
    ans *= abs(i - x);

    return ans;


}

int main() {
    freopen("8.in", "r", stdin);

    whileneof {
        string s;
        cin >> s;
        game.push_back(s);
    }

    n = game.size();
    m = game[0].size();

    int ans = 0;

    For(i, n) For(j, m) {
        ans = max(ans, find(i, j));
    }
     cout << ans << endl;

}