#include <bits/stdc++.h>
using namespace std;
int main()
{
    vector<pair<int, int>> bt;
    int n, i, wt[20], tat[20];
    float avgWT, avgTAT;

    cout << "Enter the number of process: ";
    cin >> n;

    cout << "Enter Burst Time for - " << endl;

    for (i = 0; i < n; i++)
    {
        cout << "Process " << i + 1 << ": ";
        int BT;
        cin >> BT;
        bt.push_back({BT, i});
    }

    sort(bt.begin(), bt.end());

    wt[0] = avgWT = 0;
    tat[0] = avgTAT = bt[0].first;

    for (i = 1; i < n; i++)
    {
        wt[i] = wt[i - 1] + bt[i - 1].first;
        avgWT += wt[i];

        tat[i] = wt[i] + bt[i].first;
        avgTAT += tat[i];
    }

    avgWT = avgWT / n;
    avgTAT = avgTAT / n;

    cout << "\nPROCESS"
         << "\t\tBT"
         << "\tWT"
         << "\tTAT" << endl;
    for (i = 0; i < n; i++)
    {
        cout << "P" << bt[i].second << "\t\t" << bt[i].first << "\t" << wt[i] << "\t" << tat[i] << endl;
    }

    cout << fixed << setprecision(2);
    cout << "\nAverage Waiting Time: " << avgWT;
    cout << "\nAverage Turnaround Time: " << avgTAT << endl;
}