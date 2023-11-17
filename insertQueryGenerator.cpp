/*Insert Query Generator for MySQL*/

#include <bits/stdc++.h>
using namespace std;

// ==================================================================================================================================
// ==================================================================================================================================
// ==================================================================================================================================

// CHANGE this fields
// and PASTE the table in input.txt
// WITHOUT the heading row

int row = 6;
int col = 4;
string tableName = "Job";
vector<string> rowInfo = { "VARCHAR", "VARCHAR", "NUMBER", "NUMBER"};

// rowInfo can be one of the following:
// VARCHAR
// NUMBER
// DATE

// NOTE: If the input table has VARCHAR column with more than 1
// element in the same box, then put an '_' between the two elements
// Example: NEHRU PLACE => NEHRU_PLACE in input.txt
// Also remove '_' from output.txt

// ==================================================================================================================================
// ==================================================================================================================================
// ==================================================================================================================================

#pragma LLVM optimize("Os")
#pragma LLVM optimize("Ofast")
#pragma LLVM target("avx,avx2,fma")

class Solution {
public:

	Solution()
	{
		ios_base::sync_with_stdio(false);
		cin.tie(0);
		cout.tie(0);
	}


	void processDate(string &date) {

		string DD = "";
		string YY = "";
		string MM = "";

		int i = 0;
		int info = 0;

		vector <string> months = {"JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"};

		while (date[i] != NULL) {
			char temp = date[i];

			if (temp == '-') {
				info++;
				i++;
				continue;
			}

			if (info == 0) {
				DD += temp;
			}

			else if (info == 1) {
				MM += temp;
			}

			else if (info == 2) {
				YY += temp;
			}

			i++;
		}

		if (DD.size() == 1) {
			DD = "0" + DD;
		}

		transform(MM.begin(), MM.end(), MM.begin(), ::toupper);

		for (int i = 0; i < 12; ++i)
		{

			if (MM == months[i]) {
				int month = i + 1;
				MM = to_string(month);
				if (MM.size() == 1) MM = "0" + MM;
				break;
			}
		}

		int yr = stoi(YY);

		if (yr <= 30) {
			YY = "20" + YY;
		}

		else if (yr > 30) {
			YY = "19" + YY;
		}

		string final = YY + MM + DD;

		cout << final;

		return ;
	}

	void processInfo(int cnt, int row, int col, vector<string> &rowInfo) {

		int colNo = 0;
		int rowNo = 0;

		string var = "VARCHAR";
		string num = "NUMBER";
		string dat = "DATE";

		cout << "INSERT INTO ";
		cout << tableName;
		cout << "\n";
		cout << "VALUES\n";
		cout << "(";

		while (cnt) {
			string temp;
			cin >> temp;

			if (rowInfo[colNo] == num) cout << temp;

			else if (rowInfo[colNo] == var) {
				cout << "\"";
				cout << temp;
				cout << "\"";
			}

			else if (rowInfo[colNo] == dat) {
				processDate(temp);
			}

			colNo++;
			if (colNo != col) {
				cout << ", ";
			}

			else if (colNo == col) {
				colNo = 0;

				rowNo++;
				if (rowNo != row) {
					cout << "),";
					cout << endl;
					cout << "(";
				}

				else if (rowNo == row) {
					break;
				}
			}
			cnt--;
		}

		cout << ");";

		cout << endl << "SELECT * FROM ";
		cout << tableName;
		cout << ";";
	}

};

int main() {

#ifndef ONLINE_JUDGE
	freopen("input.txt", "r", stdin);
	freopen("output.txt", "w", stdout);
#endif

	Solution f;

	int cnt = row * col;

	f.processInfo(cnt, row, col, rowInfo);

	return 0;
}