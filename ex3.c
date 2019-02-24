#include <stdio.h>

int NchooseK(int n, int k) {
    if(k == 0 || k == n) return 1;
    return NchooseK(n-1, k-1) + NchooseK(n-1, k);
}

int main() {
    int n, k;
    while (1) {
        printf("Enter two integers (for n and k) separated by space:\n");
        scanf("%d%d", &n, &k);
        if (n == 0 && k == 0) break;
        printf("%d\n", NchooseK(n, k));
    }
    printf("%d\n", 1);
}
