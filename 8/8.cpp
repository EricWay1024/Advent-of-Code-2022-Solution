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

int main() {
    freopen("8.in", "r", stdin);

    whileneof {
        string s;
        cin >> s;
        game.push_back(s);
    }

    int n = game.size();
    int m = game[0].size();

    For(i, n) {
        char x = game[i][0];
        mark[i][0] = 1;
        rep(j, 1, m-1) {
            if (game[i][j] > x) {
                mark[i][j] = 1;
                x = game[i][j];
            }
        } 
    }

    For(i, n) {
        char x = game[i][m-1];
        mark[i][m-1] = 1;
        rev(j, m-2, 0) {
            if (game[i][j] > x) {
                mark[i][j] = 1;
                x = game[i][j];
            }
        }
    }

    For(j, m) {
        char x = game[0][j];
        mark[0][j] = 1;
        rep(i, 1, n-1) {
            if (game[i][j] > x) {
                mark[i][j] = 1;
                x = game[i][j];
            }
        }
    }

    For(j, m) {
        char x = game[n-1][j];
        mark[n-1][j] = 1;
        rev(i, n-2, 0) {
            if (game[i][j] > x) {
                mark[i][j] = 1;
                x = game[i][j];
            }
        }
    }

    int ans = 0;

    For(i, n) For(j, m) {
        ans += mark[i][j];
    }
     cout << ans << endl;

}