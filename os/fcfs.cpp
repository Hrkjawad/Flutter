#include <bits/stdc++.h>
using namespace std;

int main()
{

    int Process;
    cout << "Enter number of process: ";
    cin >> Process;
    vector<pair<int, int>> bt;

    for (int i = 0; i < Process; i++)
    {
        cout << "P" << i + 1 << " BT: ";
        int x;
        cin >> x;
        bt.push_back({x, i});
    }

    int wt[20], tat[20];
    double avgWt, avgTat;

    wt[0] = 0;
    tat[0] = 0;

    tat[0] = wt[0] + bt[0].first;
    avgTat = tat[0];

    for (int i = 1; i < Process; i++)
    {
        wt[i] = wt[i - 1] + bt[i - 1].first;
        avgWt += wt[i];

        tat[i] = wt[i] + bt[i].first;
        avgTat += tat[i];
    }

    avgTat /= Process;
    avgWt /= Process;

    cout << "Processes "
         << " Burst time "
         << " Waiting time "
         << " Turn around time\n";
    for (int i = 0; i < Process; i++)
    {
        cout << "P" << bt[i].second + 1 << "\t\t" << bt[i].first << "\t" << wt[i] << "\t\t" << tat[i] << endl;
    }

    cout << "Avg waiting time: " << avgWt << endl
         << "Avg tat time: " << avgTat << endl;
}
