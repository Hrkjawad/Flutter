#include <iostream>
using namespace std;

int main()
{
    int process, resource;

    cout << "Enter the number of processes: ";
    cin >> process;

    cout << "Enter the number of resources: ";
    cin >> resource;

    int Allocation[process][resource];
    cout << "---Enter the Allocation Matrix---\n";
    for (int i = 0; i < process; ++i)
    {
        cout << "P" << i << ": ";
        for (int j = 0; j < resource; ++j)
        {
            cin >> Allocation[i][j];
        }
    }

    int max[process][resource];
    cout << "---Enter the Max Matrix---\n";
    for (int i = 0; i < process; ++i)
    {
        cout << "P" << i << ": ";
        for (int j = 0; j < resource; ++j)
        {
            cin >> max[i][j];
        }
    }

    int totalInstances[resource];
    cout << "Enter the Total Instances: ";
    for (int i = 0; i < resource; ++i)
    {
        cin >> totalInstances[i];
    }

    int available[resource];
    for (int j = 0; j < resource; ++j)
    {
        int totalAllocation = 0;
        for (int i = 0; i < process; ++i)
        {
            totalAllocation += Allocation[i][j];
        }
        available[j] = totalInstances[j] - totalAllocation;
    }

    int finished[process], finalSafeSequence[process],
        index = 0;

    for (int k = 0; k < process; k++)
    {
        finished[k] = 0;
    }
    int need[process][resource];

    for (int i = 0; i < process; i++)
    {
        for (int j = 0; j < resource; j++)
            need[i][j] = max[i][j] - Allocation[i][j];
    }

    int y = 0;

    for (int k = 0; k < process; k++)
    {
        for (int i = 0; i < process; i++)
        {
            if (finished[i] == 0)
            {
                int flag = 0;

                for (int j = 0; j < resource; j++)
                {
                    if (need[i][j] > available[j])
                    {
                        flag = 1;
                        break;
                    }
                }

                if (flag == 0)
                {
                    finalSafeSequence[index++] = i;
                    for (y = 0; y < resource; y++)
                        available[y] += Allocation[i][y];
                    finished[i] = 1;
                }
            }
        }
    }

    int flag = 1;
    for (int i = 0; i < process; i++)
    {
        if (finished[i] == 0)
        {
            flag = 0;
            cout << "The given sequence is not safe";
            break;
        }
    }

    if (flag == 1)
    {
        cout << "The SAFE Sequence is: " << endl;
        for (int i = 0; i < process - 1; i++)
            cout << " P" << finalSafeSequence[i] << " > ";
        cout << " P" << finalSafeSequence[process - 1] << endl;
    }

    return 0;
}
