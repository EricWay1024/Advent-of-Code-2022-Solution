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


struct Node {
    bool type;
    vector<int> son;
    string name;
    int size;
    int fa;

    Node (bool t, string n, int s, int f) {
        type = t;
        name = n;
        size = s;
        fa = f;
    }
};

vector<Node> a;
int cur = 0;

void addSonToCurrent(int type, string name, int size) {
    a.push_back(Node(type, name, size, cur));
    a[cur].son.push_back(a.size() - 1);
}

int ans = INT32_MAX;
int unused;

void dfs(int u) {
    if (a[u].type == 1) return;
    for (int v: a[u].son) {
        dfs(v);
        a[u].size += a[v].size;
    }
}

void dfs2(int u) {
    if (a[u].type == 1) return;
    for (int v: a[u].son) {
        dfs2(v);
    }

    if (unused + a[u].size >= 30000000) {
        ans = min(ans, a[u].size);
    }
}


int main() {
#ifdef D
    freopen("7.in", "r", stdin);
    clock_t TIMEA = clock();
#endif

    a.push_back(Node(0, "/", 0, 0));

    whileneof {
        string s;
        getline(cin, s);
        istringstream iss(s);
        string t;

        if (s[0] == '$') {
            iss >> t >> t;
            if (t == "cd") {
                iss >> t;
                if (t == "/") cur = 0;
                else if (t == "..") cur = a[cur].fa;
                else {
                    for (int v: a[cur].son) {
                        if (a[v].name == t) {
                            cur = v;
                            break;
                        }
                    }
                }
            }
        }

        else {
            if (s[0] == 'd') {
                iss >> t >> t;
                addSonToCurrent(0, t, 0);
            } else {
                int sz;
                iss >> sz >> t;
                addSonToCurrent(1, t, sz);
            }
        }
    }

    dfs(0);
    unused = 70000000 - a[0].size;
    dfs2(0);

    std::cout << ans << endl;

#ifdef D
    float TIMEUSED = (float)(clock()-TIMEA)/CLOCKS_PER_SEC;
    if (TIMEUSED > 1e-3) printf("\n# Time consumed: %.3fs.\n", TIMEUSED);
#endif
    return 0;
}

