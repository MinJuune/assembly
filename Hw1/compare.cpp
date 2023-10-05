#include <iostream>
using namespace std;

int main() {
	int first = 30;
	int second = 10;
	int temp = 0;

	if (first > second) {
		temp = first;
		first = second;
		second = temp;
	}
	cout << "sorted value=" << first << "," << second << endl;
}
