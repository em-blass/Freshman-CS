//Bubble sorting: compares two adjacent things and swaps them if out of order
//https://webapps.western.edu/faculty/dschuster/freeJavaBook/12_Arrays_II.pdf page 5

//Array: 12 -7 38 62 -18 44 71 15
//If sorting from left to right, first pass puts biggest on the far right
//Second pass, second biggest on far right
//If array of 8, needs 7 passes

/*
for n-1 passes
{
	for every adjacent pair in unsorted part of array
	{
		if elements out of order, swap
	}
}
*/

#include <iostream>
using namespace std;

const int MAX = 10;


void swap(int& a, int& b) {

    int temp = a;

    a = b;

    b = temp;

} //swap


void bubbleSort(int x[]) {

    for (int pass = 0; pass < MAX - 1; pass++) {

        for (int pos = 0; pos < MAX - 1 - pass; pos++) {

            if (x[pos] > x[pos + 1])

                swap(x[pos], x[pos + 1]);

        } //pos

    } //pass

} //bubbleSort


void display(int x[MAX]) {

    for (int i = 0; i < MAX; i++)

        cout << x[i] << "  ";

    cout << endl;

}


int main() {

    int m[MAX] = { -8, 45, 22, 76, 51, 22, -30, 85, 33, 12 };

    display(m);

    bubbleSort(m);

    display(m);

}