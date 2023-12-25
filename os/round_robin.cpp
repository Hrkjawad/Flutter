#include <bits/stdc++.h>
using namespace std;
int main()
{
    int Process;
    cout << "Enter the number of process: ";
    cin >> Process;
    deque<pair<int, int>> dq;
    int bt[Process + 5];
    for (int i = 0; i < Process; i++)
    {
        cout << "P" << i + 1 << " BT: ";
        cin >> bt[i];
        dq.push_back({bt[i], i});
    }
    int wt[Process + 5], tat[Process + 5];
    double avgWt, avgTat;
    cout << "Enter Time Quentum: ";
    int TQ;
    cin >> TQ;
    for (int i = 0; i < Process; i++)
    {
        wt[i] = 0;
    }
    while (!dq.empty())
    {
        int x = dq.front().first;
        int indx = dq.front().second;
        dq.pop_front();
        for (int i = 0; i < dq.size(); i++)
        {
            wt[dq[i].second] += min(TQ, x);
        }
        x -= TQ;
        if (x > 0)
        {
            dq.push_back({x, indx});
        }
    }
    tat[0] = wt[0] + bt[0];
    avgTat = tat[0];
    avgWt = wt[0];
    for (int i = 1; i < Process; i++)
    {
        avgWt += wt[i];
        tat[i] = wt[i] + bt[i];
        avgTat += tat[i];
    }
    avgTat /= Process;
    avgWt /= Process;
    cout << "PROCESS\t\t"
         << "BT\t"
         << "WT\t"
         << "TAT" << endl;
    for (int i = 0; i < Process; i++)
    {
        cout << "P" << i << "\t\t" << bt[i] << "\t"
             << wt[i] << "\t" << tat[i] << endl;
    }
    cout << "Avg waiting time: " << avgWt << endl
         << "Avg tat time: " << avgTat << endl;
}
