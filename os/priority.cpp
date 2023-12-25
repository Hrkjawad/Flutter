#include <bits/stdc++.h>
using namespace std;
int main()
{
    int process;
    cout << "Enter the number of processes: ";
    cin >> process;
    vector<pair<int, pair<int, int>>> BT;
    for (int i = 0; i < process; i++)
    {
        cout << "P" << i + 1 << " Burst time: ";
        int BurstTime, priority;
        cin >> BurstTime;
        cout << "P" << i + 1 << " Priority: ";
        cin >> priority;
        BT.push_back({priority, {i, BurstTime}});
    }
    sort(BT.begin(), BT.end());
    int WT[20], TAT[20];
    double avgWT, avgTAT;
    WT[0] = 0;
    avgWT = WT[0];
    TAT[0] = WT[0] + BT[0].second.second;
    avgTAT = TAT[0];
    for (int i = 1; i < process; i++)
    {
        WT[i] = WT[i - 1] + BT[i - 1].second.second;
        avgWT += WT[i];

        TAT[i] = WT[i] + BT[i].second.second;
        avgTAT += TAT[i];
    }
    avgWT /= process;
    avgTAT /= process;
    cout << "Processes "
         << " Burst Time "
         << " Waiting Time "
         << " Turn Around Time" << endl;
    for (int i = 0; i < process; i++)
    {
        cout << "P" << BT[i].second.first + 1 << "\t\t" << BT[i].second.second << "\t" << WT[i] << "\t\t" << TAT[i] << "\t" << endl;
    }
}
